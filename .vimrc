call pathogen#infect()

" Vim Config File
" standard settings to keep me sane
"
" Dependencies:
"     par
"     perl
"     ruby (for Command-T)
"
" Last Modified: 11/13/2010
" ****************************************************************

filetype indent plugin on
syntax enable

" use Node.js for JavaScript interpretation
let $JS_CMD='node'

" Options
" ****************************************************************
" misc
set hidden
set wildmenu
set nocompatible
set number
set ruler
set list
"set diffopt+=iwhite
"set diffopt+=vertical

" I  like this personally
set listchars=tab:\⇒\─,trail:\‣,extends:\↷,precedes:\↶

" But for example, you might like something like this
" set listchars=tab:\→\ ,trail:\‣,extends:\↷,precedes:\↶
"
" Or something more cluttered, like this
" set listchars=tab:\↴\⇒,trail:\⎕,extends:\↻,precedes:\↺,eol:\↵
"
" Or something more prominent but still thin and line oriented
" set listchars=tab:\┼\─,trail:\˽,extends:\↷,precedes:\↶

" tab behavior
set expandtab
set ts=8
set sts=4
set sw=2

autocmd FileType css,html,htmldjango,javascript,php
  \ setlocal sw=2 |
  \ setlocal ts=2


" search
set ignorecase
set smartcase
set incsearch
set nohlsearch
set nowrap

" window splits
set winminheight=0
set winminwidth=0

" keys
set backspace=2
set whichwrap=b,s,h,l,[,],<,>

" misc
set foldmethod=marker
set display=lastline,uhex
set sessionoptions+=resize

set errorformat=%m\ in\ %f\ on\ line\ %1

