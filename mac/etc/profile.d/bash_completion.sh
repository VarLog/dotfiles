# Check for interactive bash and that we haven't already been sourced.
if [ -n "$BASH_VERSION" -a -n "$PS1" -a -z "$BASH_COMPLETION_COMPAT_DIR" ]; then

# Check for recent enough version of bash.
bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
if [ $bmajor -gt 4 ] || [ $bmajor -eq 4 -a $bminor -ge 1 ]; then
    for s in /usr/local/etc/bash_completion.d/* ; do
        test -r $s -a ! -k $s && . $s
    done
    unset s
fi
unset bash bmajor bminor

fi
