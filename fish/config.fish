if status is-interactive
    # Commands to run in interactive sessions can go here
	set -x GOPRIVATE github.com/mantix4
	set -x EDITOR vim
	set -x PATH $HOME/.local/bin $PATH
	alias vim nvim
	source ~/.asdf/asdf.fish


	function kittyInstallTsh 
		infocmp -a xterm-kitty | tsh ssh $argv tic -x -o \~/.terminfo /dev/stdin
	end
	function kittyInstallSsh
		infocmp -a xterm-kitty | tic -x /dev/stdin | ssh $argv "cat > ~/.terminfo"
	end
end
