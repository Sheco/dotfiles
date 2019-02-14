tmux
====

tmux is a terminal multiplexer, which means it's an app that handles your terminals and lets you switch between each one of them.

It's similar to GNU screen, but it's a lot better, because it has a lot more features and it's more versatile.

One of the most common ways to use it is to execute it in a remote server, so that you can have a stable session so you can reconnect to it even if your connection were to drop, you can always come back and everything will be just as you left it.

Its true power comes from creating windows and panes, a window can be thought of a tab, it's a full screen of content, while a pane is a portion of the screen that has been split.

### Custom settings

The default configuration is okay but it's not perfect, I use a github repo with some sensible defaults and it also makes it look better, giving it a powerline look, remember you have to install and use a [powerline font](https://github.com/powerline/fonts)

The tmux repo is: https://github.com/gpakosz

You need to copy both the .tmux.conf and the .tmux.conf.local files to your home directory, the .tmux.conf.local file has some extra tweaks you will want to review.

I have my own copy of this file in: https://github.com/Sheco/dotfiles/blob/master/.tmux.conf.local

### Creating a new session

To create create a new session, you just run ```tmux``` on the command line.

While inside of tmux, you interact with it using a combination of control keys, starting with a prefix control-key, by default it's Control+B, but most people switch it to Control+A not only because it's easier to press but also because that's GNU screen's shortcut.

From now on this control key will be referred to as the ```{prefix}```.

### Detaching from a session

Detaching means disconnecting from the session, but leaving it running in the background.

To detach from a session you can either close your terminal application window or use the tmux detach shortcut, which is ```{prefix} d```


### Reattaching to a session

Normally you will only have a single session running, in this most common scenario, to attach to that session you only need to run ```tmux attach``` in the command line, or its short version, which is ```tmux a```

### Windows

| Description | Shorcut |
| ----------- | ------- |
| Create a new tmux window (think of a tab) | ```{prefix} c```        |
| Switch to a specific window		            |	```{prefix} [number]``` |
| Switch to previous window		              | ```{prefix} [left]```   |
| Switch to next window				              | ```{prefix} [right]```  |
| Rename window                             | ```{prefix} , ```       |

### Panes

| Description | Shorcut |
| ----------- | ------- |
| Split window horizontally			 | ``` {prefix} - ``` |
| Split window vertically				 | ``` {prefix} _ ``` |
| Switch to a different pane		 | ``` {prefix} [arrow-key] ``` |
| Toggle zoom (maximize)				 | ``` {prefix} z ``` |
| Resize +/- 5                   | ``` {prefix} Alt-[arrow-key] ``` |
| Resize +/- 1                   | ``` {prefix} [hjkl] ``` |

### Sessions

| Description | Shorcut |
| ----------- | ------- |
| Create a new session          | ``` {prefix} c``` |
| Rename the current session    | ``` {prefix} $``` |
| List sessions/preview windows | ``` {prefix} s``` |

### Scrollback

The scrollback mode is the mode in where you can scroll back the terminal's history buffer, this is particularly important because tmux "eats" each shell's history, this means you cannot use your terminal application's scroll bars to read back on the output.

This is important because tmux is a fullscreen ncurses app and it doesn't really send raw output to the terminal, it might take some time to getting used to this, but it's worth it.

When you enter the scrollback mode, you'll see a yellow label on the top-right corner of the screen, it tells you the cursor position and the number of lines in the buffer.

| Description | Shorcut |
| ----------- | ------- |
| Enter scrollback mode          | ``` {prefix} [Enter] ``` |
| Start selection                | ``` {prefix} [Space] ``` |
| Copy selection                 | ``` {prefix} [Enter] ``` |
| List buffers                   | ``` {prefix} b ``` |
| Paste buffer                   | ``` {prefix} p ``` |
| Paster specific buffer         | ``` {prefix} P ``` |


### Mouse

Newer versions of tmux include mouse support, I would advocate in favor of using mostly keyboard shortcuts to interact with tmux as much as possible, but in certain scenarios, using the mouse can certainly be convenient.

For example, resizing panes with the mouse is a lot easier than using the keyboard.

On the other hand, switching between windows, it's better with the keyboard.
