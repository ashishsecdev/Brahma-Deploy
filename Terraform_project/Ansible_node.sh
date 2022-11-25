#! /bin/bash
account_password="ansiblepassword123"
sudo apt update
sudo adduser --disabled-password --gecos "" admns && echo -e "$account_password\n$account_password" | sudo passwd admns
sudo bash -c "echo 'admns ALL=(ALL:ALL) ALL' >> /etc/sudoers"
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
