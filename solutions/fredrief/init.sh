#!/bin/zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
#Check if oh-my-zsh is already installed and install it if it is not. 
if [ ! -d $HOME/.oh-my-zsh ]
then 
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else 
    echo "oh-my-zsh was already installed"
fi

# Glob hidden files
setopt glob_dots

# Get location of dotfiles repo
# Important assumption: It is located at $HOME/.dotfiles
repo=$HOME/.dotfiles
echo "----------------------"
echo "Repo name: ${repo}"

# Symlink all home directory dotfiles
ln -svi $repo/home/* $HOME

# Symlink all ZSH_CUSTOM files
ln -svi $repo/zsh_custom/* $HOME/.oh-my-zsh/custom

# Source zsh config if the shell is zsh
if [ ! -z $ZSH ]; then
            source $HOME/.zshrc
fi

echo "oh-my-zsh installed. Symlinked .vimrc and .zshrc from home filder, and aliases.zsh to correct zsh folder. Sourced .zshrc" 

