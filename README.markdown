Vim
===

* Syntax highlighting
* Jump to the last position when reopening a file
* Improved status line
* Highlights unwanted spaces
* xdebug integration
* [Tagbar plugin](https://github.com/majutsushi/tagbar)
* Autocompletion
    * PHPComplete
    * PythonComplete
    * Supertab
* New commands:
    * `:W` will save the current file with sudo
* etc.


Mappings
--------

Note: the **map leader** is `,`.

### All

* `CTRL+L` to toggle the line numbers
* `CTRL+H` clears the search register
* `F2` will toggle the paste mode (in which autoindent is disabled)
* `,s` will start a substitute (`:%s/`)
* `,S` will start a search & replace with the current word (`:%s/<WORD>/<CURSOR>`)
* `,h` will start a search with the current word (`/<WORD>`)
* `,<Left>` is a shortcut for `C-]` (go to the declaration of a class, variable, ...).
* `,<Right>` is a shortcut for `C-T` (go back).
* `,n` is a shortcut for `:NERDTreeToggle`.
* `,ev` to edit your vimrc in a new tab.


### PHP

* `CTRL+B` to add/remove a break point on the current line (xdebug integration)
* `F7` checks the syntax of the current file
* `F9` runs the current file

### JavaScript

* `F7` will launch the linter on the current file (this needs gjslint)

### Python

* `F9` runs the current file


Zsh
===

* Based on oh-my-zsh
* Customized theme
* Git "aware" theme
* Some usefull aliases
* Easy _machine specific_ configuration


Git
===

* Colors while viewing a diff or displaying the status
* Pre-commit hook checking for debug artefacts (console.log, var_dump, etc.)
