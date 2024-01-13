# 宝塔Linux历史版本存档
由于宝塔官方的历史版本下载链接已不在官网显示,有些站长又想用旧版本的宝塔，故搜集了所有官方历史版本<br/>
本仓库所有版本的压缩包通过 download.bt.cn 下载，绝对安全

# 版本说明
* 7.4.2版本有pma漏洞
* 7.4.5之后的版本（不包括7.4.5）需要强制绑定手机号
* 7.2.0之前的版本不推荐使用，因为代码改动过大，降级后无法正常使用
* 8.0.5及以后的版本请在Releases自取<br/><br/>
修改示例：将 https://github.com/Baota-Panel/BT-Panel-Linux/blob/main/LinuxPanel/LinuxPanel-8.0.4.zip 部分<br/><br/>修改为 https://github.com/Baota-Panel/BT-Panel-Linux/releases/download/8.0.5/LinuxPanel-8.0.5.zip

# 使用方法
[宝塔回退7.4.5之前版本教程](https://blog.csdn.net/saygoodbyeyo/article/details/132534437)

[宝塔回退7.7.0版本，修改js绕过登陆限制](https://blog.csdn.net/saygoodbyeyo/article/details/132540562)

[宝塔免费使用专业版插件教程](https://blog.csdn.net/saygoodbyeyo/article/details/132542724)

### 安装宝塔

先使用宝塔官方的安装脚本安装最新版宝塔
* Centos安装命令：

```
yum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec
```
* Ubuntu/Deepin安装命令：
```
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh ed8484bec
```
* Debian安装命令：
```
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh ed8484bec
```
* 万能安装命令：
```
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec 
```
* 国产龙芯架构安装命令:
```
wget -O install_panel.sh https://download.bt.cn/install/0/loongarch64/loongarch64_install_panel.sh && bash install_panel.sh ed8484bec
```

### 降级
* 下载curl包
```
yum install curl
```
Ubuntu/Debian执行这个
```
sudo apt install curl
```
* 下载离线包（此处以8.0.4为例）
```
curl -L https://github.com/Baota-Panel/BT-Panel-Linux/blob/main/LinuxPanel/LinuxPanel-8.0.4.zip\?raw\=true > LinuxPanel-8.0.4.zip
```
* 解压压缩包
```
unzip LinuxPanel-8.0.4.zip
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
cd .. && rm -f LinuxPanel-8.0.4.zip && rm -rf panel
```
* 重载宝塔
```
bt 4
```

# 注意事项

* 宝塔降级后会出现密码不正确的情况，修改密码即可（bt 5）
* 为防止宝塔自动升级，建议将宝塔修改为离线模式，进入宝塔面板，选择面板设置 -> 离线模式即可，并修改hosts
```
echo "127.0.0.1 www.bt.cn" >> /etc/hosts
```

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
