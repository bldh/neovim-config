# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(git zsh-autosuggestions brew cloudapp pip python sudo web-search battery)

source $ZSH/oh-my-zsh.sh

alias c7='sudo chmod -R 777'
alias rma='sudo rm -rf'
alias install='brew install'
alias search='brew search'
alias dl='cd ~/Downloads'
alias c7="sudo chmod -R 777"
alias r7="sudo rm -rf"
alias l="ls -l"
alias c="clear"
alias cp="cp -r"
alias www="cd /var/www"
alias code="cd ~/dev"
alias home="cd ~/"
alias boot_link2="/usr/local/mcuxpressoide/ide/bin/boot_link2"
EDITOR=nvim
# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^t' autosuggest-execute
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

export EDITOR=nvim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck -a)
