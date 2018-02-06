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

" fuzzy finder, best plugin for file ever !
" usage: https://github.com/kien/ctrlp.vim#basic-usage
Plugin 'git://github.com/kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|git\|dist\|bin' " set up your custom ignore

" provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" snippet
" doc: https://github.com/grvcoelho/vim-javascript-snippets#flow
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets' " for javascript

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
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
