#!/bin/bash

alias reload="source ~/.zshrc"
alias fuck="rm -rf"
alias _="sudo"

# Help the lazy typists again.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias path="echo -e ${PATH//:/\\n}"

# Why would I ever do this?
if [[ "$(uname -s)" == "Darwin" ]]; then
  # do OS X specific things
  alias top="TERM=vt100 top"
fi

if [ -x /bin/vim ]; then
    alias vi="/bin/vim"
    alias vim="/bin/vim"
    export EDITOR="/bin/vim"
fi

if [ -x /usr/bin/vim ]; then
    alias vi="/usr/bin/vim"
    alias vim="/usr/bin/vim"
    export EDITOR="/usr/bin/vim"
fi

if [ -x /usr/local/bin/vim ]; then
    alias vim="/usr/local/bin/vim"
    alias vi="/usr/local/bin/vim"
    export EDITOR="/usr/local/bin/vim"
fi
# Clearly, I really like vim.

export VISUAL=${EDITOR}

# A couple of different external IP lookups depending on which is down.
alias external_ip="curl -s icanhazip.com"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Show laptop's IP addresses
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# SSH stuff
# Pass our credentials by default
alias ssh='ssh -A'
alias sshA='ssh -A'
alias ssh-A='ssh -A'
alias ssh_unkeyed='/usr/bin/ssh'

alias scp_no_hostchecks='scp -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias ssh_no_hostchecks='ssh -A -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Set up even more shortcuts because I am that lazy a typist.
alias nh_scp=scp_no_hostchecks
alias nh_ssh=ssh_no_hostchecks
alias nhscp=scp_no_hostchecks
alias nhssh=ssh_no_hostchecks

# On the rare occasions I don't want to continue an interrupted download
# I can always delete the incomplete fragment explicitly. I usually just
# want to complete it.
alias wget="wget -c"

# Dump the last 20 history entries to make !number more convenient to use.
alias zh="fc -l -d -D"

# My typical tyops.
alias gerp="grep"
alias grep-i="grep -i"
alias grepi="grep -i"
alias knfie="knife"
alias maek="make"
alias psax="ps ax"
alias pswax="ps wax"
alias psxa="ps ax"
alias raek="rake"
alias tartvf="tar tvf"
alias tartvzf="tar tvzf"
alias tarxvf="tar xvf"

# Deal with various stupidities.
if [ -x /usr/bin/vagrant ]; then
  alias vagrant="/usr/bin/vagrant"
fi

# Use brew versions if present
if [ -x /usr/local/bin/mysql/bin/mysql ]; then
  alias mysql="/usr/local/mysql/bin/mysql"
fi

if [ -x /usr/local/bin/mysql/bin/mysqladmin ]; then
  alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
fi


alias weather="curl -4 http://wttr.in/Calgary"

# Shopify-specific
alias sst="systemctl list-dependencies spin.target"