# 宝塔Linux历史版本更新包存档
本仓库所有版本的更新包通过 `download.bt.cn` 下载

BTPanel 9.6.0正式版更新日志：[https://www.bt.cn/bbs/forum.php?mod=viewthread&tid=19376](https://www.bt.cn/bbs/forum.php?mod=viewthread&tid=19376)<br/>

注：正式版和LTS版本**不可混用**！！！

<!--
# 版本说明
* 7.4.2版本有pma漏洞
* 7.4.5之后的版本（不包括7.4.5）需要强制绑定手机号
* 7.2.0之前的版本不推荐使用，因为代码改动过大，降级后无法正常使用
* 8.0.5及以后的版本请在Releases自取
* <del>9.1.0及以后的版本的站点默认404＆502界面出现宝塔的ad（仅中国大陆机器显示，海外机器无影响，可自行修改网站目录内的404.html）</del>  <del>国内版宝塔目前已移除该AD</del> 9.3.0又加回来了，淦！<br/><br/>

# 使用方法
[宝塔回退7.4.5之前版本教程](https://blog.csdn.net/saygoodbyeyo/article/details/132534437)

[宝塔回退7.7.0版本，修改js绕过登陆限制](https://blog.csdn.net/saygoodbyeyo/article/details/132540562)

[宝塔免费使用专业版插件教程](https://blog.csdn.net/saygoodbyeyo/article/details/132542724)
-->

<!--
### 安装宝塔

先使用宝塔官方的安装脚本安装最新版宝塔

* Centos安装命令：[默认线路]
```
yum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec
```
* Centos安装命令：[电信线路]
```
yum install -y wget && wget -O install.sh https://cmcc1-node.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec
```
* Centos安装命令：[香港线路]
```
yum install -y wget && wget -O install.sh https://hk1-node.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec
```
* Centos安装命令：[欧美线路]
```
yum install -y wget && wget -O install.sh https://cf1-node.aapanel.com/install/install_6.0.sh && sh install.sh ed8484bec
```
---
* Ubuntu/Deepin安装命令：[默认线路]
```
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```
* Ubuntu/Deepin安装命令：[电信线路]
```
wget -O install.sh https://cmcc1-node.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```
* Ubuntu/Deepin安装命令：[香港线路]
```
wget -O install.sh https://hk1-node.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```
* Ubuntu/Deepin安装命令：[欧美线路]
```
wget -O install.sh https://cf1-node.aapanel.com/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```
---
* Debian安装命令：[默认线路]
```
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh ed8484bec
```
* Debian安装命令：[电信线路]
```
wget -O install.sh https://cmcc1-node.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh ed8484bec
```
* Debian安装命令：[香港线路]
```
wget -O install.sh https://hk1-node.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh ed8484bec
```
* Debian安装命令：[欧美线路]
```
wget -O install.sh https://cf1-node.aapanel.com/install/install-ubuntu_6.0.sh && bash install.sh ed8484bec
```
---
* 万能安装命令：[默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec 
```
* 万能安装命令：[电信线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://cmcc1-node.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://cmcc1-node.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 万能安装命令：[香港线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://hk1-node.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://hk1-node.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 万能安装命令：[欧美线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://cf1-node.aapanel.com/install/install_panel.sh;else wget -O install_panel.sh https://cf1-node.aapanel.com/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
---
* 国产龙芯架构安装命令:[默认线路]
```
wget -O install_panel.sh https://download.bt.cn/install/0/loongarch64/loongarch64_install_panel.sh && bash install_panel.sh ed8484bec
```
* 国产龙芯架构安装命令:[电信线路]
```
wget -O install_panel.sh https://cmcc1-node.bt.cn/install/0/loongarch64/loongarch64_install_panel.sh && bash install_panel.sh ed8484bec
```
* 国产龙芯架构安装命令:[香港线路]
```
wget -O install_panel.sh https://hk1-node.bt.cn/install/0/loongarch64/loongarch64_install_panel.sh && bash install_panel.sh ed8484bec
```
* 国产龙芯架构安装命令:[欧美线路]
```
wget -O install_panel.sh https://cf1-node.aapanel.com/install/0/loongarch64/loongarch64_install_panel.sh && bash install_panel.sh ed8484bec
```
-->

## 一键安装脚本

### V9.6.0
* 官方安装命令：(9.6.0稳定版) [通用安装脚本] [默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [通用安装脚本] [电信线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://cmcc1-node.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://cmcc1-node.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [通用安装脚本] [香港线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://hk1-node.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://hk1-node.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [通用安装脚本] [欧美线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://cf1-node.aapanel.com/install/install_panel.sh;else wget -O install_panel.sh https://cf1-node.aapanel.com/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [CentOS/OpenCloudOS/AlibabaCloud] [默认线路]
```
url=https://download.bt.cn/install/install_panel.sh;if [ -f /usr/bin/curl ];then curl -sSO $url;else wget -O install_panel.sh $url;fi;bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [Debian] [默认线路]
```
wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh && bash install_panel.sh ed8484bec
```
* 官方安装命令：(9.6.0稳定版) [Ubuntu/Deepin] [默认线路]
```
wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh && sudo bash install_panel.sh ed8484bec
```

### V11.0.0
* 官方安装命令：(11.0.0稳定版) [通用安装脚本] [默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_latest.sh;else wget -O install_latest.sh https://download.bt.cn/install/install_latest.sh;fi;bash install_latest.sh ed8484bec
```

### V9.5.0
* 官方安装命令：(9.5.0稳定版) [通用安装脚本] [默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_nearest.sh;else wget -O install_nearest.sh https://download.bt.cn/install/install_nearest.sh;fi;bash install_nearest.sh ed8484bec
```

### V9.4.0
* 官方安装命令：(9.4.0稳定版) [通用安装脚本] [默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_second_nearest.sh;else wget -O install_second_nearest.sh https://download.bt.cn/install/install_second_nearest.sh;fi;bash install_second_nearest.sh ed8484bec
```

### V9.6.0(企业版试用14天)
* 官方安装命令：(9.6.0稳定版) [通用安装脚本] [默认线路]
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_ltd.sh;else wget -O install_ltd.sh https://download.bt.cn/install/install_ltd.sh;fi;bash install_ltd.sh ed8484bec
```

<!--
### 降级
* 下载curl包
```
yum install curl
```
Ubuntu/Debian执行这个
```
sudo apt install curl
```
* 下载离线包（此处以8.0.5为例）
```
curl -L https://github.com/Baota-Panel/BT-Panel-Linux/releases/download/8.0.5/LinuxPanel-8.0.5.zip\?raw\=true > LinuxPanel-8.0.5.zip
```
* 解压压缩包
```
unzip LinuxPanel-*
```
* 切换到降级包目录
```
cd panel
```
* 执行更新脚本
```
bash update.sh
```
* 删除降级包
```
cd .. && rm -f LinuxPanel-*.zip && rm -rf panel
```
* 重载宝塔
```
bt 4
```

# 注意事项

* 宝塔降级后会出现密码不正确的情况，修改密码即可
```
bt 5
```
* 为防止宝塔自动升级，建议将宝塔修改为离线模式，进入宝塔面板，选择面板设置 -> 离线模式即可，并修改hosts

开启离线模式
```
echo "True" >/www/server/panel/data/not_network.pl
```
关闭离线模式
```
rm -rf /www/server/panel/data/not_network.pl && bt restart
```
修改hosts
```
echo "127.0.0.1 www.bt.cn" >> /etc/hosts
```

# 关于 8.0.4 升级 8.0.5

如果发现 8.0.4 升级到 8.0.5 出现部分站点、数据库丢失（别慌，数据还在） <br/>
找到 /www/server/panel/data 目录下的 default.db （用Navicat 打开），把 sites 跟 domain 部分的内容 <br/>
复制到 /www/server/panel/data/db 目录下的 site.db （用Navicat 打开），补全到 site 跟 domain <br/>
数据库同理，数据库是 /www/server/panel/data/db 目录下 database.db，然后重启面板即可！

讲解：宝塔从 8.0.5 开始 使用 site.db 作为站点跟数据库，导致出现8.0.5丢失部分站点跟数据库 而降级到8.0.4会默认读取default.db里的站点跟数据库<br/>
注意：注意！注意！注意！ 这个db要是坏了，面板就炸了，尤其是 default.db （操作之前请一定先备份好这几个db文件，防止出现问题可以回滚）<br/>
有可能也在用 default.db ，只是没把里面的 sites 和 database 内容给同步到 /www/server/panel/data/

# 宝塔降级常见问题

* Q：降级后显示宝塔无法启动，但无任何报错

  S：需要将markupsafe==2.0.1添加到panel目录下的requirements.txt文件中并执行
```
/www/server/panel/pyenv/bin/pip3 install -r /root/panel/requirements.txt
```
安装python库后重启面板即可

* Q：降级后登录宝塔面板时提示密码错误

  S：需要在终端修改宝塔密码

* Q：降级后登录宝塔面板时无法显示验证码图片或无法下载文件

  S：需要将/www/server/panel/BTPanel/\_\_init\_\_.py文件中的send_file函数中的cache_timeout参数名改为max_age
-->
