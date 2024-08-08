# dotfiles

My set of personal configuration files

Over the years, I've gotten used to reinstalling and setting up my environments,
most of the time I try to stick to default settings and when I find something that
doesn't do what I need it to do, I do some research to set things up my own way.

This had some advantages, namely I was forced to stay up to date with newer
technologies and practices instead of being locked in an old way of doing things.

Unfortunately this is not always efficient and some things are lost in time,
which is a shame. In this project, I'm managing and documenting my environment,
so that I can reinstall linux and even try different Distributions and my
environment will remain the same.

My stack is around using the following apps/tools:

- kitty
- tmux
- neovim
- oh my zsh
- Sway

One particular key piece of my workflow is that
Super+ArrowKeys move between Sway workspaces
Super+Shift+ArrowKeys move the current Sway window around between workspaces
Control+Shift+ArrowKeys move between Kitty tabs
Control+Shift+<> move kitty tabs around 
Shift+ArrowKeys move between tmux's tabs
Shift+Alt+ArrowKeys move tmux tabs around

## mise

First and foremost, I install this package manager following the instructions from
[their website](https://mise.jdx.dev/getting-started.html)

I then install the software I use:

```bash
for plugin in golang lazygit neovim nodejs rust tmux tree-sitter
do mise use --global $plugin@latest
done
```

## tmux

Tmux is a terminal multiplexer, which means I can have multiple shell command lines in a single window/connection.

Install:
```
ln -s $(pwd)/tmux.conf ~/.tmux.conf
```

Please review then
[keyboard bindings](https://github.com/gpakosz/.tmux?tab=readme-ov-file#bindings)

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

I recommend launching tmux and having multiple sessions locally and moving through
them in the local tmux terminal, and having new terminal tabs each for a different
remote server. Hence each tab is a different computer, each one with a tmux instance
managing multiple shells and persistence.

## kitty

My favorite terminal emulator right now, Kitty, it can be downloaded from the
[Kitty Website](https://sw.kovidgoyal.net/kitty/binary/)
or you can use the [update_kitty](/update_kitty) script included in this repo.

Install:
```
ln -s $(pwd)/config/kitty ~/.config/
```

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

## neovim

I use LazyVim to setup my vim environment, it's easy to install and makes vim super good.

Install:
```
ln -s $(pwd)/config/nvim ~/.config/
```

vim's prefix is space in command mode. (It's actually called leader in vim,
but I'm using prefix here)

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

## Sway

Sway is a tiling window manager, it's not a full desktop environment, which makes it super light and fast.
The workflow takes some time getting used to, but once you are familiar with the keyboard shortcuts, things make
a lot of sense, you can review the sway config file to find everything you'll need. the man pages are also 
very well documented.

Make sure you install sway, waybar, wl-clipboard and the scripts in bin to somewhere in your $PATH

Make sure you install sway and waybar


Install:
```
ln -s $(pwd)/config/sway $(pwd)/config/waybar ~/.config/
```

