set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'

"""""""""""""""""
" Tern settings
"""""""""""""""""
Plugin 'marijnh/tern_for_vim'
" show argument hints
let g:tern_show_argument_hints='on_hold'
" enable keyboard shortcuts
let g:tern_map_keys=1

" remember to setup your ~/.tern-project
" see https://github.com/tststs/atom-ternjs
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --ts-completer' }
"" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>

" a replacement for 99% of the uses of grep
" install silver_searcher first
" https://github.com/ggreer/the_silver_searcher
Plugin 'mileszs/ack.vim'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>ag :Ag<CR>

" snippet
" doc: https://github.com/grvcoelho/vim-javascript-snippets#flow
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets' " for javascript

" provides syntax highlighting and improved indentation.
" Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" fancy status line
Plugin  'Lokaltog/vim-powerline'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" for comment code
Plugin 'tomtom/tcomment_vim'

" nerd tree
Plugin 'git://github.com/scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR> " NERDtree hotkey

" CAUTION: apple compile vim without -conceal by default
" you need to install vim with homebrew
" https://github.com/Yggdroot/indentLine/issues/59
Plugin 'Yggdroot/indentLine'

" Syntax plugin
Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['stylelint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'scss': ['stylelint']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
nnoremap <leader>alef :ALEFix<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" personal vimrc config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting color path if using vundle
" https://github.com/altercation/vim-colors-solarized/issues/104#issuecomment-117059059
let g:solarized_termcolors=256
set term=xterm-256color

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set rtp+=~/.vim/bundle/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" copy from system clipboard with p
" yank and allow to paste from system clipboard in other application
" CAUTION: run `brew install vim` to have +clipboard for this to work
set clipboard=unnamed

" disable creation of .swp files
set noswapfile

" set the terminal title
set title

" Display line number on the left
set number

"search is case insensitive. If the search pattern contains
"upper case letter, then it's case sensitive
set ignorecase
set smartcase

" Treat long lines as break lines (useful when moving around them)
map j gj
map k gk

"""" For search
"highlight search results
set hlsearch

"to clear highlight search with F5
nnoremap <F5> :let @/ = ""<CR>

"clear higlight search when opening a file
"the last search is remembered in viminfo
"and I didn't find a way to disable that
autocmd BufNewFile,BufReadPost *  let @/ = ""

"set window to fullscreen
set lines=999 columns=999

"Make backspace work
set backspace=indent,eol,start

""""""" Indent
"set indentation to 2 spaces
set shiftwidth=2

"replace <tab> by spaces
set expandtab
set tabstop=2

"always paste with respect to indentation
nnoremap p ]p

"causes left and right arrow to change line when reaching the end/beginning
"< and > for normal mode, [ and ] for insert mode
set whichwrap+=<,>,[,]

""""""" Folding
set foldmethod=indent
set foldlevelstart=2

set mouse=a

set maxmempattern=2000

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>ct :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
endif
