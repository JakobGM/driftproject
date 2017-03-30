if [! -d .oh-my-zsh]
then 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
ln -s .dotfiles/.vimrc $HOME/.vimrc
ln -s .dotfiles/.zshrc $HOME/.zshrc
rm $ZSH_CUSTOM/aliases.zsh
ln -s /$HOME/.dotfiles/zsh_custom/aliases.zsh $ZSH_CUSTOM/aliases.zsh
source .zshrc
echo "oh-my-zsh installed. Symlinked .vimrc and .zshrc from home filder, and aliases.zsh to correct zsh folder. Sourced .zshrc" 
