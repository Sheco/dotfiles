umask 022

export SCREENDIR=$HOME/.screen
export DISPLAY=:0
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH"
alias ls='ls --color'

# ssh-agent configuration
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

