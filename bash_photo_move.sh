#!/bin/bash
clear
echo '#################################'
echo '# Author:  Ricardo van der Vlag #'
echo '# Version: 2018-07-04           #'
echo '# GitHub:  ricardovandervlag    #'
echo '# Type:    Private repository   #'
echo '#################################'
echo
echo 'This program is made to move content from a phone to a specified directory.'
echo 'This script takes #1 source #2 destination and #3 week our month as parameters.'
echo '#1 Source - Path to your content source'
echo '#2 Destination - Destination path to move your content to'
echo '#3 Week/Month - Order content by week or month. (Do not use capitals!)'
echo 'If the parameters are incorrect, you will be prompted.'
echo 

source=$1
destination=$2
timeStmpType=$3
curDir=$(pwd)
fail=""

# Checking source path
if [ ! -d $source ] || [ -z $source ]; then
	echo "Incorrect source path."; fail="True";
fi

# Checking destination path
if [ ! -d $destination ] || [ -z $destination ]; then
	echo "Incorrect destination path."; fail="True";
fi

# Checking timeStmpType
if [ "$timeStmpType" = "week" ] || [ "$timeStmpType" = "month" ]; then
	echo "Order by: $timeStmpType";
else
	echo "You must either enter 'month' or 'week' as thrid parameter."; fail="True";
fi

# Aborting if fail
if [ "$fail" = "True" ]; then
	echo "Program failed! Please enter propper parameters."; exit 1;
fi

# Count number of files
contentCount=$(ls "$source"* | wc -l)

# List content
while read line; do
	array[ $i ]="$line";
	(( i++ ));
done < <(ls "$source")

# Copy files
for (( i=0; $i<($contentCount); i++)); do
	# Extension to directory
	if [ "$timeStmpType" = "month" ]; then
		ext=$(ls -l $source${array[$i]} | awk '{print $6}');
		ext="$ext/";
	else
		ext=$(date +%V);
		ext="$ext/";
	fi;
	# Make dir if not exist
	if [ ! -d $destination$ext ] || [ -z $destination$ext ]; then
		mkdir $destination$ext;
	fi
	cp $source${array[$i]} $destination$ext${array[$i]};
done

# Check hash md5
for (( i=0; $i<($contentCount); i++)); do
	hashSource=$(md5sum $source${array[$i]} | cut -d\  -f1);
	# Extension to directory
	if [ "$timeStmpType" = "month" ]; then
		ext=$(ls -l $source${array[$i]} | awk '{print $6}');
		ext="$ext/";
	else
		ext=$(date +%V);
		ext="$ext/";
	fi;
	hashDestination=$(md5sum $destination$ext${array[$i]} | cut -d\  -f1);
	# Remove source if hash OK
	if [ $hashSource == $hashDestination ]; then
		echo;
		echo "Copied ${array[$i]} succesfully. Removing source file.";
		rm $source${array[$i]};
	fi;
done