" set statusline+=%{rvm#statusline()}
set laststatus=2
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{fugitive#statusline()}%=%-16(\ %l,%c\ %)%P

" Environment Specific Options
" ****************************************************************

colorscheme molokai

" if has("gui_running")
"     " Unbreak Unix style mouse selection -> copy
"     vnoremap <LeftRelease> "+y<LeftRelease>gv
" 
"     set winaltkeys=no
" 
"     " tab display
"     if v:version >= 700
"         set guitablabel=%L\ %t\ %h
"         set guitabtooltip=%f
"     endif
" 
"     " light colors in gui
"     "colorscheme fruit
"     "hi Folded guibg=#f4f4f4 guifg=#444444
"     "colorscheme lingodirector
"     "colorscheme inkpot
"     "hi Folded guibg=#1c314c guifg=#dddddd
"     hi Folded guifg=#dddddd guibg=#1B1D1E
"     "colorscheme zenburn
"     "colorscheme darkblue2
" 
"     " Setup Toolbars
"     set guioptions=mTt " with menubar and toolbar and tearoffs
" 
"     " Set Font
"     if has("win32")
"         set gfn=DejaVu_Sans_Mono:h8:cANSI
"     elseif has("unix")
"         set gfn=DejaVu\ Sans\ Mono\ 10
"     endif
" else
"     " dark colors in terminal
"     colorscheme molokai
"     "colorscheme inkpot
"     "colorscheme zenburn
"     "colorscheme darkblue2
" 
"     "set t_Co=256
"     hi Folded guibg=#1c314c guifg=#dddddd
" 
"     set mouse=a
" endif

" Hide Swap Files
if has("win32")
    if exists("my_diff_mode_flag") && my_diff_mode_flag == 1
        set directory=~\vimfiles\swpdiff,C:\WINDOWS\Temp,~/tmp,~,.
    else
        set directory=~\vimfiles\swpdiff,C:\WINDOWS\Temp,~/tmp,~,.
    endif
elseif has("unix")
    if exists("my_diff_mode_flag") && my_diff_mode_flag == 1
        set directory=~/.vim/swpdiff,~/.swpdiff,/tmp,~/tmp,~,.
    else
        set directory=~/.vim/swp,~/.swp,/tmp,~/tmp,~,.
    endif
endif

" Plugin Settings
" ****************************************************************
" TagList Plugin Settings
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Sort_Type = "name"
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Use_Right_Window = 1

" Filetype Plugin Settings
let g:no_html_tab_mapping=1 " let me insert tabs when i press the freakin tab key!
let g:html_tag_case='lowercase'
let g:sql_type_default='mysql'
let g:miniBufExplTabWrap=1

" don't load the matchparen plugin
let loaded_matchparen = 1

let g:my_project_tagfile_name = 'tags'
let g:my_project_current_project = ''

let g:NERDShutUp = 1

" Auto Commands
" ****************************************************************
" set file types
autocmd BufRead *.as    set ft=actionscript
autocmd BufRead *.mxml  set ft=mxml
autocmd BufRead *.sql   set ft=mysql
autocmd BufRead *.conf  set ft=apache
autocmd BufRead *.tpl   set ft=php
autocmd BufRead *.phtml set ft=php
autocmd BufRead *.wsgi  set ft=python
autocmd BufWrite *.wsgi  set ft=python

" setup tags files
"autocmd BufRead *.* call SetupProject()

" add the closetag script
autocmd FileType xml,xhtml,html,php,phtml,ruby,erb runtime scripts/closetag.vim


" Key Mappings
" ****************************************************************
" auto insert curly braces on Control-F
nnoremap <space> :call ToggleFold()<CR>

imap <C-F> {<CR>}<C-O>O

" fast .vimrc access
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>o :source ~/.vimrc<CR>

" toggles
"nnoremap <Leader>f :botright copen<CR>
"nnoremap <Leader>x :cclose<CR>
" nnoremap <Leader>t :TlistToggle<CR>
nnoremap <Leader>d :NERDTree ~/Desktop<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>b :NERDTree 
nnoremap <Leader>h :set hls!<CR>
nnoremap <Leader>r :call ToggleRelativeNumber()<CR>
vnoremap <Leader>r :call ToggleRelativeNumber()<CR>
nnoremap <Leader>w :call ToggleWrap()<CR>
nnoremap <Leader>z :syntax on<CR>
" ex command for toggling hex mode - define mapping if desired
" command -bar Hexmode call ToggleHex()

" filters
nnoremap <Leader>q {v}!par -jw
vnoremap <Leader>q !par -jw
vnoremap <Leader>a !perl ~/.vim/bin/align.pl -c:=
nnoremap <Leader>s :call StripWhitespace()<CR>

" block movement
nnoremap < <<
nnoremap > >>

inoremap <M-j>j <C-O>:m+<CR><C-O>==
inoremap <M-k>k <C-O>:m-2<CR><C-O>==
inoremap <M-h> <C-O><<
inoremap <M-l> <C-O>>>

vnoremap <M-j> :m'>+<CR>gv=gv
vnoremap <M-k> :m'<-2<CR>gv=gv
vnoremap <M-l> >gv
vnoremap <M-h> <gv
vnoremap > >gv
vnoremap < <gv

noremap <M-j>j :m+<CR>==
noremap <M-k>k :m-2<CR>==

if has("gui_running")
    if has("win32")
        noremap <M-v> "+P
        noremap <M-V> "+p
        noremap <M-c> "+y
        noremap <M-x> "+x
        noremap <M-s> :w<CR>
        noremap <M-w> :BD<CR>
        noremap <M-W> :bd<CR>
        noremap <M-n> :bn<CR>
        noremap <M-p> :bp<CR>
    elseif has("unix")
        noremap <M-v> "+P
        noremap <M-v> "+P
        noremap <M-c> "+y
        noremap <M-x> "+x
        noremap <M-s> :w<CR>
        noremap <M-w> :BD<CR>
        noremap <M-W> :bd<CR>
        noremap <M-n> :bn<CR>
        noremap <M-p> :bp<CR>
    endif
endif

" Text Wrapping Macros
" ****************************************************************
vmap <Leader>xc c<code><C-r>"</code><ESC>
vmap <Leader>xb c<strong><C-r>"</strong><ESC>
vmap <Leader>xi c<em><C-r>"</em><ESC>
vmap <Leader>xl c<li><C-r>"</li><ESC>
vmap <Leader>xa c<a href=""><C-r>"</a><ESC>
vmap <Leader>xu c<ul><C-r>"</ul><ESC>
vmap <Leader>xo c<ol><C-r>"</ol><ESC>
vmap <Leader>xp c<\p><C-r>"</p><ESC>
vmap <Leader>xr c<\pre><C-r>"</pre><ESC>
vmap <Leader>xh1 c<h1 class="section-header"><C-r>"</h1><ESC>
vmap <Leader>xh2 c<h2><C-r>"</h2><ESC>
vmap <Leader>xh3 c<h3><C-r>"</h3><ESC>
vmap <Leader>xh4 c<h4 class="example-filename"><C-r>"</h4><ESC>

nmap <Leader>xc "_yiWcW<code><C-r>"</code><ESC>
nmap <Leader>xb "_yiWcW<strong><C-r>"</strong><ESC>
nmap <Leader>xi "_yiWcW<em><C-r>"</em><ESC>
nmap <Leader>xp "_yiWcW<\p><C-j><C-r>"<C-j></p><ESC>
nmap <Leader>xr "_yiWcW<pre><C-j><C-r>"<C-j></pre><ESC>
nmap <Leader>xu "_yiWcW<ul><C-j><C-r>"<C-j></ul><ESC>
nmap <Leader>xl "_yiWcW<li><C-j><C-r>"<C-j></li><ESC>
nmap <Leader>xd "_yiWcW<div><C-j><C-r>"<C-j></div><ESC>
nmap <Leader>xs "_yiWcW<span><C-j><C-r>"<C-j></span><ESC>
nmap <Leader>xh1 "_yiWcW<h1 class="section-header"><C-r>"</h1><ESC>
nmap <Leader>xh2 "_yiWcW<h2><C-r>"</h2><ESC>
nmap <Leader>xh3 "_yiWcW<h3><C-r>"</h3><ESC>
nmap <Leader>xh4 "_yiWcW<h4 class="example-filename"><C-r>"</h4><ESC>


" Functions
" ****************************************************************
" my system specific function to find tags files if this is a project
function! SetupProject()
    " get
    "   %  current filename
    "   :p full path
    "   :h head only aka dirname
    let dirpath = expand('%:p:h')
    let search  = g:my_project_root_dir.'/\(.\{-}\)/\(.\{-}\)\(/\|$\)'
    let matches = matchlist(dirpath, search)

    " if we're in a project directory
    if len(matches)
        let host_type   = get(matches, 1, '')
        let host_name   = get(matches, 2, '')
        let new_project = host_type.'/'.host_name

        " if we've changed projects
        if new_project != g:my_project_current_project
            let g:my_project_current_project = new_project

            let tags_file    =  findfile(g:my_project_tagfile_name, '.;')
            let matches      =  matchlist(tags_file, '\(.\{-}\)/\?\('.g:my_project_tagfile_name.'\)')
            let change_path  =  get(matches, 1, '')

            " change to the new project directory if need be
            if strlen(change_path) > 0
                execute 'cd '.change_path
            end

            " tags file always indicates root, so the tags
            " filename is sufficient for the relative path
            let &tags=g:my_project_tagfile_name
        endif
    endif
endfunction

function! ToggleRelativeNumber()
    if( &nu == 1 )
        set nonu
        set rnu
    else
        set nu
        set nornu
    endif
endfunction

function! StripWhitespace()
	let currPos=Mark()
	exe 'v:^--\s*$:s:\s\+$::e'
	exe currPos
endfunction

function! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfunction

" toggle word wrapping
function! ToggleWrap()
    set wrap!

    if( &wrap == 1 )
        nmap j gj
        nmap k gk
    else
        unmap j
        unmap k
    endif
endfunction

function! Mark(...)
    if a:0 == 0
        let mark = line(".") . "G" . virtcol(".") . "|"
        normal! H
        let mark = "normal!" . line(".") . "Gzt" . mark
        execute mark
        return mark
    elseif a:0 == 1
        return "normal!" . a:1 . "G1|"
    else
        return "normal!" . a:1 . "G" . a:2 . "|"
    endif
endfunction

" helper function to toggle hex mode
function! ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction
