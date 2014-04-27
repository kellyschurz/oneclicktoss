oneclicktoss
============

一键部署shadowsocks

oneclicktoss.sh support CentOS 6.0+

debiantoss.sh support DebianOS 6.0+

在你想要安装的目录中，下载脚本到当前目录：（注意：请进入脚本所在目录以root权限执行本脚本，否则会出错！）

wget --no-check-certificate https://raw.github.com/kellyschurz/oneclicktoss/master/oneclickss.sh

---或者---

wget --no-check-certificate https://raw.github.com/kellyschurz/oneclicktoss/dev/debiantoss.sh

直接使用，不加参数则是默认设置安装：

sh oneclickss.sh

---或者---

sh debiantoss.sh

默认服务器端口：1998

默认客户端端口：1999

默认密码：ilovechina

不建议使用默认设置...

自定义三个参数分别是服务器端口、本地端口、自定义密码：

（执行脚本后，会全自动安装以及加入开机启动并运行shadowscoks，之后本机使用客户端软件即科学上网。）

sh oneclickss.sh serverport localport password

---或者---

sh debiantoss.sh serverport localport password

客户端下载：

http://sourceforge.net/projects/shadowsocksgui/files/dist/

winxp => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.3.1-win-ia32.7z/download

osx    => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.3.1-osx-ia32.7z/download

linux  => http://sourceforge.net/projects/shadowsocksgui/files/dist/shadowsocks-gui-0.1.3-linux-ia32.7z/download

浏览器插件：

chrome：SwitchySharp

firefox：AutoProxy

卸载软件并终止已有的进程：

sh oneclickss.sh uninstall

---或者---

sh debiantoss.sh uninstall

小技巧1（仅供尝试）：mount tmpfs /tmp -t tmpfs -o size=200m ，挂载200m内存到/tmp目录，然后在/tmp目录安装，效率更佳；小内存请勿操作！

小技巧2（仅供尝试）：配置ss的全局代理...

windows客户端可以使用全局代理软件，例如Proxifier，配置其代理为ss监听的本地ip和端口；（已测）

linux客户端可以使用自身带有的代理上网，配置其代理也是为ss监听的本地ip和端口；

原理：本地全局代理软件将所有信息转发到ss监听的本地ip和端口，ss监听后外发。

温馨提醒：为保证链接的有效性，自动安装的nodejs和shadowsocks可能是较旧的版本；另外，本人未更动以上两个软件的任何细节，可以放心使用...绿色安装，绿色卸载

注：oneclickss.sh 增加了sh oneclickss.sh restart 功能，并加入了每日凌晨1点自动重启ss的功能；

最新的shadowsocks由 http://www.shadowsocks.org/ 支持；

最新的nodejs由 http://nodejs.org/ 支持；

如有错漏，欢迎大家自行修改...
