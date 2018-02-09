#!/bin/bash

# UPDATE BASIC SYSTEM
apt-get update && apt-get dist-upgrade -y && apt-get install -y --force-yes git iptables-persistent emacs

# PREPARE TO GET DOCKER
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
apt-get update

# GET DOCKER AND DOCKER COMPOSE
apt-get install -y docker-ce && \
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose

# ADD EUGENE
adduser --disabled-password --gecos "" eugene && \
echo 'eugene ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
usermod -aG sudo eugene && \
mkdir /home/eugene/.ssh && \
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCp2cpxJXirif4JQJWBXg3bWZVjWRZgPNDzzubTxIzaGzUw1KbWG+D2E/oc1D81ZHKe/IhCHhLoXeB5P7hZKuex3xiTTA6nL/uQi0K9eGu0BpBC6kpY17vcTE4W+F8r/51JaWAUeqf+SriepezAvlfwvAUhLhNieRyAdXa9SCsYHT2gcnBiZhEyFJk07iPYxnvNb5ITe6y2q6TpmmXX7kUKi+h4XNO7NWB6UuwmP3VxrkbX+Suwn0KozinYjAW8yhTJX2Xg06ZfFLNB5DKFr9oHY5pj8ZotUPYiVJNWIYVMO0F6+0DSmJtkWEh02/aTStXa8Os1N8G9o+mLhAueZOzz me@book' >> /home/eugene/.ssh/authorized_keys && \
chown -R eugene:eugene /home/eugene/.ssh && \
chmod 0700 /home/eugene/.ssh && \
chmod 0644 /home/eugene/.ssh/authorized_keys && \
chmod 0644 /home/eugene/.ssh/id_rsa.pub && \
echo 'eval `ssh-agent -s`' >> /home/eugene/.profile

# ADD IAN
adduser --disabled-password --gecos "" ian && \
echo 'ian ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
mkdir /home/ian/.ssh && \
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+ANwxfP7t6UKITbuEGAWZa6GcMel43Wu8ILZoM7tatO5rlinSsmhzrOJCBwr5fsG9ztE2twf+YyZATf8n5FjE7PJB/TKw1oneQEsywLx2HFzWrSgwQlUKcyofCRicQKbXFIyb7nOBu+OhDZpJEyiJnkwGLvbDxrNAjO9NOR5v9V17ouaqG4kQrzYkOE6ywAHngZDwMrBhKQJ0K5vSDT4giAe5dVOqbiSwtQ2oyW6ZHdLovvwbFqPGTA9gqBJrJuU9JAho1lrUdD7DAoOS7xXgSC2B/V1DLPOtrINDDoax3LHLn9cfMqRnHV9wkWq1dJ01WKO82iCQvoXsP1nIGkIVNQJiJJcHYO+KUV4kWUsngizhuRap4Uih3pX8QR+BJdzrvYQA9HBoMgKU2+/PoisneedVlRqmWAMMzfYm3z7HuPVzBzQHU0Fir3GMN0p+BQE2fY7ZZS9j2vliWw3ZgbHpFCoaPG/HLciHchc+btTIy6s0CNvOL8MPfEHX2p0CDdY4q7i7Z9QR4FcoDFSR6d6L/VkzvckgEWQyrdTSp/DOflXAeRo0LnxaAMOJ/4HcPvq2L0SY9TmLQshzqP2zoCLKl10/63hjN6SyXOFY/oXT30Z4GC8D/OEuO80OCcylFWy71h6MN9STov7qbl+xB57ZG9rkGGQwvinkwxKhBRiuJQ== imnieves@gmail.com' >> /home/ian/.ssh/authorized_keys && \
chown -R ian:ian /home/ian/.ssh && \
chmod 0700 /home/ian/.ssh && \
chmod 0644 /home/ian/.ssh/authorized_keys && \
chmod 0644 /home/ian/.ssh/id_rsa.ian_at_linode.pub && \
echo 'eval `ssh-agent -s`' >> /home/ian/.profile

# ADD music GROUP
addgroup music && \
usermod -a -G music eugene && \
usermod -a -G music ian

# PREPARE PERMISSIONS FOR GIT REPO
mkdir -p /var/music && \
chgrp music /var/music && \
chmod g+ws /var/music && \
cd /var/music
# git init --bare --shared=group

# SCP FROM IAN'S GITHUB PRIVATE KEY TO LINODE /home/ian/.ssh
# scp ~/.ssh/id_rsa.ian_at_github ian@172.104.17.40:~/.ssh

# CLONE GIT REPO
su ian
eval `ssh-agent -s` && \
ssh-add ~/.ssh/id_rsa.ian_at_github
git clone --shared git@github.com:inieves/music.git /var/music

# CREATE SPACE FOR PRIVATE CREDENTIALS
mkdir /var/music/config/private/prod

# SCP FROM IAN'S SECURE SPACE TO LINODS
#scp -r ~/gitRepos/music/config/private/prod ian@172.104.17.40:/var/music/config/private/prod







# OPEN PORT 3306 FOR DOCKER
# iptables -A INPUT -p tcp --dport 3306 --jump ACCEPT
# iptables-save > /etc/iptables/rules.v4

# users must put their own github private keys in place



# secure passwords
# figure out why db logs arent working
# figure out why nginx config isnt working


