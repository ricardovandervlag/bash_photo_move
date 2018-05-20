clear
echo '#################################'
echo '# Author:  Ricardo van der Vlag #'
echo '# Version: 2018-05-20           #'
echo '# GitHub:  ricardovandervlag    #'
echo '# Type:    Private repository   #'
echo '#################################'
echo
echo This program is made to move content from a phone to a specified directory.
echo Please enter the prefferd destination and press '[ENTER]'

dir="$(pwd)"
file="/dest.txt"
input="$dir$file"
dest="$(cat $input)"

echo "$dest"
