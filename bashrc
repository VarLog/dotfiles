# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1="\[\e[0;32m\]\u\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\] \$ "

if [ "$UID" == 0 ]; then
  PS1="\[\e[0;31m\]\u\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\] # "
fi

# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

