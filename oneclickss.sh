#!/bin/bash
# Script function : One click to install shadowscoks.
# Script version : 0.1
# Author : yoo@yoo.hk
# Made : 2013.08.27
# Support : Only CentOS 6.0+

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
LANG=C

export PATH
export LANG

if [ $1 = "uninstall" ];
then
echo "Uninstall all node and shadowsocks"
rm -rf ./node* ./shadowsocks* >> installss.log 2>&1
sed -i '/ssserver/d' /etc/rc.d/rc.local >> installss.log 2>&1
kill -9 $(ps -ef | grep ssserver | awk '{print $2}' | head -n 1) >> installss.log 2>&1
rm -rf ./installss.log
echo "Unnstall success"
exit 0
fi

SERVERPORT=$1
LOCALPORT=$2
PASSWORD=$3

echo "Stop iptables service"
service iptables stop >> installss.log 2>&1

if [ $# -ne 3 ];
then
echo "You do not enter your setting like => sh oneclickss.sh serverport localport password"
SERVERPORT=8989
LOCALPORT=1999
PASSWORD="yoofuckgfw"
echo "Your setting is default"
fi

yum -y install wget unzip >> installss.log 2>&1
echo "Install environment success"

wget http://nodejs.org/dist/v0.10.17/node-v0.10.17-linux-x86.tar.gz >> installss.log 2>&1
wget https://codeload.github.com/clowwindy/shadowsocks-nodejs/zip/master >> installss.log 2>&1
echo "Download nodejs and shadowsocks success"

tar -zxvf node-v0.10.17-linux-x86.tar.gz >> installss.log 2>&1
unzip master >> installss.log 2>&1
echo "Tar and unzip success"

rm -rf master node-v0.10.17-linux-x86.tar.gz >> installss.log 2>&1
echo "Remove all the tar success"

mv node-v0.10.17-linux-x86 node >> installss.log 2>&1
mv shadowsocks-nodejs-master shadowsocks >> installss.log 2>&1
echo "Rename to node and shadowsocks success"

CONFIGPATH=$(pwd)/shadowsocks/config.json
echo "Your config path is $CONFIGPATH"
#cp ./shadowsocks/config.json $CONFIGPATH

SERVERIP=$(ifconfig | grep "inet addr" | awk '{print $2}'| cut -d ':' -f 2 | grep -v 127.0.0.1 | head -n 1)
sed "s/127\.0\.0\.1/$SERVERIP/g" -i $CONFIGPATH
echo "Your server ip is $SERVERIP"

sed "s/8388/$SERVERPORT/g" -i $CONFIGPATH
echo "Your server port is $SERVERPORT"

sed "s/1080/$LOCALPORT/g" -i $CONFIGPATH
echo "Your local port is $LOCALPORT"

sed "s/barfoo\!/$PASSWORD/g" -i $CONFIGPATH
echo "Your password is $PASSWORD"

echo "$(pwd)/node/bin/node $(pwd)/shadowsocks/bin/ssserver > /dev/null 2>&1 &" >> /etc/rc.d/rc.local
source /etc/rc.d/rc.local

echo "End success"
