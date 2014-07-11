#!/bin/bash

if [[ -d $1 && -f $1/setup.sh ]]; then
	echo $1 > $HOME/.rosdir
elif [[ -d /opt/ros/$1 && -f /opt/ros/$1/setup.sh ]]; then
	echo /opt/ros/$1 > $HOME/.rosdir
else
	echo "$1 setup files not found."
	exit 1
fi

#ROSDIR=`cat $HOME/.rosdir`
#source $ROSDIR/setup.bash

