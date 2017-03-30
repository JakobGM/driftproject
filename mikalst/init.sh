#!/bin/bash

DIRECTORY=`pwd`
FILES=($(ls -A | grep -v '.git' | grep -v '.swp' | grep -v 'init.sh'))

function symlink_file_to_dotfiles {
	file=$1
	if [ -d $HOME'/'$file ] || [ -f $HOME'/'$file ]; then
		if [ -L $HOME'/'$file ]; then
			echo $file' is already symlinked, skipping..';
		else
			echo $file' is already present, renaming and replacing..';
			mv $HOME'/'$file $HOME$'/'$file'.old'
			ln -s $DIRECTORY'/'$file $HOME'/'$file;
		fi
	else
		echo 'linking '$file;
		ln -s $DIRECTORY'/'$file $HOME'/'$file; 
	fi
}

for file in "${FILES[@]}"; do
	symlink_file_to_dotfiles $file	
done

echo "All symlinks created, exiting..."
