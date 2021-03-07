
if [[ "$(uname -s)" == "Darwin" ]]; then
  # do OS X specific things
  brew install zsh
fi

if [[ "$(uname -s)" == "Linux" ]]; then
  # we're on linux
  sudo apt-get install zsh
fi

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"