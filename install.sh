#!/usr/bin/env bash

echo "🎁 Installing deps, tools & core apps"
# brew bundle
#sudo spctl --master-disable
# echo "🎁 Installing shell deps."

if [[ "$(uname -s)" == "Darwin" ]]; then
  # do OS X specific things
  brew install zsh
fi

if [[ "$(uname -s)" == "Linux" ]]; then
  # we're on linux
  sudo apt-get install zsh
fi

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

echo "🎁 Setting up shell enviroment."

HOMEWORLD=~/dotfiles

echo "🎁 Your configuration word will be stored at ${HOMEWORLD}"

echo "🚀 Copying ${PWD}"
echo "🔪 Backuping previous setup to ~/backup"
mkdir ~/backup

echo "🌩😩 It's okay if something fails here."

sudo mv -f ~/.zshrc ~/backup
sudo mv -f ~/.zsh_aliases ~/backup
sudo mv -f ~/.aliases ~/backup
sudo mv -f ~/.zgen_setup ~/backup
sudo mv -f ~/.zsh_functions ~/backup
sudo mv -f ~/.bash_prompt ~/backup
sudo mv -f ~/.bashrc ~/backup
sudo mv -f ~/.bash_profile ~/backup

echo "🔪 Removing prevous config..."
echo "😩 It's okay."

rm -rf ~/.zshrc
rm -rf ~/.zsh_aliases
rm -rf ~/.aliases
rm -rf ~/.zgen_setup
rm -rf ~/.zsh_functions
rm -rf ~/.bash_prompt
rm -rf ~/.bashrc
rm -rf ~/.bash_profile

echo "🍆 Setting up Everything."
echo "👉👈 Linking all your configs with ${HOMEWORLD}"

ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/dotfiles/zsh/zsh_aliases.zsh ~/.zsh_aliases
ln -s ~/dotfiles/zsh/zsh_functions.zsh ~/.zsh_functions
ln -s ~/dotfiles/powerlevel9k/theme.zsh ~/.powerlevel9k

ln -s ~/dotfiles/zsh/zgen_setup.zsh ~/.zgen_setup 
# ln -s ~/dotfiles/vimrc.js/vimrc /.vimrc
# ln -s ~/dotfiles/vimrc.js ~/.vimrc.js
# ln -s ~/dotfiles/.bashrc ~/.bashrc
# ln -s ~/dotfiles/.bash_profile ~/.bash_profile
# ln -s ~/dotfiles/.bash_prompt ~/.bash_prompt
# ln -s ~/dotfiles/.exports ~/.exports
# ln -s ~/dotfiles/.inputrc ~/.inputrc
# ln -s ~/dotfiles/.screenrc ~/.screenrc
ln -s ~/dotfiles/.aliases ~/.aliases

echo "💣 Now zsh install all 🍓 plugins."
zsh

echo "💣 🔪🔪🔪 Done. Enjoy that."
