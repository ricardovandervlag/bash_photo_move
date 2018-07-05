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
contentCount=$(ls -lq "$source"* | wc -l)

# List content
contentList=$(ls -lq "$source"*)
echo $contentList

while read line; do
	array[ $i ]="$line";
	(( i++ ));
done < <(ls -lq "$source"*)

echo ${array}
clear

array1=($(ls -lq "$source"))

echo $array1
