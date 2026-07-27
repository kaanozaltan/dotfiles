export PATH=/Library/TeX/texbin:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniforge3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(direnv hook zsh)"

. "$HOME/.local/bin/env"

# command history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# arrow-key tab completion menu with case-insensitive matching
autoload -Uz compinit && compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# type a directory path without cd to navigate there
setopt AUTO_CD
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# colorized ls
export CLICOLOR=1
alias ll="ls -lhF"
alias la="ls -lAhF"
alias lt="ls -lhFt"

# colorize grep and diff output
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# editor opened by git
export EDITOR="vim"
export VISUAL="vim"

# make a directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# print PATH one entry per line
path() { echo "$PATH" | tr ':' '\n'; }

# extract any archive: extract file.tar.gz
extract() {
  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.tar.xz) tar xJf "$1" ;;
    *.zip) unzip "$1" ;;
    *.gz) gunzip "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.7z) 7z x "$1" ;;
    *.rar) unrar x "$1" ;;
    *) echo "\"$1\" cannot be extracted" ;;
  esac
}

# flush DNS cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# open current directory in Finder
alias finder="open -a Finder ."

# delete all .DS_Store files recursively from current directory
alias cleanup="find . -name '.DS_Store' -delete"
