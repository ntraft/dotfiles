#!/usr/bin/env bash
 
echo "Generating eclipse projects for all ROS projects in this directory"
for MKFILE in `find $PWD -name Makefile`; do
	DIR=`dirname $MKFILE`
	printf '\nGenerating: '$DIR'\n'
	cd $DIR
	make eclipse-project
done
