" VIM Configuration File
" Author: Michael.Wang 
"
set nocompatible
filetype off
" execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

autocmd FileType python setlocal completeopt-=preview

"color scheme
Plugin 'davidhalter/jedi-vim' 
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tell-k/vim-autopep8'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zchee/deoplete-jedi'
Plugin 'Yggdroot/indentLine'
Plugin 'w0rp/ale'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

Bundle 'YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle  'majutsushi/tagbar'
Bundle 'godlygeek/tabular'
Bundle  'ervandew/supertab'
Bundle  'Lokaltog/vim-powerline'
Bundle 'bufexplorer.zip'
Bundle  'tpope/vim-surround'
Bundle  'kien/ctrlp.vim'

"text object plugin
Bundle  'kana/vim-textobj-lastpat'
Bundle  'kana/vim-textobj-user'
Bundle  'kana/vim-textobj-line'
Bundle  'kana/vim-textobj-indent'
Bundle 'scrooloose/nerdcommenter'
Bundle  'kana/vim-textobj-entire'
Bundle  'kana/vim-textobj-syntax'  
Bundle  'fatih/vim-go'

Bundle  'Raimondi/delimitMate'
Bundle  'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-blackboard'

call vundle#end()            " required
filetype plugin indent on    " required

" Disable swapfile and backup {{{
set nobackup
set noswapfile
"}}}

"remap leader key{{{
let mapleader=','
"}}}

" auto reload vimrc configuration {{{
 au BufWritePost .vimrc so ~/.vimrc
 nmap <leader>V :tabedit $MYVIMRC<CR>
" }}}

