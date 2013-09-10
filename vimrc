set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" repos from github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-fugitive'

" After trying out YouCompleteMe, decided to retire jedi-vim.
"Bundle 'davidhalter/jedi-vim'

Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/syntastic'
Bundle 'tmhedberg/SimpylFold'
Bundle 'majutsushi/tagbar'

" Don't feel comfortable with multiediting as of yet. 
" Commenting it out for now
"Bundle 'hlissner/vim-multiedit'

" For undo history. there is a similar plugin gundo that requires python2.4+
Bundle 'mbbill/undotree'

" Vim-Script repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" Installing Conque-Shell via vundle didn't work so I installed it directly
" and that is why I am commenting it out here
"Bundle 'Conque-Shell'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set encoding=utf-8
syntax on
filetype plugin indent on     " required!

set tabstop=4
set shiftwidth=4
set expandtab

" Show a vertical line after 100th horizontal line
" Its an indication that the any programming line should not be as complex as
" to be that long
"set colorcolumn=96
"highlight ColorColumn ctermbg=245

set backspace=indent,eol,start    " backspace through everything in insert mode"
" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while
set clipboard=unnamed
"set pastetoggle=<F2>
nnoremap <F2> :set paste!<cr>

set bs=2

set incsearch                     " Find as you type search also called incremental search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

set smartcase                     " But case-sensitive if expression contains a capital letter.

set foldmethod=indent             "fold based on indent, set to syntax for C/C++
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

" when filding set to syntax, don't fold the comments
:let c_no_comment_fold = 1

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler                         " Show cursor position.
"set cursorline                    " Highlight current line
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set wildignore=*.o,*.obj,*~       " Stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000                  " Store lots of :cmdline history

" remain in visual mode with last selection intact
vnoremap > ><CR>gv 
vnoremap < <<CR>gv

let mapleader = ","               " Leader

"" Quick save commands
:nmap <c-z> :w<CR>
:vmap <c-z> <Esc>:w<CR>
:imap <c-z> <Esc>:w<CR>a
":imap <c-z> <Esc><c-s>

:inoremap <c-j> <ESC>$a<CR>
":inoremap ( ()<Left>
:inoremap {<CR> {<CR>}<Esc>ko
:inoremap <c-l> <ESC>$a


" Useful sniplets for C/C++ 
" comments
inoremap /*          /**/<Left><Left>
inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>      /*<CR>*/<Esc>O
inoremap intmain int<space>main(int<Space>argc,<Space>char<Space>**argv)<CR>{<CR>}<ESC>O<TAB>

" Common useful sniplets for python
:inoremap ifmain if<Space>__name__<Space>==<Space>'__main__':
:inoremap impqt from PyQt4 import QtCore, QtGui
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Save current file/window
noremap <leader>w <esc>:update<CR>

" Quit current file/window without saving/updating
noremap <leader>q <esc>:q!<CR>
":nmap <c-v> <esc>:q!<CR>
":imap <c-v> <Esc>:q!<CR>
":vmap <c-v> <Esc>:q!<CR>

" Save and quit current file/window
"noremap <leader>s <esc>:wq!<CR>
" Quit All files/windows without saving/updating
noremap <leader>e <esc>:qa!<CR>

" Toggle line numbers
nnoremap <F3> :setlocal number!<cr>

" open new tab, tab next, tab previous
:nnoremap <F6> :tabnew<CR>
:inoremap <F6> <ESC>:tabnew<CR>
:nnoremap <F7> :tabprevious<CR>
:inoremap <F7> <ESC>:tabprevious<CR>
:nnoremap <F8> :tabnext<CR>
:inoremap <F8> <ESC>:tabnext<CR>
:nnoremap <F9> :tabclose<CR>
:inoremap <F9> <ESC>:tabclose<CR>

" run main.py in python2
:inoremap <F5> <ESC>:! clear && python2 main.py<CR>
:nnoremap <F5> <ESC>:! clear && python2 main.py<CR>

"" bind Ctrl+<movement> keys to move around windows instead of Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" My own movement methods. Scroll up/down but keep the cursor at the middle
:nnoremap <leader>j 2jzz
:nnoremap <leader>k 2kzz
" Keep cursor away from edges of screen.
set so=12

" Highlight cursor line.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  au WinLeave * setlocal nocursorcolumn
augroup END


"" easier moving between tabs
map <leader>n <esc>:tabprevious<CR>
map <leader><left> <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>
map <leader><right> <esc>:tabnext<CR>

nnoremap <F12> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

set mousehide
set ttymouse=xterm2
set sidescroll=1

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location
set timeoutlen=500

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis

set t_Co=256                      " Set terminal to 256 colors
set background=dark

if has ('gui_running')
    colorscheme solarized
else
    "colorscheme Monokai
    colorscheme jellybeans
endif

"Remeber Cursor position
set viewoptions=cursor,folds,slash,unix

" make hjkl movements accessible from insert mode via the <Alt> modifier key
" Doesn't really work, the mode changes to insert on using these bindings
"inoremap <A-h> <C-o>h
"inoremap <A-j> <C-o>j
"inoremap <A-k> <C-o>k
"inoremap <A-l> <C-o>l

" Show warnings on the use of arrow keys
nnoremap <Left> <Left>:echoe "Use h"<CR>
nnoremap <Right> <Right>:echoe "Use l"<CR>
nnoremap <Up> <Up>:echoe "Use k"<CR>
nnoremap <Down> <Down>:echoe "Use j"<CR>

"inoremap <Left> :echoe "Use h"
"inoremap <Right> :echoe "Use l"<CR>
"inoremap <Up> :echoe "Use k"<CR>
"inoremap <Down> :echoe "Use j"<CR>

"insert new line without going to insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>


" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

autocmd! bufwritepost .vimrc source %

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" vim-jedi settings
"let g:jedi#show_function_definition = "0"
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#auto_close_doc = 1
"let g:jedi#popup_on_dot = 0
"let g:jedi#autocompletion_command = "<c-space>"

" NerdTree settings
map <C-n> :NERDTreeToggle<CR>
" Filter out these files from show in list of files
let NERDTreeIgnore = ['\.pyc$', '\.obj$', '\.so$', '\.dll$', '\.exe$', '\.sublime-project$', '\.sublime-workspace$', '\.spyderproject$']

" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
"You can use CTRL-O to jump back to where you where before invoking the
"command and CTRL-I to jump forward
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>f :YcmCompleter GoToDeclaration<CR>

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 100
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 10
"set guifont=PowerlineSymbols\ 9
" Change fontsize on the fly
set laststatus=2
let g:Powerline_symbols = 'fancy'

" FuzzyFinder settings
noremap <leader>f :FufFile!<CR>
:nmap <leader>ff :FufBuffer!<CR>
:nmap <f4> :FufFile!<CR>
:vmap <f4> :FufFile!<CR>
:imap <f4> <esc>:FufFile!<CR>

" undotree settings
:nnoremap <leader>z :UndotreeToggle<CR><c-w>h<c-w>k

" Tagbar Settings
:nnoremap <F10> :TagbarToggle<CR><C-w>l<C-w>l
:inoremap <F10> <ESC>:TagbarToggle<CR><C-w>l<C-w>l

" Window management made easy (:h window-moving for more info)
:nnoremap <C-Right> :vertical resize +1<CR>
:nnoremap <C-Left> :vertical resize -1<CR>
:nnoremap <C-Up> :resize +1<CR>
:nnoremap <C-Down> :resize -1<CR>

" syntastic setting
let g:syntastic_cpp_compiler_options = ' -std=c++0x'

