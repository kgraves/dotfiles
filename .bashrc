# misc aliases
alias ls="ls -p --color=auto"
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



# taken from /etc/skel/.bashrc
#
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
    # xterm-color) color_prompt=yes;;
# esac

# if [ -n "$force_color_prompt" ]; then
    # if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	# color_prompt=yes
    # else
	# color_prompt=
    # fi
# fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

