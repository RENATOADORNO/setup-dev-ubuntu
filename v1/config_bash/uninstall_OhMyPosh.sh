#!/usr/bin/env bash

rm /usr/local/bin/oh-my-posh
rm -r /home/renato/.poshthemes
rm /home/renato/.bashrc

/bin/cp /etc/skel/.bashrc /home/renato
. /home/renato/.bashrc

rm /root/.bashrc

chown renato:renato /home/renato/.bashrc
chmod u+rw /home/renato/.bashrc

