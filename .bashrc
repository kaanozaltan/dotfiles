. "$HOME/.local/bin/env"

# skip for non-interactive shells
[[ $- != *i* ]] && return

# colored prompt
PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]$ '

# colored ls
export CLICOLOR=1
export LSCOLORS="ExGxFxdaCxDaDahbadacec"
alias ll="ls -lhF"
alias la="ls -lAhF"
alias lt="ls -lhFt"

# colored grep and diff output
alias grep="grep --color=auto"
alias diff="diff --color=auto"
