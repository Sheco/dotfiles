# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PATH=$HOME/.npm-packages/bin:$PATH
export EDITOR=vim
export VISUAL=vim

if [ $VIM ]
then
    PS1='\n\u@\h:\W [vim] \$ '
else
    PS1='\n\u@\h:\W \$ '
fi

export PS1
