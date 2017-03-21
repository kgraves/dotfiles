# misc aliases
alias aa="source ./venv/bin/activate"
alias ast="~/android-studio/bin/studio.sh"
alias chrome="/opt/google/chrome/google-chrome"
alias da="deactivate"
alias flux="xflux -z 94608"
alias gg="gulp"
alias ls="ls -p --color=auto"
alias ll="ls -la"
alias la="ls -a"
alias open="xdg-open"
alias pp="pebble"
alias rn="/bin/systemctl restart network-manager.service"
alias snd="alsactl --file ~/.alsa.state restore"
alias vimp="vim -p"

# directory aliases
alias ctci="cd ~/Documents/gits/ctci"
alias dcw="cd ~/Documents/gits/datacntr-web"
alias dcf="cd ~/Documents/gits/datacntr-frontend"
alias dots="cd ~/Documents/gits/dotfiles"
alias gits="cd ~/Documents/gits"
alias notes="cd ~/Documents/gits/notes/notes"
alias ph="cd ~/Documents/gits/ph-ecom-web"
alias smsg="cd ~/Documents/gits/scrapemesomethinggood"

# friendlier find command
#
# this supports bare words.
# ex: ff some_code*
function ff { find . -name "*$@*"; }

# friendlier tar command
function utar { tar xvzf "$1"; }

export EDITOR=vim
export BROWSER=chrome

# --------------------------
# export DIR_COLORS="$HOME/.dircolors"
# eval "`dircolors -b ~/.dircolors`"
# --------------------------

# for home bin folder
export PATH="$PATH:$HOME/bin"

# for nvm
export NVM_DIR="/home/kg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# for java (and android studio)
export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java"

# for android studio binary
export PATH="$PATH:$HOME/android-studio/bin"

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# for golang
#
# Specifing GOROOT here, because I decided to install the binary to my home
# directory.
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Documents/gits/golang

# for pebble development
export PATH=~/pebble-dev/pebble-sdk-4.0-linux64/bin:$PATH

# for rust
export PATH="$HOME/.cargo/bin:$PATH"

# A function to be runned by bash that constructs a prompt command.
function construct_prompt () {
  local user="$USER"
  # gets just the current directory name
  # source: http://stackoverflow.com/a/1371283
  local curr_dir="${PWD##*/}"
  local git_text=""

  # set some colors to be used in the prompt
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  local YELLOW="\[\033[1;33m\]"
  # return color to Terminal setting for text color
  local DEFAULT="\[\033[0;39m\]"

  # construct git repo text
  if is_in_git_repo; then
    # git branch name
    local branch_name=$(get_git_branch_name)

    # git status info
    local status_text=$(get_git_status_text)

    # construct final git_text variable
    git_text=" (${GREEN}$branch_name${YELLOW}$status_text${DEFAULT})"
  fi

  # export everything as PS1
  # format: "[USER]> CURR_DIR (BRANCH: !?!)"
  export PS1="${BCYAN}[\u]${DEFAULT} $curr_dir$git_text $ "
}

function is_in_git_repo () {
  git rev-parse --git-dir > /dev/null 2> /dev/null;
}

function get_git_branch_name () {
  git branch | cut -d ' ' -f 2
}

function get_git_status_text () {
  local lines=$(git status --short | wc -l)
  if [[ lines -gt 0 ]]; then
    # TODO try to get lightning bolt working (
    # echo -e " \xE2\x9A\xA1"
    # echo " ⚡"
    echo " !?!"
  fi
}

# set bash variable so this is called
PROMPT_COMMAND=construct_prompt
