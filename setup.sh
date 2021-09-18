#!/bin/sh

# Variables
INSTALL_PACKAGES="neovim tmux zsh curl"

# Setup Linux
echo Setting Up Linux

# Pacman Packages

# Update
echo "Update & Upgrade (y/n) ?"
read DO_UPDATE

if [ $DO_UPDATE = "y" ]; then
  sudo pacman -Syyu
fi

# Install
echo "Install (y/n) ?"
read DO_INSTALL

if [ $DO_INSTALL = "y" ]; then
  sudo pacman -S $INSTALL_PACKAGES
fi

# Oh My Zsh
echo "Install Oh My Zsh (y/n) ?"
read DO_OH_MY_ZSH

if [ $DO_OH_MY_ZSH = "y" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerline10k
echo "Install Powerline10k (y/n) ?"
read DO_POWERLINE_10K

if [ $DO_POWERLINE_10K = "y" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  # Not working, TODO: Add settings to .zshrc
  #sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
fi

# zsh-autosuggestions
echo "Install zsh-autosuggestions (y/n) ?"
read DO_ZSH_AUTOSUGGESTIONS

if [ $DO_ZSH_AUTOSUGGESTIONS = "y" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # TODO: Add settings to .zshrc
fi

# zsh-syntax-highlighting
echo "Install zsh-syntax-highlighting (y/n) ?"
read DO_ZSH_SYNTAX_HIGHLIGHTING

if [ $DO_ZSH_SYNTAX_HIGHLIGHTING = "y" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # TODO: Add settings to .zshrc
fi

# SpaceVim
echo "Install SpaceVim (y/n) ?"
read DO_SPACEVIM

if [ $DO_SPACEVIM = "y" ]; then
  curl -sLf https://spacevim.org/install.sh | bash
fi

# vimproc.vim for SpaceVim
echo "Setup vimproc.vim for SpaceVim (y/n) ?"
read DO_VIMPROC_VIM

if [ $DO_VIMPROC_VIM = "y" ]; then
  SPACEVIM_DIR="/home/chris/.SpaceVim/bundle"
  cd $SPACEVIM_DIR
  git clone https://github.com/Shougo/vimproc.vim.git
  cd vimproc.vim
  make
fi

echo "Done - add any additional required settings"
