# misc aliases
alias ll="ls -la"
alias la="ls -a"
alias vimp="vim -p"
alias open="xdg-open"

# directory aliases
alias gits="cd ~/Documents/gits"
alias notes="cd ~/Documents/notes"

# friendlier find command
#
# this supports bare words.
# ex: ff some_code*
function ff { find . -name "*$@*"; }

# friendlier tar command
# alias utar="tar xvzf"
function utar { tar xvzf "$1"; }

# for npm
# PATH=/usr/local/share/npm/bin:$PATH
#
# using this because of permissions issues. I don't want to change permissions
# of /usr/local and definitely don't want to install as root. This is a way
# cleaner way of installing npm packages, as long as I'm the only user on the
# machine.
# NOTE: This is paired with `npm config set prefix ~/npm`
export PATH="$PATH:$HOME/npm/bin"

# for rvm
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
