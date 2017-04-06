if [ ! -d $HOME/.oh-my-zsh ]
then 
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else 
echo "oh-my-zsh was already installed"
fi
ln -s .dotfiles/.vimrc $HOME/.vimrc
ln -s .dotfiles/.zshrc $HOME/.zshrc
if [ -f $ZSH_CUSTOM/aliases.zsh ]
then
	rm $ZSH_CUSTOM/aliases.zsh
fi
ln -s /$HOME/.dotfiles/zsh_custom/aliases.zsh $ZSH_CUSTOM/aliases.zsh
source $HOME/.zshrc
echo "oh-my-zsh installed. Symlinked .vimrc and .zshrc from home filder, and aliases.zsh to correct zsh folder. Sourced .zshrc" 
