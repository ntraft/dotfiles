
# This function can be used to switch between distros and workspaces.
function rosselect {
	if [[ -d $1 && -f $1/setup.sh ]]; then
		echo $1 > $HOME/.rosdir
	elif [[ -d /opt/ros/$1 && -f /opt/ros/$1/setup.sh ]]; then
		echo /opt/ros/$1 > $HOME/.rosdir
	else
		echo "$1 setup files not found."
		exit 1
	fi
	rossetup
}

# This function actually sources the setup file for the current distro.
function rossetup {
	# Grab the preferred ROS distribution, or fallback to a default.
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

	# Did we find any ROS?
	if [ ! -d "$ROSDIR" ]; then
		echo "No ROS distribution found."
		return 1
	else
		echo "Using ROS distro at: $ROSDIR"
	fi

	# This sometimes causes problems when switching between different distros.
	unset LD_LIBRARY_PATH
	# Let's also squelch the warning message.
	unset ROS_DISTRO
	# Now call the actual setup script.
	if [ -n "$ZSH_VERSION" ]; then
		source $ROSDIR/setup.zsh
	elif [ -n "$BASH_VERSION" ]; then
		source $ROSDIR/setup.bash
	else
		source $ROSDIR/setup.sh
	fi
}

rossetup
