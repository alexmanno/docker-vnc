#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y tightvncserver xfce4 xfce4-goodies

vncserver

vncserver -kill :1

mv /home/vncuser/.vnc/xstartup /home/vncuser/.vnc/xstartup.bak

(
cat <<EOF
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
) > /home/vncuser/.vnc/xstartup

sudo chmod +x /home/vncuser/.vnc/xstartup

vncserver