# VIM command notes

This commands are summaraized from the vimtutor tutorial.
The VIM tutorial can be access with the console command: vimtutor

h            : go left
j            : go down
h            : go up
l            : go right

:w           : write changes without exiting
:wq          : quit vim and write changes
:q!          : quit without wrting changes

ESCAPE       : enter vim normal mode

i            : enter insert mode
SHIFT+A      : enter append mode. Moves cursor to the end of the line and enters insert mode
x            : delete a character

dw           : delete a word
d$           : delete everything on a line after the place of the cursor
dd           : delete a line
4dd          : delete 4 lines
d4w          : delete 4 words
d SHIFT+G    : delete everything from the file after the current line

2w           : move cursor 2 words to the right
3e           : move cursor to thend of the third word forward
0            : move the cursor to the start of the line
$            : move the cursor to the end of the line

u            : undo last action
U            : revert line to last state
CRTL+R       : redo last action

12yy         : copy(yank) 12 lines. p will paste the yanked lines.

p            : insert the last deleted line after line where the cursor is
r            : replace a character under the cursor with a newly typed character
ce           : deletes remainder of the word and enters insert mode
cc           : deletes the line and enters insert mode
c$           : deletes everything from the line after the cursor and enters insert mode

gg           : move to the opt of the file
G            : move to the end of the file
CTRL+G       : show the current line number
24gg         : move to line 24 of the file

CTRL+O       : move to the previous position
CTRL+I       : move to the next position

/term        : search for "term", type n to find the next occurrence of "term"
?term        : search for "term", type n to find the previous occurrence of "term"

%            : go to matching [], {} or ()

:s/find/replace       : find replace first occurrence on a line
:s/find/replace/g     : find replace all occurrences on a line
:#,#s/find/replace/g  : find replace all occurrences in a range of lines
:%s/find/replace/g    : find replace all occurrences in a file
:%s/find/replace/gc   : find replace all occurrences in a file with confirm

:set paste            : retain formatting when pasting content from an external source

:!command             : execute a command, hit ENTER to return to vim

vi -O <file1> <file2> : open two files in split mode

SHIFT+V               : select lines with arrows up and down, use < > to indent, use . to repeat action

# Vim settings

```bash 
vim ~/.vimrc
set nu
set expandtab
set shiftwidth=2
set tabstop=2
```