# ros-setup.sh: Easily change your current ROS environment without needing to
# edit your .bashrc!
# 
# Tested with both bash and zsh. Not likely to work with other shells.
#
# HOW IT WORKS
# 
# 1. Place this file somewhere and source it from within your .bashrc (or
#    your .zshrc). If you place it in your home directory, you would write:
#        source $HOME/ros-setup.sh
# 2. Any time you want to work on a different distro, just select it:
#        $ rosselect hydro
#        $ rosselect groovy
#        $ rosselect /path/to/groovy
#    Your current shell AND ALL SUBSEQUENT SHELLS will be placed in the
#    selected environemnt. No more need to edit your .bashrc!
# 3. You can even use this to work in a specific workspace. No more need to
#    manually source the setup files!
#        $ rosselect /path/to/rosbuild_ws
#        $ rosselect /path/to/catkin_ws
# 
# Basically, it works for any directory that contains a setup.sh script. It
# handles relative paths as well as absolute paths. It also sets it up so
# that `roscd` (no arguments) will bring you to your workspace.
# 
# A couple other convenience functions are also included:
# 	* rospath: Displays the current ROS_PACKAGE_PATH.
#   * rosenv: Displays all the ros-related environment variables.
# These are pretty useful for verifying that your ROS environment is correct.
# 

# This function can be used to switch between distros and workspaces.
function rosselect {
	if [ ! -n "$1" ]; then
		findros && rosstatus && unset ROSDIR
		return 0
	elif [[ -d $1 && -f $1/setup.sh ]]; then
		echo `abspath $1` > $HOME/.rosdir
	elif [[ -d $1 && -d $1/devel && -f $1/devel/setup.sh ]]; then
		echo `abspath $1/devel` > $HOME/.rosdir
	elif [[ -d /opt/ros/$1 && -f /opt/ros/$1/setup.sh ]]; then
		echo /opt/ros/$1 > $HOME/.rosdir
	else
		echo "$1 setup files not found."
		return 1
	fi
	rossetup
}

function abspath {
	if [ -d "$1" ]; then echo `cd $1; pwd`; fi
}

# Grab the preferred ROS distribution, or fallback to a default.
function findros {
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
}

# Did we find any ROS?
function rosstatus {
	if [ ! -d "$ROSDIR" ]; then
		echo "No ROS distribution found."
		unset ROSDIR
		return 1
	else
		echo "Using ROS distro at: $ROSDIR"
	fi
}

# Convenience function because I'm so sick of typing this.
function rospath {
	echo $ROS_PACKAGE_PATH
}

# Convenience function because I'm so sick of typing this.
function rosenv {
	export | grep -i --color=never ros
}

# This function actually sources the setup file for the current distro.
function rossetup {
	findros && rosstatus || return 1

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
	# This is needed for roscd to work and Catkin workspaces leave it
	# unset by default. That's dumb.
	if [[ $ROSDIR == */devel ]]; then
		export ROS_WORKSPACE=${ROSDIR%/*}
	else
		export ROS_WORKSPACE=$ROSDIR
	fi

	unset ROSDIR
}

rossetup
