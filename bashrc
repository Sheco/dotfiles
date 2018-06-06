
# These first lines are used to work around some issues with WSL
# the umask is set to 0000 by default, screen does not work out of the box,
# the locale is not set, the Xorg environment is not set
# with this, I can get things going
umask 022
export SCREENDIR=$HOME/.screen
export DISPLAY=:0
export LANG=en_US.UTF-8


# ssh-agent configuration
# This is useful in WSL too, because there's no ssh-agent
# with this, one is launched automatically and when opening 
# new shells, the environment is set to what hopefully is the valid agent.
# It's worth pointing out that no keys are added by default
# So you can just run ssh-add with no arguments to add ~/.ssh/id_rsa
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

# Extra stuff, self explanatory
export PATH="$HOME/bin:$PATH"
alias ls='ls --color'

