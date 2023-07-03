let mapleader=" "

scriptencoding utf-8
set encoding=utf-8
set visualbell
set showmode
set number
set ruler

set wrapscan
set incsearch
set smartcase

"set hlsearch
"set maxmapdepth
"set history

set scroll=0
set scrolloff=0
set scrolljump=0
"set startofline

"set keymodel="startsel,stopsel"
"set selection='inclusive'
"set selectmode=""

set clipboard+=unnamed
"set digraph
"set iskeyword

if !has('nvim') && !has('ide')

    call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    " Plugins will be downloaded under the specified directory.

    Plug 'michaeljsmith/vim-ident-object' 
    Plug 'tpope/vim-surround'

    Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_do_mapping = 0

    Plug 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = "1000"
    let g:highlightedyank_highlight_color = "rgba(100, 160, 100, 100)"

    " List ends here. Plugins become visible to Vim after this call.
    call plug#end()

endif
""" Overrides ------------------------------------------------

" typos
nnoremap cie ciw

" Directionals and Extend Layer
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >>gv
vnoremap <S-Tab> <<gv

nnoremap <Enter> i<Enter><ESC>

nnoremap i gk
nnoremap k gj
nnoremap j h
nnoremap h g^
nnoremap ç g$

vnoremap I gk
vnoremap k gj
vnoremap j h
vnoremap h g^
vnoremap ç g$

nnoremap <A-Right> W
nnoremap <S-A-Right> vW
nnoremap <S-A-Left> vB
nnoremap <A-Left> B

vnoremap <A-Right> W
vnoremap <S-A-Right> W
vnoremap <A-Left> B
vnoremap <S-A-Left> B

nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <leader>i i
nnoremap <leader>a a
vnoremap <leader>i <Esc>i
vnoremap <leader>a <Esc>a

nnoremap <Home> g^
nnoremap <C-Home> g^
nnoremap <C-S-Home> v^
nnoremap <S-Home> v^

nnoremap <End> g$
nnoremap <C-End> g$
nnoremap <C-S-End> v$
nnoremap <S-End> v$

nnoremap <S-Up> vk
nnoremap <S-Right> vl
nnoremap <S-Down> vj
nnoremap <S-Left> vh

inoremap <Home> <Esc>^i
inoremap <C-Home> <Esc>^i
inoremap <C-S-Home> <Esc>vg^
inoremap <S-Home> <Esc>vg^

inoremap <End> <Esc>$a
inoremap <C-End> <Esc>$a
inoremap <C-S-End> <Esc>lv$a
inoremap <S-End> <Esc>lv$

inoremap <S-Up> <Esc>vk
inoremap <S-Right> <Esc>vl
inoremap <S-Down> <Esc>vj
inoremap <S-Left> <Esc>vh

nnoremap <A-Right> W
nnoremap <A-Left> B

nnoremap <leader>i i
nnoremap <leader>a a

vnoremap <leader>i <Esc>i
vnoremap <leader>a <Esc>a

vnoremap <Home> ^
vnoremap <C-Home> ^
vnoremap <C-S-Home> ^
vnoremap <S-Home> ^

vnoremap <End> $
vnoremap <C-End> $
vnoremap <C-S-End> $
vnoremap <S-End> $

"vnoremap <Up> k
"vnoremap <Down> j
"vnoremap <Left> h
"vnoremap <Right> l

vnoremap <S-Up> k
vnoremap <S-Down> j
vnoremap <S-Left> h
vnoremap <S-Right> l

""" ____________________ [Q] prefix controls [Q]uick commands

nnoremap q <Nop>

nnoremap qq <Esc>
vnoremap qq <Esc>

nnoremap qo %
nnoremap qu {
nnoremap qp }

vnoremap qo %
vnoremap qu {
vnoremap qp }

nnoremap qi <C-U>
nnoremap qk <C-D>
nnoremap qI gg
nnoremap qK G

vnoremap qi <C-U>
vnoremap qk <C-D>

vnoremap qI gg
vnoremap qK G

nnoremap ql <C-I>
nnoremap qj <C-O>
nnoremap qL g;
nnoremap qJ g,

""" ____________________ [W] prefix is for [W]ord movement

"Additional text objects: ai, ii, aI
    
"nnoremap w <Nop>
"nnoremap ww w

"nnoremap wl w
"nnoremap wj b
"nnoremap wç W
"nnoremap wh B

"nnoremap wo e
"nnoremap wu ge

""" ____________________ [E] prefix controls [E]dit cursor

nnoremap ee e
vnoremap ee e

" Todo - could be better
nnoremap ea a 

nnoremap ei O
nnoremap ek o
vnoremap ei <Esc>`<O
vnoremap ek <Esc>`>o

nnoremap ej bi
nnoremap el ea
vnoremap ej <Esc>`<i
vnoremap el <Esc>`>a

nnoremap eL Ea
nnoremap eJ Bi
" no visual counterpart

