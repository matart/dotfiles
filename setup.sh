# Link files

ln -sf ~/dotfiles/gitconfig ~/.gitconfig

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf ~/dotfiles/zshrc ~/.zshrc


# Install nvim
if [ $SPIN ]; then
    sudo apt-get install -y neovim
    sudo apt-get install -y fzf
    sudo apt-get install -y ripgrep
fi

# Copy config
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qall
# install theme
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sf ~/dotfiles/spin.zsh-theme ~/.oh-my-zsh/custom/themes/spin.zsh-theme
