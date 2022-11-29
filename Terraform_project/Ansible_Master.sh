#! /bin/bash

account_password="ansiblepassword123"
sudo apt update
sudo apt install ansible -y
sudo apt update
sudo apt install sshpass -y
sudo apt update

#acntpass ="$(cat Change-password.txt)"

sudo adduser --disabled-password --gecos "" admns && echo -e "$account_password\n$account_password" | sudo passwd admns
sudo bash -c "echo 'admns ALL=(ALL:ALL) ALL' >> /etc/sudoers"
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

sudo su admns
sudo -u admns bash -c "ssh-keygen -f ~admns/.ssh/id_rsa -N ''"
cd /home/admns/.ssh

sshpass -p "$account_password" ssh-copy-id -o StrictHostKeyChecking=no ${eip1} && sshpass -p "$account_password" ssh-copy-id -o StrictHostKeyChecking=no ${eip1}
# eipslist1="${join(var.special, google_compute_instance.node.*.network_interface.0.access_config.0.nat_ip)}"
# read -a eips <<<"$eipslist1"
# IFS='-' #setting comma as delimiter 
# for eip in "${eips[@]}"; #accessing each element of array 
# do
#     echo $eip
#     sshpass -p "$account_password" ssh-copy-id -o StrictHostKeyChecking=no ${eip}
# done 
# Login to Admns and try ansible all -m ping