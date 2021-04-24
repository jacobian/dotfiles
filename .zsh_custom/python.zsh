# I have my own prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# pipx
path+=/Users/jacob/.local/bin

# enable completion for pipx - FIXME
# autoload -U bashcompinit
# bashcompinit
# eval "$(register-python-argcomplete pipx)"

# virtualenvwrapper
# use the lazy version, again for shell startup time.
# this has to go after pipx, because I installed virtualenvwrapper with pipx
[ -e "$commands[virtualenvwrapper_lazy.sh]" ] && source "$commands[virtualenvwrapper_lazy.sh]"

# make sure virtualenvwrapper knows where its python is
export VIRTUALENVWRAPPER_PYTHON=~/.local/pipx/venvs/virtualenvwrapper/bin/python
