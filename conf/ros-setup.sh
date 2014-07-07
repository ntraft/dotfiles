# Grab the preferred ROS distribution.
if [ -f $HOME/.rosdir ]; then
	ROSDIR=`cat $HOME/.rosdir`
else
	for DIR in `ls -r /opt/ros`; do
		if [ -f /opt/ros/$DIR/setup.sh ]; then
			ROSDIR=/opt/ros/$DIR
			break
		fi
	done
fi

if [ ! -d "$ROSDIR" ]; then
	echo "No ROS distribution found."
	return 1
else
	echo "Using ROS distro at: $ROSDIR"
fi

# Environment variables for ROS.
if [ -n "$ZSH_VERSION" ]; then
	source $ROSDIR/setup.zsh
elif [ -n "$BASH_VERSION" ]; then
	source $ROSDIR/setup.bash
else
	source $ROSDIR/setup.sh
fi

