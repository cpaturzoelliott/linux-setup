#!/bin/sh

# Variables
INSTALL_PACKAGES="neovim tmux zsh curl"

# Setup Linux
echo Setting Up Linux

# APT Packages

# Update
echo "Update & Upgrade (y/n) ?"
read DO_UPDATE

if [ $DO_UPDATE = "y" ]; then
  sudo apt update
  sudo apt upgrade -y
fi

# Install
echo "Install (y/n) ?"
read DO_INSTALL

if [ $DO_INSTALL = "y" ]; then
  sudo apt install -y $INSTALL_PACKAGES
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

if [ $DO_POWERLINE_10K ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  # Not working, TODO: Add settings to .zshrc
  #sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k/powerlevel10k"/g' ~/.zshrc
fi

# zsh-autosuggestions
echo "Install zsh-autosuggestions (y/n) ?"
read DO_ZSH_AUTOSUGGESTIONS

if [ $DO_ZSH_AUTOSUGGESTIONS ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # TODO: Add settings to .zshrc
fi

# zsh-syntax-highlighting
echo "Install zsh-syntax-highlighting (y/n) ?"
read DO_ZSH_SYNTAX_HIGHLIGHTING

if [ $DO_ZSH_SYNTAX_HIGHLIGHTING ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # TODO: Add settings to .zshrc
fi

echo "Done"
