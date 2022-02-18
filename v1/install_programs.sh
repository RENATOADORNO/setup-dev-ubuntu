#!/usr/bin/env bash

echo "---------------------PREPARANDO AMBIENTE------------------------------------"
  echo "Atualizando repositórios......................"
    cd ~
    if ! apt-get update
    then 
      echo "Não foi possível atualizar os repositórios."
    exit 1
    fi 
      echo "Atualização de repositórios feita com sucesso"
  echo "Atualizando pacotes já instalados............."
    if ! apt-get dist-upgrade -y
    then
      echo "Não foi possível atualizar pacotes."
    exit 1
    fi
      echo "Atualização de pacotes feita com sucesso"
  echo "Resolvendo pendencias............."
    if ! apt-get upgrade
    then
      echo "Não foi possível resolver pendencias iniciais"
    elif ! apt-get full-upgrade
    then
      echo "Não foi possível resolver pendencias iniciais"
    exit 1
    fi
      echo "Pendencias resolvidas............."
echo "----------------PACOTES E REPOSITÓRIOS ATUALIZADO---------------------------"

echo "---------INICIANDO INSTALAÇÃO DOS PRINCIPAIS PROGRAMAS----------------------"
  #CHROME
  echo "Instalando do Chrome..................."
    if ! wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      then 
        echo "Não foi possível baixar o pacote do chrome"
      exit 1
      fi 
        echo "Download do pacote feito com SUCESSO"
    if ! apt install ./google-chrome-stable_current_amd64.deb
    then 
      echo "Não foi possível instalar o Chrome"
    exit 1
    fi 
      echo "Chrome instalado com SUCESSO"


  #ATIVANDO GNOME SHELL
  echo "Ativando gnome-shell no chrome..................."
    if ! apt-get install chrome-gnome-shell
      then 
        echo "Não foi possível ativar o gnome-shell"
      exit 1
      fi 
        echo "gnome-shell ativado com SUCESSO"

  #GIT
  echo "Instalando Git..................."
    if ! apt install git
      then 
        echo "Não foi possível instalar o Git"
      exit 1
      fi 
        echo "Git instalado com SUCESSO"


  # GitHub CLI
  echo "Instalando GitHub CLI..................."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    apt-get update
    if ! apt install gh
      then 
        echo "Não foi possível instalar o GitHub CLI"
      exit 1
      fi 
        echo "GitHub CLI instalado com SUCESSO"


  #VSCODE
  echo "Instalando o VS Code...................."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    apt install apt-transport-https
    apt-get update
    if ! apt install code
      then 
        echo "Não foi possível instalar o VsCode"
      exit 1
      fi 
        echo "VsCode instalado com SUCESSO"


  # VLC
  echo "Instalando o VLC...................."
    if ! apt install vlc
    then 
      echo "Não foi possível instalar o VsCode"
    exit 1
    fi 
      echo "VsCode instalado com SUCESSO"


  # SPOTIFY
  echo "Instalando Spotify.........................."
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    if ! sudo apt-get update && sudo apt-get install spotify-client
    then 
      echo "Não foi possível instalar o Spotify"
    exit 1
    fi 
      echo "VsCode instalado com SUCESSO"
  #NVM
  echo "Instalando NVM...................."
    if ! curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
      then 
        echo "Não foi possivel instalar o nvm"
      exit 1
      fi 
        echo "nvm instalado com sucesso"


  # QBITTORRENT
  echo "Instalando qBittorrent...................."
      if ! add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
        then 
          echo "ERRO REPO qBittorrent"
        elif ! apt-get update
        then 
          echo "ERRO ao atualizar repo"
        elif ! apt-get install qbittorrent
        then 
          echo "ERRO ao instalar qBittorrent"
      exit 1
      fi 
        echo "qBittorrent instalado com sucesso"

echo "--------------------INSTALAÇÃO FINALIZADA ----------------------------------"
echo "-----------------ATENÇÃO -> reinicie o terminal-----------------------------"
