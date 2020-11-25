# the aws plugin has a 400ms startup penalty (see
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/aws.plugin.zsh#L64)
# while it checks for homebrew, but I have aws installed through pipx. So use
# that instead.
if [ -e /Users/jacob/.local/bin/aws_zsh_completer.sh ]; then
    source /Users/jacob/.local/bin/aws_zsh_completer.sh
fi
