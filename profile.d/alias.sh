#
# Some useful functions
#
remount () { /bin/mount -o remount,${1+"$@"} ; }

#
# Set some generic aliases
#
alias o='less'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
if test "$is" != "ksh" ; then
    alias -- +='pushd .'
    alias -- -='popd'
fi
alias rd=rmdir
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias md='mkdir -p'
alias beep='echo -en "\007"'

# tmux
alias tma='tmux attach -d -t'
alias tml='tmux list-sessions'
alias git-tmux='tmux new -s $(echo $(basename $(pwd))|tr "." "_")'

