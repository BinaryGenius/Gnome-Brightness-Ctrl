#!/bin/bash

mkdir -p /home/$USER/Projects/Gnome-Brightness-Ctrl
git clone https://github.com/zb3/gnome-gamma-tool
cd gnome-gamma-tool
mv gnome-gamma-tool.py /home/$USER/Projects/Gnome-Brightness-Ctrl
cd ..
rm -rf gnome-gamma-tool

echo
	read -p "Type "wayland" or "xorg" to pick desired script: " cmd
	case $cmd in
		wayland)
            mv soft-brightness/brightness.sh brightness-level.txt /home/$USER/Projects/Gnome-Brightness-Ctrl
            rm -rf soft-brightness
			;;
		xorg)
            mv ggt-script/brightness.sh brightness-level.txt /home/$USER/Projects/Gnome-Brightness-Ctrl
            rm -rf ggt-script
			;;
  esac
