# Grab the preferred ROS distribution.
if [ -f $HOME/.rosdir ]; then
	ROSDIR=`cat $HOME/.rosdir`
else
	ROSDIR=/opt/ros/hydro
fi

# Environment variables for ROS.
if [ -n "$ZSH_VERSION" ]; then
	source $ROSDIR/setup.zsh
elif [ -n "$BASH_VERSION" ]; then
	source $ROSDIR/setup.bash
else
	source $ROSDIR/setup.sh
fi

