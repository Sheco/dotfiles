# dotfiles

My set of personal configuration files

Over the years, I've gotten used to reinstalling and setting up my environments, most of the time I try to stick to 
default settings and when I find something that doesn't do what I need it to do, I do some research to set things up 
my own way.

This had some advantages, namely I was forced to stay up to date with newer technologies and practices instead of 
being locked in an old way of doing things.

Unfortunately this is not always efficient and some things are lost in time, which is a shame.

# tmux

My favorite dotfile, the Oh My tmux! configuration, copy or link [.tmux/.tmux.conf](.tmux/.tmux.conf) and [.tmux.conf.local](.tmux.local) to your home directory.

Make sure you have a recent version of tmux, you may have to download and compile the latest version on your own, I used it with tmux 3.3a

Please review the (keyboard bindings)[https://github.com/gpakosz/.tmux?tab=readme-ov-file#bindings]

tmux's prefix is Control+A

shortcut   | Description
-----------|-----------
\<prefix> ? | List all keybindings
\<prefix> :new-session | Create new session
\<prefix> $ | rename current session
\<prefix> w | List windows
\<prefix> s | List sessions
\<prefix> d | Detach from tmux
\<prefix> c | Create a new window
\<prefix> , | Rename current window
\<prefix> - | Split pane vertically
\<prefix> _ | Split pane horizontally
shift-left, shift-right | activate left/right window
alt-shift-left, alt-shift-right | Switch this window with the one on the left/right 

I recommend launching tmux and having multiple sessions locally and moving through them in the local tmux terminal,
and having new terminal tabs each for a different remote server. Hence each tab is a different computer, each one
with a tmux instance managing multiple shells and persistence.

# kitty

My favorite terminal emulator, Kitty, it can be downloaded from the [Kitty Website](https://sw.kovidgoyal.net/kitty/binary/).

Copy both (kitty/kitty.conf)[kitty/kitty.conf] and (kitty/current-theme.conf)[current-theme.conf) to `$HOME/.config/kitty`.

Please review the Keyboard bindings pressing Control+Shift+F1

Kitty's prefix is Control+Shift
shortcut | Description
---------|-----------
\<prefix> t | New tab
\<prefix> left, \<prefix> right | Move to the previous/next tab
\<prefix> <enter> | New pane
\<prefix> ], \<prefix> [ | Prev/Next pane
\<prefix> F2 | Edit kitty.conf
\<prefix> F5 | Reload config

