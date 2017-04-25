#Check if oh-my-zsh is already installed and install it if it is not. 
if [ ! -d $HOME/.oh-my-zsh ]
then 
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else 
    echo "oh-my-zsh was already installed"
fi
#Create folders 'home' and 'zsh_custom' and seperate the dotfiles into these folders. 
cd $HOME/.dotfiles
mkdir home
mkdir zsh_custom
mv -i .vimrc $HOME/.dotfiles/home
mv -i .zshrc $HOME/.dotfiles/zsh_custom
cd $HOME
#Place symlink in $HOME and $ZSH_CUSTOM pointing to the dotfiles in their respective folder. 
ln -s -i -v .dotfiles/home/.vimrc $HOME/.vimrc
ln -s -i -v .dotfiles/zsh_custom/.zshrc $ZSH_CUSTOM/.zshrc
#Check if there exists an aliases.zsh file in .dotfiles, and symlink to itfrom $ZSH_CUSTOM if it does. Also move the aliases.zsh file to the zsh_custom folder.
if [ -f .dotfiles/aliases.zsh ]
then 
    mv $HOME/.dotfiles/aliases.zsh $HOME/.dotfiles/zsh_custom    
	ln -s -i -v $HOME/.dotfiles/zsh_custom $ZSH_CUSTOM/aliases.zsh
fi
#Source the .zshrc file
source $HOME/.zshrc
echo "oh-my-zsh installed. Symlinked .vimrc and .zshrc from home filder, and aliases.zsh to correct zsh folder. Sourced .zshrc" 

