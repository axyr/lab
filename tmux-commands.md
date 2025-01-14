# TMUX commands


> Regular OSX terminal does not play well with all the keybindings.
iTerm2 does this a little bit better, but not everything works as expected.

Start tmux
```bash
tmux 
```

Start tmux by default when opening a iTerm2 terminal:
Settings -> Profiles -> General:
Send text at start: tmux attach -t init || tmux new -s init

## Sessions

Create a new tmux session
You can not nest tmux sessions
Execute this in outside a tmux session
First example starts a new sessions with an index number
Second example start a session with a name <name>
```bash
tmux new
tmux new -t <name>
```

List tmux sessions
```bash
tmux ls
```

Detach from a tmux session
```bash
CTRL+B d
```

Attach to a tnux session
```bash
tmux a -t <indexorname>
```

Kill all tmux sessions
```bash
tmux kill-server
```

## Panes

Split tmux window in panes %(vertical) "(horizontal)
```bash
CTRL+B %
CTRL+B "
```

Navigate between panes
```bash
CTRL+B <arrowkey>
```

Show pane indexes
```bash
CTRL+B q
```

Jump to a pane by index
```bash
CTRL+b q <index>
```

Resize panes
```bash
CTRL+B ALT+<arrow>
```

Kill current pane
```bash
CTRL+B x
```

## Windows

Create new windows
```bash
CTRL+B c
```

Rename window
```bash
CTRL+B , # and enter name
```

Scroll thru windows
```bash
CTRL+B n
```

List and navigate between windows
```bash
CTRL+B w
```

Kill windows
```bash
CTRL+B w 
# select window, hit x and confirm (y)es
```

Copy paste
This requires the following tmux.conf line:
setw -g mode-keys vi

```bash
# Enter copy mode
CTRL+B [
# use arrows to navigate terminal
# hit space to start selecting
# use arrow keys to select text
# hit enter
# to paste text:
CTRL+B ]
```


