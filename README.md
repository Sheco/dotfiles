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

- `kitty`
- `tmux`
- `neovim`

One particular key piece of my workflow is that

- `Control+Shift+ArrowKeys` move between Kitty tabs
- `Control+Shift+[<>]` move kitty tabs around 
- `Control+ArrowKeys` move between tmux's tabs
- `Control+Alt+ArrowKeys` move tmux tabs around
- `Control+Win+ArrowKeys` move between KDE virtual desktops
- `Control+Win+Shift+ArrowKeys` move current window between virtual desktops

## mise

First and foremost, I install this package manager, `mise`, following the instructions from
[their website](https://mise.jdx.dev/getting-started.html)

I then install the software I use:

```bash
for plugin in golang lazygit neovim nodejs rust tmux tree-sitter
do mise use --global $plugin@latest
done
```
## Configuration files

You can install all configuration directories with this:

```bash
for app in kitty nvim environment.d git yazi
do ln -s $(pwd)/config/$app ~/.config/
done
```


## tmux

`tmux` is a terminal multiplexer, which means I can have multiple shell command lines in a single window/connection.

Install:
```
ln -s $(pwd)/config/tmux ~/.config/
```

Please review then
[keyboard bindings](https://github.com/gpakosz/.tmux?tab=readme-ov-file#bindings)

shortcut   | Description
-----------|-----------
`Control+A ?` | List all keybindings
`Control+A :new-session` | Create new session
`Control+A $` | rename current session
`Control+A w` | List windows (tmux tabs)
`Control+A s` | List sessions
`Control+A d` | Detach from tmux
`Control+A c` | Create a new window (a tmux tab)
`Control+A ,` | Rename current window (tmux tab)
`Control+A -` | Split pane vertically
`Control+A _` | Split pane horizontally
`Shift+ArrowKeys` | activate left/right window
`Shift+Alt+ArrowKeys` | Switch this window with the one on the left/right

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
`Control+Shift+t` | New tab
`Control+Shift+ArrowKeys` | Move to the previous/next tab
`Control+Shift+[<>]` | Reorder current tab to the left/right
`Control+Shift+Enter` | New pane
`Control+Shift+[]` | Prev/Next pane
`Control+Shift+F2` | Edit kitty.conf
`Control+Shift+F5` | Reload config

## neovim

I use KickStart.nvim to setup my vim environment, it's easy to install and makes vim super good.

Install:
```
ln -s $(pwd)/config/nvim ~/.config/
```

vim's prefix is space in command mode. (It's actually called leader in vim,
but I'm using prefix here)

For more spell checking options check [this blog post](https://johncodes.com/posts/2023/02-25-nvim-spell/)

## Steam Deck

Enable ssh-agent systemd service

```bash
systemctl --user enable --now ssh-agent.service
```

To install teleport, go to https://goteleport.com/download/ and download the Linux 64-bit package, extract it
to ~/.local/teleport and add that to the path
