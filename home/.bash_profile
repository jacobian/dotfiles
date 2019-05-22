# Load all the stuff in .bashrc.d. The order's somewhat important, so
# don't just do "for file in .bashrc.d/*".
source ~/.profile.d/path
source ~/.profile.d/exports
source ~/.profile.d/aliases
source ~/.profile.d/completion
source ~/.profile.d/python
source ~/.profile.d/prompt
# source ~/.profile.d/gpg-agent
test -r ~/.profile.private && source ~/.profile.private

# Shell opts
shopt -s cdspell
shopt -s extglob
shopt -s histappend
shopt -s nocaseglob
# Created by `userpath` on 2019-05-20 19:40:12
export PATH="$PATH:/Users/jacob/.local/bin"
