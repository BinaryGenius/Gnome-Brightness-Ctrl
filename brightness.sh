#!/bin/bash
projectdir=/home/$USER/Projects/Gnome-Brightness-Ctrl/
brightnesslevelpath="$projectdir""brightness-level.txt"
gnomegammatoolpath="$projectdir""gnome-gamma-tool.py"
brightness=$(cat $brightnesslevelpath)

case $1 in
	Up)
		exec 200>"/tmp/.brightness.lock"
		flock 200 || { echo already running && exit; }
		echo $(echo $brightness + 0.05 | bc) > $brightnesslevelpath
		brightness=$(cat $brightnesslevelpath)
		if (( $(bc <<< "$brightness > 1") ))
		then
			echo 1 > $brightnesslevelpath
			brightness=$(cat $brightnesslevelpath)
		fi
		python3 $gnomegammatoolpath -b $brightness -y #|& tee -a /tmp/ggt-log
		;;
	Down)
		exec 200>"/tmp/.brightness.lock"
		flock 200 || { echo already running && exit; }
		echo $(echo $brightness - 0.05 | bc) > $brightnesslevelpath
		brightness=$(cat $brightnesslevelpath)
		if (( $(bc <<< "$brightness < .1") ))
		then
			echo .1 > $brightnesslevelpath
			brightness=$(cat $brightnesslevelpath)
		fi
		python3 $gnomegammatoolpath -b $brightness -y #|& tee -a /tmp/ggt-log
		;;
esac