"search" {{{
set incsearch
set hls
nnoremap <silent> <leader>nl :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-c> :%s///gn<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"}}}       

"some common configs {{{
"map visual mode vertical selectoin"
" nmap <leader>v <c-v>
set fenc=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese
set encoding=utf-8  "if not set, the powerline plugins won't work 
if has("win32") || has("win64")
    set fileencoding=chinese
endif

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'

set autoindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set softtabstop=4
set expandtab
" set textwidth=300
set t_Co=256
" set relativenumber
set number
set hidden
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set autoread
set title
set matchpairs+=<:>
set ruler
set backspace=indent,eol,start
map Y y$
set pastetoggle=<F2>
set nolist
"}}}

"Tab-completion in command-line mode{{{
set wildmenu
set wildmode=longest:full
set wildignore=*.pdf
"}}}

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
" set textwidth=80

"plugins key maps" {{{
let g:NERDSpaceDelims=1
map <leader>/ <leader>c<space><CR>

"go back and forth from header file and source file
"nmap <silent> <leader>f :A<cr>

"open a tag list ivew
nmap <silent> <leader>ta :TagbarToggle <CR>
"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for ZoomWin plugin map
nmap <silent>,o :ZoomWin <cr>

"config for BufferNavigator"
nmap <leader>b :BufExplorer<cr>
"}}}                    


let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <leader>h <Plug>(easymotion-linebackward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)

" <Leader>f{char} to move to {char}
map  <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" 重复上一次操作, 类似repeat插件, 很强大
map <leader><leader>. <Plug>(easymotion-repeat)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" nmap <leader>v :vimgrep /<C-R><C-W>/gj **/*{py,c,cpp}<CR>:copen<CR>

"ack
"<leader>c进行搜索，同时不自动打开第一个匹配的文件"
map w<leader>v :Ack! <C-R><C-W> .<CR>
"调用ag进行搜索
if executable('Ag')
  let g:ackprg = 'Ag --vimgrep'
endif
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
"部分功能受限，但对于大项目搜索速度较慢时可以尝试开启
"let g:ack_use_dispatch = 1

"nerdTree plugin config {{{
" autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
nmap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=3                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()               

"c/c++/javascript/java fold method
autocmd filetype c,cpp,javascript,java set foldmarker={,}

nnoremap zO zCzO
nnoremap <Space> za
vnoremap <Space> za
nnoremap ,z zMzv
"}}}                         


"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
" Ctlr-P {{{
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*.o
set wildignore+=tags
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

nmap <leader>p :CtrlP <cr>
let g:ctrlp_open_multiple_files = 'v'

let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
" let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o)$|/target/)'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_prompt_mappings = { 
            \ 'PrtSelectMove("j")':   ['<c-n>'], 
            \ 'PrtSelectMove("k")':   ['<c-p>'], 
            \ 'PrtHistory(-1)':       ['<c-j>', '<down>'], 
            \ 'PrtHistory(1)':        ['<c-i>', '<up>'] 
            \ } 
map ,fb :CtrlPBuffer<cr>
map ,ff :CtrlPCurFile<cr>
map ,fr :CtrlP<cr>
map ,fm :CtrlPMixed<cr>

"忽略后缀为.o，.ko，.gz的文
let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$', '.*\.pyc', '.*\.gitignore', '.DS_Store'] 
" bufkill bd's: really do not mess with NERDTree buffer
"nnoremap <silent> <backspace> :BD<cr>
"nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
"}}}

"better tag navigation from www.vimbits.com {{{
nnoremap <leader><Enter> <C-]>
"}}}


"automatically save foldings in vim{{{
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview
"}}}

"map markdown to html {{{
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
"}}}

"map leader 1 for display cursorline {{{
:nnoremap <leader>1 :set cursorline! cursorcolumn!<CR>
"}}}


"map windows command {{{
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap ,c <c-w>c
nmap ,<tab> <c-w><c-w>
nnoremap j gj
nnoremap k gk
"}}}                             

"maps from janus{{{

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
" nmap <leader>u mQviwU`Q
" nmap <leader>l mQviwu`Q

" upper/lower first char of word
" nmap <leader>U mQgewvU`Q
" nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>c :only<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Swap two words
nmap <silent> <leader>gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
" nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[< = >]{7}( .*\|$)<CR>


" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
" map <leader>= <C-w>=

"}}}

"config syntastic {{{
" let g:syntastic_check_on_open=1
"}}}


"set colorscheme {{{
syntax enable
colorscheme blackboard
if has("gui_running")
    colorscheme solarized
endif
"}}}                                  

"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"}}}    


nnoremap <leader><tab> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <leader><tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc> :tabnew<CR>
"}}}

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>  

set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_autoclose_preview_window_after_completion = "1"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

"using flake8 as a python syntax checker 
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'

let g:autopep8_aggressive=2

let g:pyflakes_use_quickfix = 1

let g:flake8_ignore="E501,E128,C901"
let g:pep8_ignore="E501,E128,W601,C901"
let g:pymode_lint_ignore = "E2,E501,E601,128,C901"

" autocmd FileType gitcommit DiffGitCached | wincmd p

noremap <leader><leader> <C-^>

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

inoremap jj <Esc> " Esc is so far away without this mapping...
" noremap <leader>i :set list!<CR>
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

map <silent> <leader>vv <plug>EgMapGrepCurrentWord_v
let g:EasyGrepHidden = 0
let g:EasyGrepExtraWarnings=0

let g:EasyGrepMode = 2     " All:0, Open Buffers:1, TrackExt:2, 
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 0 " not ignorecase:0
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak, *.html"   

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = "<leader>"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_enabled = 0
let g:deoplete#sources#jedi#python_path = '~/workspace'
let g:deoplete#sources#jedi#extra_path = ['~/workspace/phoenix', '~/workspace/ashes']

" deoplete.vim
" credit: https://gist.github.com/zchee/c314e63ae8b6bea50bb4
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#auto_completion_start_length = 0
let g:min_pattern_length = 0
" https://github.com/Shougo/deoplete.nvim/issues/117

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'vim', 'member']
let g:deoplete#sources#go = 'vim-go'

inoremap <expr><C-n> deoplete#mappings#manual_complete()

if exists(':DeopleteEnable')
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#smart_auto_mappings = 0
  let g:jedi#show_call_signatures = 0
endif

" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'    

" 使indentline生效
let g:indentLine_enabled = 1
set runtimepath^=~/.vim/bundle/ag
set autochdir
set tags=tags;
