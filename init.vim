set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    call dein#add(s:plugin_dir . '/Shougo/dein.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('w0rp/ale')
    call dein#add('nelstrom/vim-visual-star-search')
    call dein#add('mileszs/ack.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('mattn/emmet-vim')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-fugitive')
    call dein#add('scrooloose/nerdtree')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('duff/vim-bufonly')
    call dein#add('gregsexton/MatchTag')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet')
    call dein#add('honza/vim-snippets')
    call dein#add('dyng/ctrlsf.vim')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('xolox/vim-misc')
    call dein#add('xolox/vim-notes')
    call dein#add('galooshi/vim-import-js', { 'build': 'npm install -g import-js' })
    call dein#add('mhartington/oceanic-next')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = ","                                                           "Change leader to a comma

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme
let g:enable_italic_font = 1                                                    "Enable italic font in colorscheme

" ================ General Config ====================

set termguicolors
set t_Co=256                                                                    "Set 256 colors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable wo wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=split                                                            "Show substitute changes immidiately in separate split

syntax on          "turn on syntax highlighting
set background=dark
colorscheme OceanicNext

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================ Indentation ======================

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set nofoldenable

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces
autocmd vimrc FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)
autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
            \ "\]" contained conceal containedin=ALL

" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Abbreviations ====================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe

" ================ Functions ========================

function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

function! s:LoadLocalVimrc()
    if filereadable(glob(getcwd() . '/.vimrc.local'))
        :execute 'source '.fnameescape(glob(getcwd(). '/.vimrc.local'))
    endif
endfunction

function! Search()
    let term = input('Search for: ', '')
    if term != ''
        let path = input('Path: ', '', 'file')
        :execute 'Ack -Q "'.term.'" '.path
    endif
endfunction

function! SearchAndReplace(...) range
    let search = input('Search: ', '')
    if search != ''
        let isVisualMode = a:0
        let replace = input('Replace: ', '')
        let range = isVisualMode ? "'<,'>s/" : ":%s/"
        :execute range.search."/".replace
    endif
endfunction

function! AirlineThemePatch(palette)
    let a:palette.normal_modified.airline_c = ['#FFFFFF', '#db2525', 250, 167, '']
endfunction

" ================ Custom mappings ========================

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <Leader>w <C-w><C-w>
" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :call Search()<CR>
nnoremap <Leader>af :CtrlSF

" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" Search and replace in visual highlight
vnoremap <Leader>r :call SearchAndReplace(1)<CR>
nnoremap <Leader>r :call SearchAndReplace()<CR>

nnoremap <Leader>F :NERDTreeToggle<Enter>
" ================ plugins setups ========================

let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:25,results:25'           "Ctrlp window setup
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(meteor)$'}                       "Ignore .meteor folder
let g:ctrlp_prompt_mappings = {'PrtDeleteEnt()': ['@']}                         "Map delete buffer in ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'                           "Use ag for searching

let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "hybrid"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline
let g:airline_theme_patch_func = 'AirlineThemePatch'                            "Add red background for unsaved buffers

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_expandabbr_key = '<c-e>'                                       "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                                             "Change trigger jump to next for emmet

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = [
            \ s:plugin_dir . '/honza/vim-snippets/snippets',
            \ '~/.config/nvim/snippets']

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer

let g:ackhighlight = 1                                                          "Highlight current search
let g:ackprg = 'ag --vimgrep'                                                   "Use ag instead of ack for searching

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons

let g:jsx_ext_required = 1                                                      "Force jsx extension for jsx filetype

let g:notes_directories = ['~/notes']                                           "Directory for notes
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeQuitOnOpen = 1
