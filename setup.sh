#!/bin/bash

DIR=$(cd "$(dirname "$0")" && pwd)

link() { mkdir -p "$(dirname "$2")"; ln -sf "$1" "$2"; }

link "$DIR/.zshrc" "$HOME/.zshrc"
link "$DIR/.bash_profile" "$HOME/.bash_profile"
link "$DIR/.bashrc" "$HOME/.bashrc"
link "$DIR/.profile" "$HOME/.profile"
link "$DIR/.gitconfig" "$HOME/.gitconfig"
link "$DIR/.condarc" "$HOME/.condarc"
link "$DIR/.gpg.conf" "$HOME/.gnupg/gpg.conf"
chmod 700 "$HOME/.gnupg"
