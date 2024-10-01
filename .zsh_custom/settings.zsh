# basic shell options
# see tool-specific files for, uh, tool-specific stuff

path+=~/bin

# Basic term stuff
export CLICOLOR=1
export DISPLAY=:0.0
export EDITOR="code -w"
export LC_CTYPE=en_US.UTF-8
export LESS='-r'
export PAGER=less
export QUIETLOGIN
export TERM=xterm-256color
unset MAILCHECK


# Don't expand globs when tab completing
setopt GLOB_COMPLETE
