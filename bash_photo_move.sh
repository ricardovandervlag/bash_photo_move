clear
echo '#################################'
echo '# Author:  Ricardo van der Vlag #'
echo '# Version: 2018-05-22           #'
echo '# GitHub:  ricardovandervlag    #'
echo '# Type:    Private repository   #'
echo '#################################'
echo
echo This program is made to move content from a phone to a specified directory.

# Taking user input for source path
echo "Please enter a source path and press [ENTER]"
read source
# Checking source path
if [ ! -d $source ]; then
	echo "Incorrect path"; exit 1;
else
	echo "Source path: $source";
fi

# Taking user input for destination path
echo "Please enter a destination path and press [ENTER]"
read destination
# Checking destination path
if [ ! -d $destination ]; then
        echo "Incorrect path"; exit 1;
else
        echo "Destination path: $source";
fi

