#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

NODE_FILE_CHECK=$(cat /www/server/panel/data/node.json |grep 125.88.182.172)
if [ "${NODE_FILE_CHECK}" ];then
	rm -f /www/server/panel/data/node.json
fi

if [ ! -d /www/server/panel/BTPanel ];then
	echo "============================================="
	echo "错误, 5.x不可以使用此命令升级!"
	echo "5.9平滑升级到6.0的命令：curl http://download.bt.cn/install/update_to_6.sh|bash"
	exit 0;
fi

if [ ! -f "/www/server/panel/pyenv/bin/python3" ];then
	echo "============================================="
	echo "错误, 当前面板过旧/py-2.7/无pyenv环境，无法升级至最新版面板"
	echo "请截图发帖至论坛www.bt.cn/bbs求助"
	exit 0;
fi
Centos6Check=$(cat /etc/redhat-release | grep ' 6.' | grep -iE 'centos|Red Hat')
if [ "${Centos6Check}" ];then
	echo "Centos6不支持升级宝塔面板，建议备份数据重装更换Centos7/8安装宝塔面板"
	exit 1
fi 

# public_file=/www/server/panel/install/public.sh
# publicFileMd5=$(md5sum ${public_file} 2>/dev/null|awk '{print $1}')
# md5check="acfc18417ee58c64ff99d186f855e3e1"
# if [ "${publicFileMd5}" != "${md5check}"  ]; then
# 	wget -O Tpublic.sh http://download.bt.cn/install/public.sh -T 2 -t 1;
# 	publicFileMd5=$(md5sum Tpublic.sh 2>/dev/null|awk '{print $1}')
# 	if [ "${publicFileMd5}" == "${md5check}"  ]; then
# 		\cp -rpa Tpublic.sh $public_file
# 	fi
# 	rm -f Tpublic.sh
# fi
# . $public_file
#download_Url=$NODE_URL

Centos8Check=$(cat /etc/redhat-release | grep ' 8.' | grep -iE 'centos|Red Hat')
if [ "${Centos8Check}" ];then
	if [ ! -f "/usr/bin/python" ] && [ -f "/usr/bin/python3" ] && [ ! -d "/www/server/panel/pyenv" ]; then
		ln -sf /usr/bin/python3 /usr/bin/python
	fi
fi

mypip="pip"
env_path=/www/server/panel/pyenv/bin/activate
if [ -f $env_path ];then
	mypip="/www/server/panel/pyenv/bin/pip"
fi

if [ -f "/www/server/panel/data/down_url.pl" ];then
	D_NODE_URL=$(cat /www/server/panel/data/down_url.pl|grep bt.cn)
fi

if [ -z "${D_NODE_URL}" ];then
	D_NODE_URL="download.bt.cn"
fi

download_Url=$D_NODE_URL

wget -O fix_install.sh $download_Url/tools/fix_install.sh
nohup bash fix_install.sh > /www/server/panel/install/fix.log 2>&1 &

setup_path=/www
if [ -f "/www/server/panel/data/node_url.pl" ] && [ -f "/usr/bin/jq" ];then
	WWW_NODE=$(cat /www/server/panel/data/node_url.pl|jq -r '.["www-node"].url')
	version=$(curl -Ss --connect-timeout 12 -m 2 https://${WWW_NODE}/api/panel/get_version)
fi
VERSION_CHECK=$(echo $version |grep 8.0)
if [ -z "$VERSION_CHECK" ];then
	version=$(curl -Ss --connect-timeout 12 -m 2 https://www.bt.cn/api/panel/get_version)
fi
VERSION_CHECK=$(echo $version |grep 8.0)
if [ -z "$VERSION_CHECK" ];then
	version='8.0.5'
fi
armCheck=$(uname -m|grep arm)
if [ "${armCheck}" ];then
	version='7.7.0'
fi

if [ "$1" ];then
	version=$1
fi

wget -T 20 -O /tmp/panel.zip $download_Url/install/update/LinuxPanel-${version}.zip
dsize=$(du -b /tmp/panel.zip|awk '{print $1}')
if [ $dsize -lt 10240 ];then
	echo "获取更新包失败，请稍后更新或联系宝塔运维"
	exit;
fi

unzip -o /tmp/panel.zip -d $setup_path/server/ > /dev/null
rm -f /tmp/panel.zip
cd $setup_path/server/panel/
check_bt=`cat /etc/init.d/bt`
if [ "${check_bt}" = "" ];then
	rm -f /etc/init.d/bt
	wget -O /etc/init.d/bt $download_Url/install/src/bt7.init -T 20
	chmod +x /etc/init.d/bt
fi
echo "=============================================================="
echo "正在修复面板依赖问题"
rm -f /www/server/panel/*.pyc
rm -f /www/server/panel/class/*.pyc
#pip install flask_sqlalchemy
#pip install itsdangerous==0.24
btpip install natsort
pip_list=$($mypip list)
request_v=$(btpip list 2>/dev/null|grep "requests "|awk '{print $2}'|cut -d '.' -f 2)
if [ "$request_v" = "" ] || [ "${request_v}" -gt "28" ];then
	$mypip install requests==2.27.1
fi

openssl_v=$(echo "$pip_list"|grep pyOpenSSL)
if [ "$openssl_v" = "" ];then
	$mypip install pyOpenSSL
fi

#cffi_v=$(echo "$pip_list"|grep cffi|grep 1.12.)
#if [ "$cffi_v" = "" ];then
#	$mypip install cffi==1.12.3
#fi

pymysql=$(echo "$pip_list"|grep pymysql)
if [ "$pymysql" = "" ];then
	$mypip install pymysql
fi
GEVENT_V=$(btpip list 2> /dev/null|grep "gevent "|awk '{print $2}'|cut -f 1 -d '.')
if [ "${GEVENT_V}" -le "1" ];then
    /www/server/panel/pyenv/bin/pip3 install -I gevent
fi

BROTLI_C=$(btpip list 2> /dev/null |grep Brotli)
if [ -z "$BROTLI_C" ]; then
    btpip install brotli
fi

PYMYSQL_C=$(btpip list 2> /dev/null |grep PyMySQL)
if [ -z "$PYMYSQL_C" ]; then
    btpip install PyMySQL
fi

btpip uninstall enum34 -y
btpip install geoip2==4.7.0
btpip install pandas

pymysql=$(echo "$pip_list"|grep pycryptodome)
if [ "$pymysql" = "" ];then
	$mypip install pycryptodome
fi

echo "修复面板依赖完成！"
echo "==========================================="

#psutil=$(echo "$pip_list"|grep psutil|awk '{print $2}'|grep '5.7.')
#if [ "$psutil" = "" ];then
#	$mypip install -U psutil
#fi

if [ -d /www/server/panel/class/BTPanel ];then
	rm -rf /www/server/panel/class/BTPanel
fi

echo "==========================================="
echo "正在更新面板文件..............."
sleep 1
echo "更新完成！"
echo "==========================================="

chattr -i /etc/init.d/bt
chmod +x /etc/init.d/bt
echo "====================================="
rm -f /dev/shm/bt_sql_tips.pl
kill $(ps aux|grep -E "task.pyc|main.py"|grep -v grep|awk '{print $2}')
/etc/init.d/bt start
echo 'True' > /www/server/panel/data/restart.pl
pkill -9 gunicorn &
echo "已成功升级到[$version]${Ver}";



