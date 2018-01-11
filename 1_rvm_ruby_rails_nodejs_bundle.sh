#!/bin/bash
# Script d install automatique pour rvm ruby rails !
# $ wget /install-fest-rails.sh | bash

clear
/bin/echo -e "\e[36mIMPORTANT FAIRE LE RUN AT LOGON DANS LES PREFERENCES DU TERMINAL SINON CEST MORT !!!\e[0m"
sleep 3
sudo rm /var/lib/dpkg/lock
/bin/echo -e "\e[36mInstall de curl\e[0m"
sudo apt-get -y install  curl


/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Install de RVM ============\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

#Files inside .gnupg should be chmod 600
#gpg: WARNING: unsafe ownership on homedir '/home/moussaillon/.gnupg'
/bin/echo -e "\e[36mError resolution >> gpg: WARNING: unsafe ownership on homedir '/home/moussaillon/.gnupg' \e[0m"
sudo chmod 700 ~/.gnupg
sudo chown -R $USER:$USER ~/.gnupg
cd ~/.gnupg
sudo chmod 600 *

/bin/echo -e "\e[36mInstall des librairies\e[0m"
#LIB
sudo apt-get -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
#DL KEY
/bin/echo -e "\e[36mTelechargement de la clef pour l install de rvm\e[0m"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#DL RVM
/bin/echo -e "\e[36mTelechargement de rvm\e[0m"
curl -sSL https://get.rvm.io | bash -s stable
#UPDATE SOURCE
/bin/echo -e "\e[36mUpdate >>  To start using RVM you need to run `source /etc/profile.d/rvm.sh`\e[0m"
source /etc/profile.d/rvm.sh

/bin/echo -e "\e[36mAjout $(echo $HOME | cut -c7-) au group rvm\e[0m"
/bin/echo -e '\nsource /etc/profile.d/rvm.sh'  >> ~/.bashrc
source /etc/profile.d/rvm.sh
sudo usermod -a -G rvm $(echo $HOME | cut -c7-)


/bin/echo -e  "\e[36m\e[0m"
/bin/echo -e  "\e[36m=======================================\e[0m"
/bin/echo -e  "\e[36m======== Install de Ruby       ========\e[0m"
/bin/echo -e  "\e[36m=======================================\e[0m"
/bin/echo -e  "\e[36m\e[0m"
#INSTALL RUBY
rvm install 2.5.0
/bin/echo -e "\e[36mUtilisation par default de ruby 2.5.0\e[0m"
#DEFAULT USE VERSION 2.5.0 OF RVM
rvm use 2.5.0 --default


/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m======= Install de NodeJS & Rails &  Bundler  =======\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"


#INSTALL NODEJS
/bin/echo -e "\e[36mInstall nodejs\e[0m"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

#INSTALL RAILS
/bin/echo -e "\e[36mInstall rails\e[0m"
gem install rails -v 5.1.4
#INSTALL BUNDLER
/bin/echo -e "\e[36mInstall bundler\e[0m"
gem install bundler

gem install gem-wrappers
gem update gem-wrappers

#install libpq-dev
#error >> Make sure that `gem install pg -v '0.21.0'` succeeds before bundling.
/bin/echo -e "\e[36mError resolution >> Make sure that `gem install pg -v '0.21.0'` succeeds before bundling.\e[0m"
sudo apt-get -y install  libpq-dev

/bin/echo -e "\e[36mResolution pb : Your user account isn't allowed to install to the system RubyGems.You can cancel this installation and run:\e[0m"
#ADD PATH Gem.user_dir to .bashrc
echo "export GEM_HOME=$(ruby -e 'print Gem.user_dir')"  >> ~/.bashrc
#UDPATE SOURCE
source ~/.bashrc




/bin/echo -e "\e[36m>>>>>>Peace full<<<<<<\e[0m"

/bin/echo -e "\e[36mrvm\e[0m"
rvm -v
/bin/echo -e "\e[36mruby\e[0m"
ruby -v
/bin/echo -e "\e[36mrails\e[0m"
rails -v
/bin/echo -e "\e[36mbundler\e[0m"
bundler -v
/bin/echo -e "\e[36mnodejs\e[0m"
nodejs -v

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m           OKLM!            \e[0m"
/bin/echo -e "\e[36m        INSTALLATION TERMINER!        \e[0m"
/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"




/bin/echo -e "\e[36mIMPORTANT FERME LE TERMINAL OUVRE LE ET FAIT UN >> rails new mon_app << \e[0m"
sleep 6

