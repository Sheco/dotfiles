# dotfiles

My set of personal configuration files

Over the years, I've gotten used to reinstalling and setting up my environments, most of the time I try to stick to 
default settings and when I find something that doesn't do what I need it to do, I do some research to set things up 
my own way.

This had some advantages, namely I was forced to stay up to date with newer technologies and practices instead of 
being locked in an old way of doing things.

Unfortunately this is not always efficient and some things are lost in time, which is a shame.

My stack is around using the following apps/tools:
- kitty
- tmux
- neovim
- oh my bash
- GNOME

# asdf

First and foremost, I install this package manager following the instructions from [their website](https://asdf-vm.com/guide/getting-started.html)
- Install dependencies
- Clone repo
- Install helper for my shell (currently trying fish)

I then install the software I use:

```fish
for plugin in golang lazygit neovim nodejs rust tmux tree-sitter
asdf plugin add $plugin
asdf install $plugin latest
asdf global $plugin latest
```
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
\<prefix> w | List windows (tmux tabs)
\<prefix> s | List sessions
\<prefix> d | Detach from tmux
\<prefix> c | Create a new window (a tmux tab)
\<prefix> , | Rename current window (tmux tab)
\<prefix> - | Split pane vertically
\<prefix> _ | Split pane horizontally
shift-left, shift-right | activate left/right window
alt-shift-left, alt-shift-right | Switch this window with the one on the left/right 

I recommend launching tmux and having multiple sessions locally and moving through them in the local tmux terminal,
and having new terminal tabs each for a different remote server. Hence each tab is a different computer, each one
with a tmux instance managing multiple shells and persistence.

# kitty

My favorite terminal emulator, Kitty, it can be downloaded from the [Kitty Website](https://sw.kovidgoyal.net/kitty/binary/) or you can use the [update_kitty](/update_kitty) script included in this repo.

Copy both (kitty/kitty.conf)[kitty/kitty.conf] and (kitty/current-theme.conf)[current-theme.conf) to `$HOME/.config/kitty`.

Please review the Keyboard bindings pressing Control+Shift+F1

Kitty's prefix is Control+Shift
shortcut | Description
---------|-----------
\<prefix> t | New tab
\<prefix> left, \<prefix> right | Move to the previous/next tab
\<prefix> (comma),(period) | Reorder current tab to the left/right
\<prefix> \<enter> | New pane
\<prefix> ], \<prefix> [ | Prev/Next pane
\<prefix> F2 | Edit kitty.conf
\<prefix> F5 | Reload config



# neovim

I have my own LazyVim configuration [my LazyVim configuration](https://github.com/Sheco/LazyVimStarter), clone it to `~/.config/nvim`

vim's prefix is space in command mode. (It's actually called leader in vim, but I'm using prefix here)

Please review the keyboard bindings at [LazyVim's keybindings page](https://www.lazyvim.org/keymaps)

shortcut | Description
---------|-----------
\<prefix> sk | Show keymaps
\<prefix> , | List buffers
\<prefix> \<space> | List all files
\<prefix> / | search in all files
\<prefix> e | open sidebar file manager 
\<prefix> be | Buffer explorer
\<prefix> ge | Git explorer
\<prefix> l | Open lazy window to update plugins
\<prefix>cm | Open mason window to update LSPs
C-h, C-l | move to the pane on the left/right
\<prefix> ul | disable line numbers and other visual cues (useful to copy text)
\<prefix> cd | show diagnostics
\<prefix> ca | show action fixes
]d [d | next/prev diagnostic
]e [e | next/prev error
K | show current word's LSP documentation
gd | Go to current word's LSP definition
\<prefix> cr | Rename/refactor current word
shift h, shift l | Move to the prev/next buffer
\<prefix> bp | Pin current buffer
\<prefix> bP | Delete unpinned buffers
\<prefix> gsr | Replace surrounding
z= | Open spell checking suggestions
:setlocal spell spelllang=es_mx | to change the current spell checking dictionary

For more spell checking options check [this blog post](https://johncodes.com/posts/2023/02-25-nvim-spell/)


# Gnome extensions

To set up GNOME the way I like it, I install these extensions:

- AATWS (Advanced Alt-Tab Window Switcher) 
- AppIndicator and KStatusNotifierItem Support 
- Frippery Move Clock 
- Vitals

The key extension is AATWS which modifies alt-tab and makes it super usable, I change these settings:
- I go to GNOME's keyboard settings and set Alt-tab to be a "Window switcher" and Super-tab an "Application switcher"
- In AAWTS's common settings: 
	- Default Monitor: Monitor with focused window
	- Super Key action: app Switcher (this makes AATWS replace the Activities Overview)
- In AATWS's window switcher:
	- Filter: Current monitor (I like this, this is the main reason I installed this extension)
- In AATS's application switcher:
	- Filter: Current monitor
	- Default Sorting: Most Recently Used
- In AATWS's dock mode:
	- Hot edge action: application switcher (now we have a dock that hides in the bottom)
	- Hot edge monitor: All
	- Show app windows instead of direct activation: disable
	- Force App Switcher Stable Sequence: > [!NOTE]
- In Mouse:
	- App Switcher, middle click on item: Do nothing
	- App Switcher, scroll over item: do nothing
	- Window switcher, scroll over item

