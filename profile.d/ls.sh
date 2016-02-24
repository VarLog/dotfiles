case "$-" in
*i*)
    #
    # Colored file listings
    #
    if test -x /usr/bin/dircolors ; then
        #
        # set up the color-ls environment variables:
        #
        if test -f $HOME/.dir_colors ; then
      eval "`/usr/bin/dircolors -b $HOME/.dir_colors`"
        elif test -f /etc/DIR_COLORS ; then
      eval "`/usr/bin/dircolors -b /etc/DIR_COLORS`"
        fi
    fi
    
    #export CLICOLOR=1
    #export LSCOLORS=ExFxCxDxBxegedabagacad
    if test "$UID" = 0 ; then
        LS_OPTIONS="-A -G -F"
    else
        LS_OPTIONS="-G -F"
    fi
    
    #
    # Avoid trouble with Emacs shell mode
    #
    if test "$EMACS" = "t" ; then
        LS_OPTIONS='';
    fi
    export LS_OPTIONS
    
    is=`basename $SHELL`
    #
    # useful ls aliases
    #
    if test "$is" != "ash" ; then
      unalias ls 2>/dev/null
    fi
    case "$is" in
    bash|dash|ash)
      _ls ()
      {
        local IFS=' '
        command ls $LS_OPTIONS ${1+"$@"}
      }
      alias ls=_ls
      ;;
    zsh)
      test -s /etc/profile.d/ls.zsh && . /etc/profile.d/ls.zsh
      ;;
    ksh)
      _ls ()
      {
        typeset IFS=' '
        command ls $LS_OPTIONS ${1+"$@"}
      }
      alias ls=_ls
      ;;
    *)  alias ls='/bin/ls $LS_OPTIONS' ;;
    esac
    alias dir='ls -l'
    alias ll='ls -l'
    alias la='ls -la'
    alias l='ls -alF'
    alias ls-l='ls -l'
    ;;
esac

