Vim
===

* Syntax highlighting
* Filetype plugin (with indent)
* Jump to the last position when reopening a file
* Improved status line
* Highlights unwanted spaces
* xdebug integration
* Snippets: snipmate plugin + customized snippets (based on [vim-symfony-snipmate](https://github.com/themouette/vim-symfony-snipmate))
* Symfony support:
    * snippets
    * [vim-symfony plugin](https://github.com/soh335/vim-symfony)
* [Tagbar plugin](https://github.com/majutsushi/tagbar)
* Autocompletion
    * PHPComplete
    * PythonComplete
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


### PHP

* `CTRL+B` to add/remove a break point on the current line (xdebug integration)
* `F7` checks the syntax of the current file
* `F9` runs the current file

#### Symfony

* `F8`  will switch from the action to the view and from the view to the action.


### JavaScript

* `F7` will launch the linter on the current file (this needs gjslint)


Xmonad
======

* Gnome integration
* Some usefull shortcuts


Zsh
===

* Based on oh-my-zsh
* Customized theme
* Git plugin
* Some usefull aliases
* Easy _machine specific_ configuration


Git
===

* Colors while viewing a diff or displaying the status
