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

# general exports
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
export EDITOR=vim
export BROWSER=chrome

# --------------------------
# export DIR_COLORS="$HOME/.dircolors"
eval "`dircolors -b ~/.dircolors`"
# --------------------------

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
