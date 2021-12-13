function exists() {
  if (( $+commands[$1] )); then return 0; else return 1; fi
}

function ff() {
  find . -type f -iname '*'$@'*' -ls
}

# Find things in that enormous command history file
function hgrep40 {
  history | egrep --color -i "$@" | tail -40
}

function hgrep {
  history | grep -i "$@" | tail -20
}

function hgrep_full {
  history | egrep --color -i "$@"
}

function envgrep() {
  printenv | grep -i "$@"
}

# From Dan Ryan's blog - http://danryan.co/using-antigen-for-zsh.html
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# From commandlinefu.com
function watch() { t=$1; shift; while test :; do clear; date=$(date); echo -e "Every $ts: $@ \t\t\t\t $date"; $@; sleep $t; done }

function calc() {
  awk "BEGIN{ print $* }" ;
}

function procs_for_path() {
  for pid in $(lsof "$@" | cut -d' ' -f 3 | sort | uniq)
  do
    ps -f -p $pid
  done
}

get_load() {
  uptime | awk '{print $11}' | tr ',' ' '
}

function bash_repeat() {
  n=$1
  shift
  while [ $(( n -= 1 )) -ge 0 ]
  do
      "$@"
  done
}

# Recursively touch, e.g. touch + mkdir -p
# so files can easily be created at depth
#
canhaz() {
  mkdir -p -- "${1%/*}" && touch -- "$1"
}

canhaz-script() {
  canhaz "${1}" && chmod +x "$1"
}

pong() {
  ping -c 10 "$@"
}

show_terminal_colors() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# lists zombie processes
function zombie() {
  ps aux | awk '{if ($8=="Z") { print $2 }}'
}

# get the content type of an http resource
# from https://github.com/jleclanche/dotfiles/blob/master/.zshrc
function htmime {
  if [[ -z $1 ]]; then
    print "USAGE: htmime <URL>"
    return 1
  fi
  mime=$(curl -sIX HEAD $1 | sed -nr "s/Content-Type: (.+)/\1/p")
  print $mime
}

# Start an HTTP server from a directory, optionally specifying the port
function httpserver() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Shopify-specific logs
function spinlog() {
  jc -u "proc-shopify--${1}@server.service" --follow --output cat
}