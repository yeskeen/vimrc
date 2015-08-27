"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"    Keen
"    https://github.com/yeskeen/vimrc
"
" Sections:
"    -> OS Settings
"    -> Plugins
"    -> Plugin Settings
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OS Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win16') || has('win32') || has('win64')
   let s:RUNTIME=$VIM
   au GUIEnter * simalt ~x
else
   let s:RUNTIME='~/.vim'
   au GUIEnter * call MaximizeWindow()
endif

" leader key
let mapleader   =","
let g:mapleader =","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
exec 'set rtp+='.s:RUNTIME.'/bundle/vundle'
call vundle#rc()
call vundle#begin(s:RUNTIME.'/bundle/')
Bundle 'gmarik/vundle'
Bundle 'mru.vim'
Bundle 'ctags.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'the-nerd-tree'
Bundle 'the-nerd-commenter'
Bundle 'tagbar'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'xml.vim'
Bundle 'css.vim'
Bundle 'javascript.vim'
Bundle 'AutoClose'
Bundle 'sessionman.vim'
Bundle 'MatchIt.zip'
Bundle 'STL-Syntax'
Bundle 'TagHighlight'
Bundle 'rking/ag.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'yeskeen/vim-airline'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'hdima/python-syntax'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'sirver/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'godlygeek/tabular'
Bundle 'qiyu2580/vimcdoc'
Bundle 'jaxbot/semantic-highlight.vim'
Bundle 'plasticboy/vim-markdown'
"Bundle 'jeaye/color_coded'
"Bundle 'Shougo/neocomplete.vim'
"Bundle 'vimgrep.vim'
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized theme
let g:solarized_italic    =0
let g:solarized_termcolors=256
let g:solarized_termtrans =1
let g:solarized_bold      =0
colorscheme solarized
set background=dark

" a.vim   swtich between source files and header files quickly
nnoremap <silent> <F12> :A<CR>

" c.vim
let g:C_GlobalTemplateFile=s:RUNTIME.'/bundle/c.vim/c-support/templates/Templates'

" ctrlp
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'

" FuzzyFinder
map <leader>fb :FufBuffer<cr>
map <leader>fc :FufChangeList<cr>
map <leader>fd :FufDir<cr>
map <leader>ff :FufFile<cr>
map <leader>fh :FufHelp<cr>
map <leader>fj :FufJumpList<cr>
map <leader>fl :FufLine<cr>
map <leader>ft :FufTag<cr>
map <leader>fq :FufQuickfix<cr>

" NERDTree
nnoremap <silent><F6> :exec("NERDTree ".expand('%:h'))<CR>
nnoremap <silent><F7> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree
let NERDTreeBookmarksFile   =s:RUNTIME.'/bundle/The-NERD-Tree/NerdBookmarks.txt'
let NERDTreeMouseMode       =2
let NERDTreeShowBookmarks   =1
let NERDTreeShowHidden      =1
let NERDTreeMinimalUI       =1
let NERDTreeDirArrows       =1

" airline
let g:airline_left_sep          =''
let g:airline_right_sep         =''
let g:airline_inactive_collapse =0
let g:airline_theme             ='cool'

" syntastics
"nnoremap <silent><F2> :UpdateTypesFile<CR>

" Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_width =30
autocmd VimEnter * nested :call tagbar#autoopen(1)

" UltiSnips
let g:UltiSnipsUsePythonVersion =2
let g:UltiSnipsExpandTrigger    ='<C-l>'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf               =s:RUNTIME.'/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_complete_in_comments                =1
let g:ycm_confirm_extra_conf                  =0
let g:ycm_collect_identifiers_from_tags_files =1
let g:ycm_min_num_of_chars_for_completion     =1
let g:ycm_cache_omnifunc                      =0
let g:ycm_seed_identifiers_with_syntax        =1
let g:ycm_key_invoke_completion               ='<M-;>'
inoremap <leader>; <C-x><C-o>
set completeopt =menuone,menu,longest
nmap <C-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu    =en_US
let $LANG       ='en_US'
set helplang    =cn
set clipboard  +=unnamed
""autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" edit and load vimrc
let g:VIMRCCC =s:RUNTIME.'/_vimrc'
nmap <leader>s :exec(':source '.g:VIMRCCC)<CR>
nmap <leader>v :exec(':e '.g:VIMRCCC)<CR>
set shortmess=atI "dont show startup message


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on


" Fast saving
nmap <leader>w :w!<cr>
vnoremap <leader>s y:%s/<C-R>=escape(@", '\\/.*$^~[]')<CR>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                     " Turn on line numbers
set scrolloff=7                " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                   " Turn on the Wild menu
set wildignore=*.o,*~,*.pyc    " Ignore compiled files
set ruler                      " Always show current position
set showcmd                    " Show command on the right bottom
set cmdheight=2                " Height of the command bar
set hidden                     " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                 " Ignore case when searching
set smartcase                  " When searching try to be smart about cases
set hlsearch                   " Highlight search results
set incsearch                  " Makes search act like search in modern browsers
set lazyredraw                 " Don't redraw while executing macros (good performance config)
set magic                      " For regular expressions turn magic on
set showmatch                  " Show matching brackets when text indicator is over them
set mat=2                      " How many tenths of a second to blink when matching brackets
set noerrorbells               " No annoying sound on errors
set novisualbell
set autoread                   " Set to auto read when a file is changed from the outside
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set cursorline

hi Statement ctermfg=3 guifg=khaki term=NONE gui=NONE
hi Type term=underline ctermfg=2 gui=NONE guifg=darkkhaki
hi Cursor guifg=black guibg=white

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set fencs         =utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding  =utf-8
set encoding      =utf-8
set fileencodings =ucs-bom,utf-8,cp936
set fileencoding  =utf-8

" Use Unix as the standard file type
set ffs  =unix,dos,mac
set t_Co =256

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  endif
endif

map <silent> <F11>  :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    " Use spaces instead of tabs
set smarttab     " Be smart when using tabs ;)
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set lbr          " Linebreak on 500 characters
set tw=500
set ai           " Auto indent
set si           " Smart indent
set wrap         " Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" buffer operation
map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>
map <leader>bs :ls<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/ " Opens a new tab with the current buffer's path

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status/Title line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=
set statusline+=%<%{HasPaste()}%F%m%r%h%w
set statusline+=%=
set statusline+=\|%-4{&ff}
set statusline+=\|%-4(%p%%%)
set statusline+=\|%-23(row:%l/%L,col:%c%)

set titlestring=VIM\ -\ [%r%{getcwd()}%h]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

map <leader>e :edit %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Vimgreps in the current directory
map <leader>g :vimgrep // **<left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // %<left><left><left>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" When search with vimgrep, show quickfix window
map <silent> <leader>co :botright cope<cr>

" Go to the next search result
map <silent> <leader>n :cn<cr>

" Go to the previous search result
map <silent> <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

" Sessionman*
"set viminfo='100,<500,s10,h,!
"autocmd VimEnter * SessionOpenLast
"let sessionman_save_on_exit =1

