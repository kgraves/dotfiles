# misc aliases
alias ll="ls -la"
alias la="ls -a"

# directory aliases
alias gits="cd ~/Documents/gits"

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

# for rvm
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
