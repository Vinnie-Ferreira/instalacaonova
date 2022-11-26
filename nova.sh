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

wget https://github.com/Vinnie-Ferreira/instaladoroabrj/releases/download/assinador/safesign_2_0_amd64.deb

wget https://cnj-pje-programs.s3-sa-east-1.amazonaws.com/pje-office/pje-office_amd64.deb
--2022-11-25 22:08:30--  https://cnj-pje-programs.s3-sa-east-1.amazonaws.com/pje-office/pje-office_amd64.deb

#instalando safesign

sudo dpkg -i safesign_2_0_amd64.deb

#instalando o pje-Office

sudo dpkg -i pje-office_amd64.deb

cd
cd /usr/share/pje-office/
chmod +x pjeOffice.sh
./pjeOffice.sh

sudo apt-get update

rm safesign_2_0_amd64.deb
rm pje-office_amd64.deb

echo 'Instalações do SafeSign e PJE Office estão completas. Agora tente logar no PJE do TJRJ.'

#zsh...

echo 'Que tal deixar o terminal maneiro??'

echo 'Você deseja instalar o ZSH? (s ou n)' 
read resp
if [ $resp. != 's' ];
then
wget https://github.com/vjspranav/KaliZSH/archive/refs/heads/main.zip

unzip main.zip
cd KaliZSH-main/
chmod +x script.sh
./script.sh

zsh

else
echo Vc merece um terminal cafona
exit
fi
