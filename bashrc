export GOPRIVATE=github.com/mantix4
export EDITOR=nvim
export PATH=$PATH:/opt/zeek/bin
alias vim=nvim

function kittyInstallTsh {
	infocmp -a xterm-kitty | tsh ssh "$@" tic -x -o \~/.terminfo /dev/stdin
}
function kittyInstallSsh {
	infocmp -a xterm-kitty | tic -x /dev/stdin | ssh "$@" "cat > ~/.terminfo"
}
eval "$(~/.local/bin/mise activate bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function fix_ssh_auth
{
  eval "export $(tmux show-env | grep ^SSH_AUTH_SOCK=)"
}
