#!/bin/bash

mkdir -p /home/$USER/Projects/Gnome-Brightness-Ctrl
git clone https://github.com/zb3/gnome-gamma-tool
cd gnome-gamma-tool
mv gnome-gamma-tool.py /home/$USER/Projects/Gnome-Brightness-Ctrl
cd ..
rm -rf gnome-gamma-tool
cd /home/$USER/Projects/Gnome-Brightness-Ctrl

echo
	read -p "Type "wayland" or "xorg" to pick desired script: " cmd
	case $cmd in
		wayland)
            mv soft-brightness/brightness.sh .
            rm -rf soft-brightness
			;;
		xorg)
            mv gnome-gamma-tool/brightness.sh .
            rm -rf gnome-gamma-tool
			;;
  esac


