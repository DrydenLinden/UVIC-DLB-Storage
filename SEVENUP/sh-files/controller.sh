#Dryden Linden Bremner 2017-09-08
#The set up for the controller program
#this makes the initial folder setup for the 7up server
sudo mkdir /fs

sudo mkdir /fs/u02

sudo mkdir /fs/u02/apps_data

sudo mkdir /fs/u02/apps_ux

sudo mkdir /fs/u02/lost+found

sudo mkdir /fs/u02/sw_ux

sudo mkdir /fs/u02/apps_ux/wwwsvr

sudo mkdir /fs/u02/apps_ux/wwwadm
sudo mkdir /fs/u02/sw_ux/oracle
sudo mkdir /fs/u02/apps_ux/titan
sudo mkdir /fs/u02/apps_ux/titan/tomcat
sudo chmod 777 /fs
sudo chmod 777 /fs/u02
sudo chmod 777 /fs/u02/apps_data 
sudo chmod 777 /fs/u02/apps_ux 
sudo chmod 777 /fs/u02/lost+found 
sudo chmod 777 /fs/u02/sw_ux


sudo ln -s /fs/u02/apps_ux /apps_ux
sudo ln -s /fs/u02/apps_data /apps_data
sudo ln -s /fs/u02/sw_ux /sw_ux
sudo echo "wwwadm:x:778:778:apache user:/fs/u02/apps_ux/wwwadm:/bin/bash" >> /etc/passwd 
sudo echo "wwwsvr:x:779:778:apache service:/fs/u02/apps_ux/wwwsvr:/bin/bash" >> /etc/passwd
sudo echo "wwwadm:x:778:cdadmin,krclar_a,cnukin_a,adadmin,jcolladm,adadmin,cbussan_a,lmonte_a" >> /etc/group
sudo chown -R wwwadm:wwwadm /fs
sudo chown -R wwwadm:wwwadm /fs/u02
#!/bin/sh -x
#Flush/remove all existing rules
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F
sudo iptables -nL --line-numbers

#sudo iptables -A OUTPUT -j DROP
#iptables -I INPUT -s 192.168.10.24 -p tcp --dport ssh -j REJECT

#make the server/master key usable to ssh into the other zones
chmod 600 .ssh/id_rsa 
chmod 700 .ssh


# install the dependencys required to make tomcat
sudo yum -y install libcap-devel
sudo yum -y install gcc
sudo yum -y install java-1.8.0-openjdk-devel
sudo yum -y install rsync

