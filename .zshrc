# *-*-*-*-* ZSH/OH MY ZSH SETTINGS *-*-*-*-*

setopt globdots

ZSH_CUSTOM=$HOME/dotfiles/zsh_custom
ZSH_THEME="olofssonanton"

plugins=(
  colored-man-pages
  dircycle
  docker
  kubectl
  git
  globalias
  jump
  npm
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' special-dirs false

# *-*-*-*-* PREFERENCES *-*-*-*-*

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='nano'
# else
  export EDITOR='nano'
# fi


# *-*-*-*-* UTILITIES *-*-*-*-*

# Copy to clipboard
alias clip="xclip -se c"

# Display calendar
alias cal="ncal -bw"

# List disk usage of contents of current directory
alias diskusage="du -shc * | sort -h"

# Search in directory, excluding certain paths
function ff() {
  echo $1
  find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*" -not -path "*/.babelCache/*" -not -path "*/build/*" -not -path "*/dist/*" -exec grep --color=auto -nHI -e $1 {} +
}

# Find and replace in all files in the current directory
function findAndReplace() {
  if [ -z "$3" ]; then
    echo "Replacing all occurrences of \"$1\" with \"$2\" in current directory."
    if [ "$(uname)" = "Darwin" ]; then
      find . -type f -exec test -r {} \; -exec test -w {} \; -exec sed -i "" "s/$1/$2/g" {} \;
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
      find . -type f -readable -writable -exec sed -i "s/$1/$2/g" {} \;
    fi
  else
    if [ "$(uname)" = "Darwin" ]; then
      sed -i "" "s/$1/$2/g" "$3"
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
      sed -i "s/$1/$2/g" "$3"
    fi
  fi
}

# Alias for the plugin "jump"
alias j="jump"

# Node REPL with top-level await
alias noderepl="node --experimental-repl-await"

# Attach to or create tmux session
alias tmuxa="tmux new-session -A -s"

# Serve current directory on port 1337
alias webshare="python -m SimpleHTTPServer 1337"


# *-*-*-*-* NETWORK *-*-*-*-*

# Open network manager (can never remember name)
alias wifi="nmtui"

# Ping antonolofsson.com
alias pingme="ping antonolofsson.com"

# See ports in use
alias portsinuse="sudo ss -tulpn"


# *-*-*-*-* GIT *-*-*-*-*

# Git pull with rebase and a touch of magic (<3)
alias gupas="git pull --rebase --autostash --stat"

# Git add interactive
alias gai="git add -i"

# Git checkout interactive (patch)
alias gcop="git checkout -p"

# Search for commits with patches matching a given string
alias glps="git log -p -S "


# *-*-*-*-* Node & NPM *-*-*-*-*

# Note:
# For a clean installation of NPM (with global packages without sudo) and Node installed via 'n':
# 1. Install npm via 'sudo apt install npm'
#   a. Add the following line to '.npmrc':
#     prefix=${HOME}/.npm-packages
#   b. Update npm via 'npm install -g npm'
#   c. Purge apt's npm via 'sudo apt purge npm'
# 2. Install 'n' via 'npm install -g n'
# 3. Install node with 'n'

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export N_PREFIX="$HOME/.node"
export PATH="$N_PREFIX/bin:$PATH"


# *-*-*-*-* Docker *-*-*-*-*

function dockerexec() {
  docker exec -it $(docker ps | grep $1 | awk -F " " '{ print $1 }') ${2:-bash}
}


# *-*-*-*-* LOCAL SETTINGS *-*-*-*-*

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
