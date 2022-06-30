#! /bin/bash


#Hi, welcome to NokoDev.
#Here I will make life easy for you when deploying an Nginx Web Server on a Linux machine.
#This is initial designed for an Ubuntu environment.
#You are welcome to add more features to suite your tasks.
#Enjoy!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


#Lets get started with the first function.

#This will simply just get all package updates and upgrade where required.


function updatePackages () {
	apt list --upgradeable
	apt update -y;apt upgrade


}

#Install and start Nginx
#Enabling allow web server to start automatically upon restart.

function installNginx () {

#	apt install nginx
	cd /var/www/html 
#Need to check if git is installed	

	touch index.html
	systemctl enable nginx
	systemctl start nginx
}


#Install the UFW firewall to block and allow desired connections.


function applyFirewall () {

	apt install ufw
	ufw default deny incoming
	ufw default allow outgoing
	ufw allow ssh
	ufw allow http
	ufw allow dns
	ufw enable
}




#updatePackages
installNginx
