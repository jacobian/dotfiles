# Support "workon XXX" for any env manager - venv, poetry, pipenv, etc.
function _virtualenv_info() {
    if [ $VIRTUAL_ENV ]; then
        # If this is a Poetry env, strip the -xxxx-pyx.y from the end
        if [[ $VIRTUAL_ENV == */pypoetry/virtualenvs/* ]]; then
            ENV_NAME=$(basename "${VIRTUAL_ENV}" | rev | cut -d- -f3- | rev)

        # Same but for pipenv
        elif [[ $PIPENV_ACTIVE ]]; then
            ENV_NAME=$(basename "${VIRTUAL_ENV}" | rev | cut -d- -f2- | rev)

        # If this is a virtualenvwrapper, use the wrapper dir
        elif [[ $VIRTUAL_ENV == */.virtualenvs/* ]]; then
            ENV_NAME=$(basename "${VIRTUAL_ENV}")

        # Otherwise use the name of the venv dir
        else
            folder=$(dirname "${VIRTUAL_ENV}")
            ENV_NAME=$(basename "$folder")
        fi

        echo "%{$fg[grey]%}workon:%{$reset_color%}%{$fg[magenta]%}$ENV_NAME%{$reset_color%}"
    fi
}

_aws_vault_info() {
    if [ $AWS_VAULT ]; then
        VAULT=$(echo -n $AWS_VAULT | cut -d= -f2)
        echo "%{$fg[grey]%}aws:%{$reset_color%}%{$fg[yellow]%}$VAULT%{$reset_color%}"
    fi
}

### Git Prompt

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%{$fg[grey]%}%s:%{$fg[cyan]%}%b%{$fg_bold[red]%}%c%u%{$reset_color%}"
zstyle ':vcs_info:*' actionformats "%{$fg[grey]%}%s:%{$fg[cyan]%}%b%{$fg[red]%}%c%u %{$fg_bold[black]%}%{$bg[yellow]%}(%a)%{$reset_color%}"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' stagedstr 's'

# Show marker if there are untracked files in repository
# See https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples#L155
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] &&
        git status --porcelain | grep '??' &>/dev/null; then
        hook_com[staged]+='?'
    fi
}

precmd() {
    vcs_info
}

### And finall, the prompt

PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%} \
${vcs_info_msg_0_}% \
$(_virtualenv_info) \
$(_aws_vault_info)
$ '
