# I have my own prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Workaround for pyenv/poetry PATH conflicts
# see https://github.com/sdispater/poetry/issues/571
# poetry() {
#     if [[ $@ == "shell" ]]; then
#         if ([[ -f "$(poetry env info -p)/bin/activate" ]] && [[ -z "${VIRTUAL_ENV:-}" ]]); then
#             command source $(poetry env info -p)/bin/activate
#         else 
#             command poetry "$@"
#         fi
#     else
#         command poetry "$@"
#     fi
# }

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/pipx/venvs/virtualenvwrapper/bin/python
source /Users/jacob/.local/bin/virtualenvwrapper.sh

# pipx
path+=/Users/jacob/.local/bin