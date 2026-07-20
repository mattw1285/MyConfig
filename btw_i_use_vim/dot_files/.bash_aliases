
## --- Navigation --- ##
alias ..='cd ..'
alias ...='cd ../..'
alias home='clear && cd ~'

## --- Dev Niceness --- ##
alias ga='git add .'
alias gc='git commit -m' 
alias gs='git status'
alias gl="git log -n 8 --pretty=format:'%C(auto)%h %C(magenta)%ad %C(reset)%s %C(cyan)[%an]' --date=short"
alias cat='batcat'
alias tk='tmux kill-session'
alias ta='tmux attach'

## --- System & Utility --- ##
alias update='sudo apt update -y && sudo apt full-upgrade -y'
