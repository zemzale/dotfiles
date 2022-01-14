#!/bin/zsh

brew install python node golang thefuck tmux fzf exa bat rg gh tldr

# TODO: check if this exists
/usr/local/opt/fzf/install
if ! [ -d $HOME/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    ln -sf $HOME/git/dotfiles/zshrc $HOME/.zshrc
fi

# TODO: check if this exists
git clone https://github.com/agkozak/zsh-z $HOME/.oh-my-zsh/custom/plugins/zsh-z

python3 -m pip install --user --upgrade pynvim
gem install neovim

# TODO: check if this exists
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'



# TODO: check if this exists
echo "Creating symlinks"
CONF_DIR="$HOME/.config"
NVIM_CONF_DIR="$CONF_DIR/nvim"
mkdir -p $NVIM_CONF_DIR
mkdir -p $CONF_DIR/tmux/
ln -s $HOME/git/dotfiles/vim/*.vim $NVIM_CONF_DIR/
ln -s $HOME/git/dotfiles/tmux/tmux.conf $CONF_DIR/tmux/
ln -s $HOME/git/dotfiles/kitty.conf $CONF_DIR/kitty/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# TODO: check if this exists
git clone https://github.com/tmux-plugins/tpm $CONF_DIR/tmux/plugins/tpm

if ! command -v brew &> /dev/null
then 
	echo "Installing brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else 
	echo "brew is already installed"
fi

echo "Installing deps for neovim building"
brew install ninja libtool automake cmake pkg-config gettext curl &> /dev/null

echo "Installing neovim"

git clone https://github.com/neovim/neovim $HOME/git/neovim &> /dev/null
cd $HOME/git/neovim && make && make install &> /dev/null

nvim --headless +PlugInstall +qa
nvim --headless +GoInstallBinaries +qa
