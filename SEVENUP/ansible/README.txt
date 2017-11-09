Dryden Linden-Bremner 
2017-09-28
-------------------------------------------------------------------------------------------------------------------------------------------
Description:
The main playbook [playbook.yml] is designed to run a series of tests on the seven up server to insure that it is provisioned correctly
including
	- file structure (see file tree.txt) 
	- sym links 
	- users existance 
	- user privaleges 
	- group existance(wwwadm) 
	- group privaleges (wwwadm)
	- programs rsync and unzip are installed 
	- cron/at.allow are set up
	- java version info
--------------------------------------------------------------------------------------------------------------------------------------------
Installation:
All files and programs needed to run this script on the "controller" have been included in the vagrant boot up 
--------------------------------------------------------------------------------------------------------------------------------------------
This program requires non root access to sevenup through a user in wwwadam group
	