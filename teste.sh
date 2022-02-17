#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("QBITTORRENT" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "QBITTORRENT")
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
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done