# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="cloud_kris"

plugins=(git zsh-autosuggestions brew cloudapp osx pip python sudo web-search battery)

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
alias t="phpunit"
alias www="cd /var/www"
alias code="cd ~/dev"
alias home="cd ~/"

EDITOR=nvim
# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^t' autosuggest-execute
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

export NVM_DIR="/home/kristijan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
