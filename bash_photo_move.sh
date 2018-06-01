#!/bin/bash
clear
echo '#################################'
echo '# Author:  Ricardo van der Vlag #'
echo '# Version: 2018-05-22           #'
echo '# GitHub:  ricardovandervlag    #'
echo '# Type:    Private repository   #'
echo '#################################'
echo
echo This program is made to move content from a phone to a specified directory.
echo

source=$1
destination=$2
curDir=$(pwd)
fail=""

# Checking source path
if [ ! -d $source ] || [ -z $source ]; then
	echo "Incorrect source path"; fail="True";
fi

# Checking destination path
if [ ! -d $destination ] || [ -z $destination ]; then;
	echo "Incorrect destination path"; fail="True";
fi

