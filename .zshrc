export XDG_CONFIG_HOME='/Users/jacob/.config'
export COMPLETION_WAITING_DOTS="true"

eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
zstyle ':completion:*' menu select

for file in $XDG_CONFIG_HOME/zsh/*; do
    source "$file"
done