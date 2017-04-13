#!/bin/bash

if [ -d .git ]; then
	echo "Syncing with github..."
	git pull origin master
else
	echo "Not a git repo, something has gone wrong..."
fi

DIRECTORY=$HOME'/dotfiles'

FILES=($(ls -A | grep -v 'init.sh' | grep -v 'update.sh' | grep -v '.git' | grep -v '.swp' | grep -v 'init.sh'))

function symlink_file_to_dotfiles {
	if [ -d $HOME'/'$1 ] || [ -f $HOME'/'$1 ]; then
		if [ -L $HOME'/'$1 ]; then
			echo $1' is already symlinked, skipping..';
		else
			echo $1' is already present, renaming and replacing..';
			mv $HOME'/'$1 $HOME$'/'$1'.old'
			ln -s $DIRECTORY'/'$1 $HOME'/'$1;
		fi
	else
		echo 'linking '$1;
		ln -s $DIRECTORY'/'$1 $HOME'/'$1;
	fi
}

for file in "${FILES[@]}"; do
	symlink_file_to_dotfiles $file
done

echo "All symlinks created"

echo "Configuring oh-my-zsh..."
rm -rf $DIRECTORY'/.oh-my-zsh'
export ZSH="$HOME/dotfiles/.oh-my-zsh"; 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &

echo "Configuring vim..."
git rm -r -f vim
rm -rf $DIRECTORY'/vim'
git submodule add --force https://github.com/VundleVim/Vundle.vim.git $DIRECTORY/vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Done!"
