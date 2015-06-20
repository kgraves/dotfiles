# misc aliases
alias aa="source ./env/bin/activate"
alias ast="~/android-studio/bin/studio.sh"
alias chrome="/opt/google/chrome/google-chrome"
alias ls="ls -p --color=auto"
alias ll="ls -la"
alias la="ls -a"
alias node="node-0.12.1"
alias npm="~/npm/bin/npm"
alias open="xdg-open"
# there is a rouge alias somewhere, so I need this temporary fix
alias pip="/usr/local/bin/pip"
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

# for npm
# PATH=/usr/local/share/npm/bin:$PATH
#
# using this because of permissions issues. I don't want to change permissions
# of /usr/local and definitely don't want to install as root. This is a way
# cleaner way of installing npm packages.
#
# NOTE: This is paired with `npm config set prefix ~/npm`
export PATH="$PATH:$HOME/npm/bin"

# add project level node modules to path
export PATH="$PATH:./node_modules/.bin"

# general exports
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=chrome

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# for java (and android studio)
export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java"

# for android studio binary
export PATH="$PATH:$HOME/android-studio/bin"

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