nnoremap eç A
vnoremap eç A
nnoremap eh I
vnoremap eh I

nnoremap eu {i
nnoremap ep }a
" no visual counterpart

nnoremap eo %a
vnoremap eo <Esc>%i

nnoremap eml ]wa
nnoremap emj [bi
vnoremap eml <Esc>`>]wa
vnoremap emj <Esc>`<[bi

" Experimental
nnoremap e, /,<CR>i
nnoremap e. /.<CR>i
nnoremap e; /;<CR>i
nnoremap e) /)<CR>i
nnoremap e( /(<CR>i
nnoremap e? /?<CR>i
nnoremap e= /=<CR>i

""" ____________________ [R] prefix controls [R]efactoring

nnoremap r <Nop>
vnoremap r <Nop>
vnoremap R r

nnoremap rj J
nnoremap ru g~
vnoremap ru ~
nnoremap rr gq
vnoremap rr gq

vnoremap r> :sort i<CR>
vnoremap r< :sort! i<CR>

nnoremap rd "ayy"ap
vnoremap r. :s/)\./)\r./g<CR>
vnoremap r, :s/,/,\r/g<CR>

""" ____________________ [T] prefix is unmodified

""" ____________________ [Y] prefix is for yanking

""" ____________________ [U] prefix is unmodified

""" ____________________ [I] prefix is directional

""" ____________________ [O] prefix controls [O]pening of popups

nnoremap o <Nop>
vnoremap o <Nop>
vnoremap oi o

""" ____________________ [P] prefix controls [P]asting

vnoremap p "ad<Esc>p
vnoremap P "ad<Esc>P

"""___________________________________________________________________________________________________________________________________________________

""" ____________________ [A] prefix is Undetermined

""" ____________________ [S] Prefix Controls [S]urroundings


nnoremap s <Nop>

" Java
nnoremap so vi<"ay/><CR>v?\<<CR>B"ap
nmap sfl viwS)<leader>iCollections.singletonList
vmap sfl S)<leader>iCollections.singletonList
nnoremap sqo ea><Esc>biOptional<
nnoremap sql viw<Esc>a><Esc>biList<

""" ____________________ [D] Prefix Controls [D]eletions

nnoremap d<Space> "adf<Space>
nnoremap dl "adt
nnoremap dj "adT
nnoremap dk "adl

nnoremap d<Home> d^
nnoremap dh d^
nnoremap dH d0

nnoremap d<End> d$
nnoremap dç d$
nnoremap dÇ dg_

nnoremap do d%
nnoremap dp d}
nnoremap du d{

" nnoremap D "adt
" nnoremap DD "aD
nnoremap dip "adip

nnoremap <Del> "adl
nnoremap <C-Del> "adw
nnoremap <Backspace> "adh
nnoremap <C-Backspace> "adb

vnoremap <Del> "ad
vnoremap <C-Del> "ad
vnoremap <Backspace> "ad
vnoremap <C-Backspace> "ad

""" ____________________ [F] Prefix Controls [F]ind

nnoremap f <Nop>

nnoremap ff f
vnoremap ff f
nnoremap fn ;
nnoremap fN ,
nnoremap fk *
nnoremap fK g*
nnoremap fi #
nnoremap fI g#

nnoremap fl <leader><leader>w
nnoremap fj <leader><leader>b
nnoremap fç <leader><leader>j
nnoremap fh <leader><leader>k
nnoremap f/ <leader><leader>/

nnoremap fu :set invhlsearch<CR>
nnoremap <A-f><A-f> /
nnoremap fs :s/
vnoremap fs :s/
nnoremap f. &
vnoremap f. :&<CR>

vnoremap r. :s/)\./)\r./g<CR>gq
vnoremap r, :s/,/,\r/g<CR>gq

