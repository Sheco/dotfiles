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


# kitty

My favorite terminal emulator, Kitty, it can be downloaded from the [Kitty Website](https://sw.kovidgoyal.net/kitty/binary/).

Copy both (kitty/kitty.conf)[kitty/kitty.conf] and (kitty/current-theme.conf)[current-theme.conf) to `$HOME/.config/kitty`.

Please review the Keyboard bindings pressing Control+Shift+F1

# Gnome extensions

To set up GNOME the way I like it, I install these extensions:

- AATWS (Advanced Alt-Tab Window Switcher) 
- AppIndicator and KStatusNotifierItem Support 
- Frippery Move Clock 
- Vitals

The key extension is AATWS which modifies alt-tab and makes it super usable, I change these settings:
- I go to GNOME's keyboard settings and set Alt-tab to be a "Window switcher" and Super-tab an "Application switcher"
- In AAWTS's common settings: 
	- Super Key action: app Switcher (this makes AATWS replace the Activities Overview)
- In AATWS's window switcher:
	- Filter: Current monitor (I like this, this is the main reason I installed this extension)
- In AATS's application switcher:
	- Filter: Current monitor
	- Default Sorting: Stable sequence
- In AATWS's dock mode:
	- Hot edge action: application switcher (now we have a dock that hides in the bottom)
	- Show app windows instead of direct activation: focused multi-window apps

