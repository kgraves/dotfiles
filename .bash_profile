# misc aliases
alias ll="ls -la"
alias la="ls -a"

# vagrant aliases
alias vup="vagrant up puppet"
alias vst="vagrant status puppet"
alias vhalt="vagrant halt puppet"
alias vsus="vagrant suspend puppet"
alias vssh="vagrant ssh puppet"
alias vd="fab select:dev,kyle,vagrant vagrant_deploy"

# directory aliases
alias mm="cd ~/Documents/minted"
alias pp="cd ~/Documents/puppet"
alias jsd="cd ~/Documents/minted/drupal/static/src/js"
alias pyd="cd ~/Documents/minted/src/py/minted"
alias phpd="cd ~/Documents/minted/drupal"
alias cssd="cd ~/Documents/minted/drupal/static/src/sass"
alias sqld="cd ~/Documents/minted/schema/migrations/upgrades"

# fab aliases
alias mcd="fab select:dev,kyle,vagrant memcached:stop"
alias tt="fab select:dev,kyle,vagrant fab.solr.reload" # TODO might need to use tomcat action in fabfile
alias uu="fab select:dev,kyle,vagrant fab.puppet.uwsgi.restart:use_sudo=True"
alias lgs="fab select:dev,kyle,vagrant fab.logstash.stop"
alias lgpk="fab select:dev,kyle,vagrant fab.logstash.pkill"
alias ss="mcd && tt && uu && lgs"

# dev tools aliases
alias pr="post-review -g"

# friendlier find command
#
# this supports bare words.
# ex: ff some_code*
function ff { find . -name "*$@*"; }

# friendlier tar command
# alias utar="tar xvzf"
function utar { tar xvzf "$1"; }

# for MAMP; from wiki
PATH=/Applications/MAMP/Library/bin/:$PATH
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# for rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# for npm
PATH=/usr/local/share/npm/bin:$PATH
