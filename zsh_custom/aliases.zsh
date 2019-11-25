alias ls='ls -F'
alias h=heroku
alias tf=terraform
alias av=aws-vault

function pyg() {
    pbpaste | pygmentize -f rtf -O "style=friendly,fontface=Source Code Pro" "$1" | pbcopy
}