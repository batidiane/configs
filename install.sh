#/bin/bash

# User's home.
USER_HOME=$(eval echo ~${SUDO_USER})

# Where this script is installed, and where skel files are
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

echo "## Skeleton Directory is $SCRIPTPATH/skel/"
echo "## Copying /skel/ files to directory: ${USER_HOME}"

for file in $SCRIPTPATH/skel/*
do
	filename=".$(basename $file)"
	if [[ -f $USER_HOME/$filename ]]
	then
		echo "$filename already exists."
		read -p "Replace it (y/N) ?" input
		shopt -s nocasematch
		case "$input" in
  			y|Y|Yes) 
				echo "Replacing $filename"
				`cp $file $USER_HOME/$filename`
				;;
  			* ) echo "Not replacing $filename";;
		esac
	else
		echo "$filename doesn't exist, copying it"
		`cp $file $USER_HOME/$filename`
	fi
done