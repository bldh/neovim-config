========
kristijanhusak's dotfiles altered to my liking and modified to work on OSX(relies on brew being installed).
 
**Warning**: Install script removes all previous configuration (zshrc, oh-my-zsh, nvim, tmux)

Installation
-----------

    $ git clone https://github.com/bldh/neovim-config.git ~/neovim-config
    $ cd ~/neovim-config
    $ chmod +x ./install.sh
    $ ./install.sh
    $ nvim
    $ :UpdateRemotePlugins

Plugins
----------------

* [Shougo/dein.vim](http://github.com/Shougo/dein.vim)
* [christoomey/vim-tmux-navigator](http://github.com/christoomey/vim-tmux-navigator)
* [ryanoasis/vim-devicons](http://github.com/ryanoasis/vim-devicons)
* [w0rp/ale](http://github.com/w0rp/ale)
* [nelstrom/vim-visual-star-search](http://github.com/nelstrom/vim-visual-star-search)
* [mileszs/ack.vim](http://github.com/mileszs/ack.vim)
* [Raimondi/delimitMate](http://github.com/Raimondi/delimitMate)
* [mattn/emmet-vim](http://github.com/mattn/emmet-vim)
* [tpope/vim-commentary](http://github.com/tpope/vim-commentary)
* [tpope/vim-surround](http://github.com/tpope/vim-surround)
* [tpope/vim-repeat](http://github.com/tpope/vim-repeat)
* [tpope/vim-fugitive](http://github.com/tpope/vim-fugitive)
* [scrooloose/nerdtree](http://github.com/scrooloose/nerdtree)
* [airblade/vim-gitgutter](http://github.com/airblade/vim-gitgutter)
* [vim-airline/vim-airline](http://github.com/vim-airline/vim-airline)
* [vim-airline/vim-airline-themes](http://github.com/vim-airline/vim-airline-themes)
* [duff/vim-bufonly](http://github.com/duff/vim-bufonly)
* [gregsexton/MatchTag](http://github.com/gregsexton/MatchTag)
* [sheerun/vim-polyglot](http://github.com/sheerun/vim-polyglot)
* [kristijanhusak/vim-hybrid-material](http://github.com/kristijanhusak/vim-hybrid-material)
* [Shougo/deoplete.nvim](http://github.com/Shougo/deoplete.nvim)
* [Shougo/neosnippet](http://github.com/Shougo/neosnippet)
* [honza/vim-snippets](http://github.com/honza/vim-snippets)
* [dyng/ctrlsf.vim](http://github.com/dyng/ctrlsf.vim)
* [ctrlpvim/ctrlp.vim](http://github.com/ctrlpvim/ctrlp.vim)
* [junegunn/goyo.vim](http://github.com/junegunn/goyo.vim)

Font used:
* current - [Iosevka](https://github.com/be5invis/Iosevka)
* previous (and on screeshots) - [Inconsolata for powerline](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20for%20Powerline%20Nerd%20Font%20Complete.otf)

License
-------

This project is licensed under MIT License (see LICENSE file for details). But
each plugin has its own license, so check each one to see what you can do.
