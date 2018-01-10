/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Install de GIT ============\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

sudo -s apt-get -y install git
git config --global color.ui true

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Conf de GIT ============\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

#exec echo -e "\e[36mHello World\e[0m"
/bin/echo -e "\e[36mMerci de mettre le nom de votre account github :\e[0m"
read name
git config --global user.name "$name"

/bin/echo -e "\e[36mMerci de mettre votre l'email de votre compte github :\e[0m"
read mail
git config --global user.email "$mail"


/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Creation clef SSH ============\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

/bin/echo -e "\e[36mMerci de mettre votre email pour cree votre ssh pour pouvoir syncroniser votre compte github avec votre pc ,appuyer sur la touche Entre comme ca la clef va ce mettre dans un dossier par default :\e[0m"
read mail_ssh
ssh-keygen -t rsa -b 4096 -C "$mail_ssh"

eval `ssh-agent`

/bin/echo -e "\e[36m=========== Ajout de votre clef SSH ============\e[0m"

ssh-add ~/.ssh/id_rsa

/bin/echo -e "\e[36m\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m=========== Votre clef SSH ============\e[0m"
/bin/echo -e "\e[36m=======================================\e[0m"
/bin/echo -e "\e[36m\e[0m"

cat ~/.ssh/id_rsa.pub




