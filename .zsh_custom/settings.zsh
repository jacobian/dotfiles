# exports / shell settings / shell options

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

# Fancy term stuff

# ez
export EZA_CONFIG_DIR=$HOME/.config/eza

# Bat
export BAT_THEME=Dracula

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# Don't expand globs when tab completing
setopt GLOB_COMPLETE
