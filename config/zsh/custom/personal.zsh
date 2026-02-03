alias vim=nvim

export PATH=$PATH:~/.local/teleport

function kittyInstallTermcap {
	if [[ -z "$@" ]]
	then
		cat <<EOF >&2
Usage: kittyInstall {ssh host}
Example: kittyInstall ssh sduran@thinkpad.lan
         kittyInstall tsh ssh root@m4sensor

EOF
	return
	fi
	cat ~/.config/kitty/terminfo/x/xterm-kitty | $@ "mkdir -p ~/.terminfo/x && cat > ~/.terminfo/x/xterm-kitty"
}

function tmux_fix_env
{
  eval "export $(tmux show-env | grep '^\(SSH_AUTH_SOCK\|DISPLAY\)=')"
}

