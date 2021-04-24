# Basic oh-my-zsh config -- everything else is in zsh_custom

export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh_custom"
COMPLETION_WAITING_DOTS="true"

eval "$(/opt/homebrew/bin/brew shellenv)"

plugins=(
    brew
    django
    heroku
    npm
    terraform
)

if type starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# Homebrew completion - this has to happen before compinit,
# see https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh
