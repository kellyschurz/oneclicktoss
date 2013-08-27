oneclicktoss
============

oneclicktoss V1.0

Only support CentOS 6.0+

在你想要安装的目录中，下载脚本到当前目录：

wget https://raw.github.com/kellyschurz/oneclicktoss/master/oneclickss.sh

注意：请进入脚本所在目录执行本脚本，否则会出错！

直接使用，不加参数则是默认设置安装：

sh oneclickss.sh

默认服务器端口：8989

默认客户端端口：1999

默认密码：yoofuckgfw

不建议使用默认设置...

自定义三个参数分别是服务器端口、本地端口、自定义密码：

sh oneclickss.sh serverport localport password

执行脚本后，会全自动安装以及加入开机启动并运行shadowscoks，之后本机使用客户端软件即科学上网。

客户端下载：http://sourceforge.net/projects/shadowsocksgui/files/dist/

winxp => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.3.1-win-ia32.7z/download

osx => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.3.1-osx-ia32.7z/download

linux => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.1.3-linux-ia32.7z/download

浏览器插件：

chrome：SwitchySharp

firefox：AutoProxy

卸载软件并终止已有的进程：

sh oneclickss.sh uninstall

如有错漏，欢迎大家修改或邮件告知...
