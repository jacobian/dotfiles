# NB: whenever possible, try to put stuff in .config/zsh/whatever.zsh -- rather
# than here -- so it's easier to see/find/organize. Everything in here should
# have a reason it has to happen early. 


export XDG_CONFIG_HOME='/Users/jacob/.config'

# Init homebrew - needs to happen early so other stuff can call `brew whatever`
eval "$(/opt/homebrew/bin/brew shellenv)"
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Completion - don't know if this has to happen early or not, probably does in case
# other files add completion stuff.
export COMPLETION_WAITING_DOTS="true"
autoload -Uz compinit
zstyle ':completion:*' menu select

# Now source all the other config files
for file in $XDG_CONFIG_HOME/zsh/*; do
    source "$file"
done