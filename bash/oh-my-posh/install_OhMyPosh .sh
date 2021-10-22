#!/usr/bin/env bash
echo "-----------INICIANDO INSTALAÇÃO DO OH-MY-POSH---------------------"
  if ! wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    then
      echo "ERRO wegt Oh-my-posh"
    elif ! mkdir /home/renato/.poshthemes
    then
      "ERRO ao criar pasta .poshthemes"
    elif ! wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /home/renato/.poshthemes/themes.zip
    then
      "ERRO ao baixar poshthemes"
    elif ! unzip /home/renato/.poshthemes/themes.zip -d /home/renato/.poshthemes
    then
      "ERRO unzip poshthemes"
    elif ! chmod u+rw /home/renato/.poshthemes/*.json
    then
      "ERRO chmod poshthemes"
    elif ! rm /home/renato/.poshthemes/themes.zip
    then
      "ERRO ao remover poshthemes.zip"
  exit 1
  fi 
    echo "Oh-my-posh instalado com SUCESSO"
  
  chown renato:renato /usr/local/bin/oh-my-posh
  sudo chmod 760 /usr/local/bin/oh-my-posh
  echo eval "$(oh-my-posh --init --shell bash --config /home/renato/.poshthemes/agnoster.omp.json)" >> /home/renato/.bashrc
  cp /home/renato/.bashrc /root
  chown renato:renato /home/renato/.bashrc
  chmod 760 /home/renato/.bashrc
  chown renato:renato /home/renato/.poshthemes
  chown renato:renato /home/renato/.poshthemes/*.json
  chmod u+rw /home/renato/.poshthemes/*.json

echo "-----------INSTALAÇÃO REALIZADA COM SUCESSO---------------------"