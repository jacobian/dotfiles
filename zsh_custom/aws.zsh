# the aws plugin has a 400ms startup penalty (see
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/aws.plugin.zsh#L64)
# while it checks for homebrew, but I have aws installed through pipx. So use
# that instead.
if [ -e /Users/jacob/.local/bin/aws_zsh_completer.sh ]; then
    source /Users/jacob/.local/bin/aws_zsh_completer.sh
fi

# aws-vault + yuibkey helpers
# see https://gist.github.com/chtorr/0ecc8fca27a4c5e186c636c262cc4757

function _aws_check_profile() {
  if [ $# -eq 0 ]; then
    echo "Must pass aws-vault profile name"
    return 1
  fi

  grep -qw "^\[profile $1\]$" <~/.aws/config
  if [ $? -gt 0 ]; then
    echo "Profile $1 not found in aws config"
    return 1
  fi
}

function ave() {
  _aws_check_profile $1
  if [ $? -gt 0 ]; then
    return $?
  fi
  aws-vault exec $1 \
    --mfa-token=$(ykman oath code --single aws | awk '{print $NF}') \
    ${@:2}
}
