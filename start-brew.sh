#!/bin/bash

export BREW_PATH="$HOME/.linuxbrew"

if [ ! -d "$BREW_PATH/Homebrew" ]; then
    git clone https://github.com/Homebrew/brew "$BREW_PATH/Homebrew"
    mkdir -p "$BREW_PATH/bin"
    ln -s "$BREW_PATH/Homebrew/bin/brew" "$BREW_PATH/bin/brew"
    
    eval "$($BREW_PATH/bin/brew shellenv)"
    brew update --force --quiet
fi

exec alacritty -t "Brewflat" -e bash --rcfile <(echo "
    eval \$($BREW_PATH/bin/brew shellenv); 
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
")
