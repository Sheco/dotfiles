# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PATH=$HOME/.npm-packages/bin:$HOME/.config/composer/vendor/bin:$PATH
export NODE_PATH=$HOME/.npm-packages/lib/node_modules
export EDITOR=vim
export VISUAL=vim

if [ $VIM ]
then
    PS1='\n\u@\h:\W [vim] \$ '
else
    PS1='\n\u@\h:\W \$ '
fi

export PS1
alias ls='ls --color'
