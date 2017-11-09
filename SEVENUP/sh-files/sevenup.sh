
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

sudo echo "wwwadm" >> /etc/cron.allow
sudo echo "wwwsvr" >> /etc/cron.allow
sudo echo "wwwadm" >> /etc/at.allow
sudo echo "wwwsvr" >> /etc/at.allow

sudo echo "account sufficient pam_succeed_if.so user ingroup CSNR_Server_Administrators" >> /etc/pam.d/system-auth
sudo echo "account sufficient pam_succeed_if.so user ingroup FLNR_AP_APPLICATIONDELIVERIES_C" >> /etc/pam.d/system-auth

sudo yum -y install unzip
sudo yum -y install rsync
#export JAVA_HOME=/usr/lib/jvm/
#export PATH="$JAVA_HOME/bin:$PATH"
#
