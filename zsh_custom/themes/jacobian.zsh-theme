# Support "workon XXX" for any env manager - venv, poetry, pipenv, etc.
function _virtualenv_info() {
    if [ $VIRTUAL_ENV ]; then
        # If this is a Poetry env, strip the -xxxx-pyx.y from the end
        if [[ $VIRTUAL_ENV == */pypoetry/virtualenvs/* ]]; then
            ENV_NAME=`basename "${VIRTUAL_ENV}" | rev | cut -d- -f3- | rev`

        # Same but for pipenv
        elif [[ $PIPENV_ACTIVE  ]]; then
            ENV_NAME=`basename "${VIRTUAL_ENV}" | rev | cut -d- -f2- | rev`

        # If this is a virtualenvwrapper, use the wrapper dir 
        elif [[ $VIRTUAL_ENV == */.virtualenvs/* ]]; then
            ENV_NAME=`basename "${VIRTUAL_ENV}"`
        
        # Otherwise use the name of the venv dir
        else
            folder=`dirname "${VIRTUAL_ENV}"`
            ENV_NAME=`basename "$folder"`
        fi
      
      echo "%{$fg[grey]%}workon:%{$reset_color%}%{$fg[magenta]%}$ENV_NAME%{$reset_color%}"
    fi
}

_aws_vault_info() {
    if [ $AWS_VAULT ]; then
        VAULT=`echo -n $AWS_VAULT | cut -d= -f2`
        echo "%{$fg[grey]%}aws:%{$reset_color%}%{$fg[yellow]%}$VAULT%{$reset_color%}"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%} \
$(git_prompt_info) \
$(_virtualenv_info) \
$(_aws_vault_info)
$ '