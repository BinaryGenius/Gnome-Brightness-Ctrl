#!/bin/bash

brightnesslevelpath=/home/$USER/Projects/Gnome-Brightness-Ctrl/brightness-level.txt
brightness=$(cat "${brightnesslevelpath}")

case $1 in
	Up)
		echo $(echo $brightness + 0.05 | bc) > "$brightnesslevelpath"
		brightness=$(cat "${brightnesslevelpath}")
		if (( $(bc <<< "$brightness > 1") ))
		then
			echo 1 > "$brightnesslevelpath"
			brightness=$(cat "${brightnesslevelpath}")
		fi
		dconf write /org/gnome/shell/extensions/soft-brightness/current-brightness $brightness
		;;
	Down)
		echo $(echo $brightness - 0.05 | bc) > "$brightnesslevelpath"
		brightness=$(cat "${brightnesslevelpath}")
		if (( $(bc <<< "$brightness < .1") ))
		then
			echo .1 > "$brightnesslevelpath"
			brightness=$(cat "${brightnesslevelpath}")
		fi
		dconf write /org/gnome/shell/extensions/soft-brightness/current-brightness $brightness
		;;
esac
