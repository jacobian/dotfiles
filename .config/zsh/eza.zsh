# https://eza.rocks

export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza

alias ls='eza --classify=auto'
alias ll='eza --classify=auto --long --header --git'
alias tree="eza --classify=auto --tree --icons=auto"