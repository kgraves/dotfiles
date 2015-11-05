# misc aliases
alias aa="source ./env/bin/activate"
alias ast="~/android-studio/bin/studio.sh"
alias chrome="/opt/google/chrome/google-chrome"
alias flux="xflux -z 94608"
alias gg="gulp"
alias ls="ls -p --color=auto"
alias ll="ls -la"
alias la="ls -a"
alias open="xdg-open"
# there is a rouge alias somewhere, so I need this temporary fix
alias pip="/usr/local/bin/pip"
alias rn="/bin/systemctl restart network-manager.service"
alias vimp="vim -p"

# directory aliases
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

# general exports
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=chrome

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
# export GOPATH=$HOME/Documents/gits/golang
# TODO this is temporary. Only using this for algorithm repo
export GOPATH=$HOME/Documents/gits/algorithms

