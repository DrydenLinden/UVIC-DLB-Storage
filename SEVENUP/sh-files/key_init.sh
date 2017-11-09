#Dryden Linden Bremner 2017-09-08
#this file is intede to concatanate the public part of the server key into the ssh authorzied keys file and remove the copy, in order to allow the controller to ssh/ access the vms as needed.
cat serverkey >> .ssh/authorized_keys
rm serverkey
chmod 600 .ssh/id_rsa 
chmod 700 .ssh