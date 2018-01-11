#!/bin/bash
#wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh


#
#sudo -s echo ""; echo "Root Privilege Acquired"
REPLACE_ME_OS=$(uname | cut -c1- | sed -e "s/L/l/g")
REPLACE_ME_ARCH=$(uname -ar | cut -c90- | cut -d " " -f 1 | sed -e "s/x86_64/x64/g")

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Votre OS $REPLACE_ME_OS & ARCH $REPLACE_ME_ARCH ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

/bin/echo -e "\e[32mInformation votre OS = $REPLACE_ME_OS\e[0m"
/bin/echo -e "\e[32mInformation votre ARCH = $REPLACE_ME_ARCH\e[0m"
sleep 3
/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Telechargement de heroku ===\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

cd /tmp/
wget https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-$REPLACE_ME_OS-$REPLACE_ME_ARCH.tar.gz -O heroku.tar.gz

tar -xvzf heroku.tar.gz
/bin/echo -e "\e[36m=========== Creation repertoire parents ===\e[0m"
#parents
mkdir -p /usr/local/lib /usr/local/bin

/bin/echo -e "\e[36m=========== Install de heroku ===\e[0m"

sudo mv heroku-cli-v6.* /usr/local/lib/heroku

sudo ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku
/bin/echo -e "\e[36m=========== Install de heroku ===\e[0m"


/bin/echo -e "\e[36m=========== Heroku version ===\e[0m"

heroku --version

/bin/echo -e "\e[36m=========== Resolution du probleme > error panic < ajout de droits ===\e[0m"
#error panic 
sudo chown -R $(echo $HOME | cut -c7-) ~/.cache/heroku/



/bin/echo -e "\e[36m=========== login sur heroku  ===\e[0m"
heroku login
#/bin/echo -e "\e[36m=========== Resolution du probleme > chmod: changing permissions of '/home/moussaillon/.netrc': Operation not permitted < ajout de droits ===\e[0m"
sudo chmod 666 $HOME/.netrc

/bin/echo -e "\e[36m=========== Ajout de la clef ssh dans heroku  ===\e[0m"

heroku keys:add
/bin/echo -e "\e[36m=========== heroku apps:list ===\e[0m"

heroku apps:list

#modif de la gem pour heroku






