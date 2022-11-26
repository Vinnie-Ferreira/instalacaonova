#!/bin/sh

#helpers...
link_if_not_exists() {
    if [ ! -e $2 ]; then
    	echo $1 "->" $2
        sudo ln -s $1 $2
    fi
}

#MAIN

#checa CPU
CPU=`uname -m`
if [ $CPU != x86_64 ]; then
    echo 'Este script somente suporta sistemas 64 bits...'
    exit
fi

#começando

echo 'Seja bem vindo! Vamos deixar tudo pronto.'

sudo apt-get update
sudo apt-get install gdebi

cd
cd Downloads

#Baixando arquivos

wget https://github.com/Vinnie-Ferreira/safesignoab/archive/refs/heads/main.zip

wget https://cnj-pje-programs.s3-sa-east-1.amazonaws.com/pje-office/pje-office_amd64.deb
--2022-11-25 22:08:30--  https://cnj-pje-programs.s3-sa-east-1.amazonaws.com/pje-office/pje-office_amd64.deb

#organizando arquivos

unzip main.zip
sudo mv ~/Downloads/safesignoab-main/safesignoab.deb  ~/Downloads/
rm -rf main.zip safesignoab-main

#instalando safesign

sudo dpkg -i safesignoab.deb

#instalando o pje-Office

sudo dpkg -i pje-office_amd64.deb

sudo apt-get update

rm safesignoab.deb
rm pje-office_amd64.deb

echo 'Instalações do SafeSign e PJE Office estão completas. Agora tente logar no PJE do TJRJ.'
cd
cd /usr/share/pje-office/
chmod +x pjeOffice.sh
./pjeOffice.sh