" todo: finish these
"     search for currently selected text 
"     noremap fk "ay/\V<C-R>=escape(@",'/\')<CR><CR>
"     ank to search register
"     noremap fy viw"/y
"     noremap fy "/y
"     noremap <A-f>f /

""" ____________________ [G] Prefix is undefined
""" ____________________ [H] Prefix is directional ( Home )
""" ____________________ [J] Prefix is directional ( Left )
""" ____________________ [K] Prefix is directional ( Down )
""" ____________________ [L] Prefix is directional ( Right )
""" ____________________ [Ç] Prefix is directional ( End )

"""___________________________________________________________________________________________________________________________________________________

""" ________________________________ [Z] prefix controls [Z]ooming, [Z]ips and Scroll

nnoremap zz zz
nnoremap zi zb
vnoremap zi zb
nnoremap zk zt
vnoremap zk zt
nnoremap zl zL
nnoremap zj zH

""" ________________________________ [X] prefix controls code stuff

nnoremap x <Nop>

" region collapse
nnoremap x. zo
nnoremap x, zc
nnoremap x0 zM

" next method fallback
nnoremap xi [m
nnoremap xk ]m

""" ________________________________ [C] prefix controls [C]hanging

nnoremap cl "act
nnoremap cL "acf

nnoremap cj "acT
nnoremap cJ "acF

nnoremap ch "ac^
nnoremap c<Home> "ac^
nnoremap cç "ac$
nnoremap c<End> "ac$

nnoremap ck "acl
" ci is inside dummy

nnoremap co c%

""" ________________________________ [V] prefix controls [V]isual selections

vnoremap v <Nop>
nnoremap vl vt
nnoremap vL vf
nnoremap vj vT
nnoremap vJ vF
nnoremap vç vg_
nnoremap v<End> vg_
nnoremap vh v^
nnoremap v<Home> v^

nnoremap vk v
nnoremap vK <C-v>j
" nnoremap vi -> vi is inside dummy

vnoremap V V
nnoremap vv V
nnoremap vb <C-V>
vnoremap vb <C-V>

nnoremap viv g^vg_
nnoremap voa va}V
vnoremap voa a}V
nnoremap vol va]V
vnoremap vol a]V
nnoremap vof va)V
vnoremap vof a)V
nnoremap vif vi)
""" ________________________________ [B] prefix is unmodified

nnoremap nn n
nnoremap nd gD
vnoremap nd <Esc>gD


""" ________________________________ [M] prefix controls [M]ovements

nnoremap mo v%
nnoremap M m

""" todo: Declare this properly as functions here,
"""       use these hardcoded as a fallback for 
"""       emulators without vimscript support

" move quote
nnoremap mq /"<CR>vi"
vnoremap mq /"<CR><Esc>/"<CR>vi"
nnoremap mQ ?"<CR>vi"
vnoremap mQ ?"<CR><Esc>?"<CR>nvi"

" seek ahead camel case
nnoremap me ]w[bv]w
vnoremap me <Esc>]w[bv]w
nnoremap mE [bv]w
vnoremap mE <Esc>[b[bv]w
nnoremap vie ]wv[b

" move curly 
nnoremap ma /{<CR>zovi}
vnoremap ma o<Esc>/{<CR>zovi}
nnoremap mA ?}<CR>vi}
vnoremap mA <Esc>?{<CR>nvi}

" move function call
nnoremap mf /(<CR>vi)
vnoremap mf o<Esc>/(<CR>vi(
nnoremap mF ?)<CR>vi)
vnoremap mF o<Esc>?)<CR>vi(

" ms is busy

" move [list]
nnoremap ml /[<CR>vi[
vnoremap ml o<Esc>/[<CR>vi[
nnoremap mL ?]<CR>vi[
vnoremap mL <Esc>?]<CR>vi[

" move class
nnoremap mz /class/b-3<CR>viw
vnoremap mz <Esc>/class/b-3<CR>viw

" mc is busy

" move number
nnoremap mn /[0-9]\+/<CR>viw
vnoremap mn <Esc>/[0-9]\+/<CR>viw
nnoremap mN ?[0-9]\+?<CR>viw
nnoremap mN <Esc>?[0-9]\+?<CR>viw

" next angle
nnoremap m> /><CR>vi>
vnoremap m> <Esc>/><CR>nvi>
nnoremap m< ?><CR>vi>
vnoremap m< <Esc>?><CR>vi>

" move punctuation
nnoremap m, v/,/e-1<CR>
vnoremap m, /,/e-1<CR>
nnoremap m. v/\./e-1<CR>
vnoremap m. /\./e-1<CR>
nnoremap m; v/;<CR>
vnoremap m; /;<CR>

""" Java - move definition
nnoremap md /= \+/e1<CR>v/;/b-1<CR>
vnoremap md o<Esc>/= \+/e1<CR>v/;/b-1<CR>
nnoremap mD ?= \+?e1<CR>v/;/v-1<CR>
vnoremap mD o<Esc>?= \+?e1<CR>v/;/v-1<CR>

""" Java - move method call - cant use mc because of multicursor remaps.
nnoremap mm /\S(/e-1<CR>v?\v[ ()=.]?e+1<CR>o
vnoremap mm <Esc>/\S(/e-1<CR>v?\v[ ()=.]?e+1<CR>o
nnoremap mM ?(?e-1<CR>vBo
vnoremap mM <Esc>?(?e-1<CR>vBo

"""___________________________________________________________________________________________________________________________________________________

""" Experimental -----------------------------------------


""" Meta -------------------------------------------------

nnoremap <leader>wr :w<CR>:source ~\.vimrc<CR>
nnoremap <leader>vii :e ~/.vimrc<CR>
nnoremap <leader>vij :e ~/.ideavimrc<CR>
nnoremap <leader>vim :e ~/.config/nvim/lua/user/keymaps.lua<CR>
nnoremap <leader>oc :! code :f
nnoremap <leader>oj :! idea :f

if has('nvim')

lua << EOF
require "init.mac"
EOF

endif

"todo https://learnbyexample.github.io/tips/vim-tip-23/
"todo https://vimhelp.org/motion.txt.html#jump-motions
