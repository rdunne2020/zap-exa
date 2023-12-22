#!/bin/sh

# Exit if the 'eza' command could not be found
if ! (( $+commands[eza] )); then
    echo "ERROR: 'eza' command not found"
    return
fi

# Create alias override commands using 'exa'
alias ls='eza --group-directories-first --icons'

# Use the --git flag if the installed version of exa supports git
# Related to https://github.com/ogham/exa/issues/978
if eza --version | grep -q '+git';
then
	alias ll='ls --octal-permissions -lh --git'
else
	alias ll='ls --octal-permissions -lh'
fi

alias la='ll -a'
alias tree='ll --tree --level=2'
