#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#----------------------------------------------------
alias i="yay -S"
alias r="sudo pacman -Rncs"
alias u="sudo pacman -Syu"
alias update="yay -Syu"
alias wifi="nmtui"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lalettan='sh malayalam-dialogue-cli/maladialogue mohanlal'

clear

eval "$(starship init bash)"

fastfetch

sh malayalam-dialogue-cli/maladialogue mohanlal
