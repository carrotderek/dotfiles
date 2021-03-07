export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
TERM="xterm-256color"

source "${HOME}/.zgen/zgen.zsh"

if [[ -r ~/.powerlevel9k_font_mode ]]; then
  POWERLEVEL9K_MODE=$(head -1 ~/.powerlevel9k_font_mode)
fi

EDITOR='vim'

# Keep a ton of history.
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

if [ -r ~/.sh_aliases ]; then
  source ~/.sh_aliases
fi

# Stuff only tested on zsh, or explicitly zsh-specific
if [ -r ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -r ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

# Speed up autocomplete, force prefix mapping
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# Load any custom zsh completions we've installed
if [ -d ~/.zsh-completions ]; then
  for completion in ~/.zsh-completions/*
  do
    source "$completion"
  done
fi

source "${HOME}/.dotfiles/zsh/powerlevel9k/theme.zsh"

GIT_UNCOMMITTED="+"
GIT_UNSTAGED="!"
GIT_UNTRACKED="?"
GIT_STASHED="$"
GIT_UNPULLED="⇣"
GIT_UNPUSHED="⇡"

# ENV variables to enable or disable yarn:

YARN_ENABLED=true
# eval $(dircolors -b $HOME/.dircolors)
bash ~/.dotfiles/zsh/powerlevel9k/theme.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion