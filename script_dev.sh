#!/bin/bash

# Script para desenvolvedores web no Ubuntu
# Criado por Willian Justen

# Esse script foi escrito usando o zenity e tem 
# o objetivo de agilizar a instalação de programas
# básicos no mundo do desenvolvimento web atual.
# É um script bem básico e rápido, sugestões são bem vindas =)

zenity --info --title "Script Web Development" --text "Este é um script simples para instalação de ferramentas úteis para Desenvolvimento Web e do ambiente do Ubuntu. \n\nCriado por: Willian Justen de Vasconcellos"

resposta=$(zenity  --list  --text "Escolha os pacotes que deseja instalar." --checklist  --column "Instalar" --column "Id" --column "Pacote" FALSE "a" "Restricted-Extras (Codecs de áudio e vídeo, plugin flash, java entre outros)" FALSE "b" "Gimp (Editor de Imagens)" FALSE "c" "Inkscape (Editor de Vetores)" FALSE "d" "Imagemagick (Editor de Imagens via Terminal)" FALSE "e" "Sublime Text 2" FALSE "f" "Sublime Text 3" FALSE "g" "Brackets" FALSE "h" "Dropbox" FALSE "i" "Mysql Workbench" FALSE "j" "Lamp+phpmyadmin" FALSE "k" "Google Chromium" FALSE "l" "Google Chrome" FALSE "m" "Git e Gitk" FALSE "n" "Filezilla" FALSE "o" "NodeJS" FALSE "p" "Yo / GruntJs / Bower (Requer NodeJS)" --separator=":" --width=750 --height=600)


if [[ $resposta =~ "a" ]]; then
   sudo apt-get -y install ubuntu-restricted-extras
fi


if [[ $resposta =~ "b" ]]; then
   sudo apt-get -y install gimp
fi

if [[ $resposta =~ "c" ]]; then
   sudo apt-get -y install inkscape
fi

if [[ $resposta =~ "d" ]]; then
   sudo apt-get -y install imagemagick
fi

if [[ $resposta =~ "e" ]]; then
  # adicionando repositório
  sudo add-apt-repository ppa:webupd8team/sublime-text-2
  sudo apt-get update
  sudo apt-get -y install sublime-text
fi

if [[ $resposta =~ "f" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update 
  sudo apt-get -y install sublime-text-installer
fi

if [[ $resposta =~ "g" ]]; then
  # adicionando repositório
  sudo add-apt-repository -y ppa:webupd8team/brackets
  sudo apt-get update
  sudo apt-get -y install brackets
fi

if [[ $resposta =~ "h" ]]; then
   sudo apt-get -y install nautilus-dropbox
 #instalando indicador da barra de tarefas
 sudo apt-get -y install libappindicator1
fi   

if [[ $resposta =~ "i" ]]; then
   sudo apt-get -y install mysql-workbench
fi   

if [[ $resposta =~ "j" ]]; then
  # instalando lamp e phpmyadmin
  sudo apt-get -y install lamp-server^
  sudo apt-get -y install phpmyadmin
  # criando um link virtual
  sudo ln -s /usr/share/phpmyadmin/ /var/www/
  # dando permissão de todas as pastas para maior controle
  sudo chmod -R 777 /var/www   
fi   

if [[ $resposta =~ "k" ]]; then
   sudo apt-get -y install chromium-browser
fi   

if [[ $resposta =~ "l" ]]; then
  # baixando a chave do chrome para adicionar nas chaves de repositórios
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # adicionando na lista de fontes
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-stable
fi   

if [[ $resposta =~ "m" ]]; then
  sudo apt-get install -y git-core gitk
fi

if [[ $resposta =~ "n" ]]; then
  sudo apt-get install -y filezilla
fi

if [[ $resposta =~ "o" ]]; then
  # instalando dependências
  sudo apt-get install -y python-software-properties python g++ make
  # adicionando repositório
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs
  # correção para não precisar rodar em sudo
  echo prefix = ~/.node >> ~/.npmrc
  echo 'export PATH=$HOME/.node/bin:$PATH' >> ~/.bashrc 
fi

if [[ $resposta =~ "p" ]]; then
  sudo npm install -g yo grunt-cli bower
fi

# removendo os pacotes não necessários
sudo apt-get autoremove

zenity --info --title "Instalação Finalizada" --text "Instalação Finalizada com sucesso!"
