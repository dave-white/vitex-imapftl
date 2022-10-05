inoremap <buffer> <tab> <c-r>=imapftl#get_macro(9, "vitex")<cr>
inoremap <buffer> <space> <c-r>=imapftl#get_macro(32, "vitex")<cr>
inoremap <buffer> <cr> <c-r>=imapftl#get_macro(13, "vitex")<cr>

inoremap <buffer> <F5> <c-r>=imapftl#get_generic_macro(9, "vitex")<cr>
inoremap <buffer> <F6> <c-r>=imapftl#get_generic_macro(13, "vitex")<cr>

nnoremap <buffer> <C-J> :call imapftl#jump2ph("vitex")<CR>
nnoremap <buffer> <C-K> :call imapftl#jump2ph("vitex", -1)<CR>
inoremap <buffer> <C-J> <c-o>:call imapftl#jump2ph("vitex")<CR>
inoremap <buffer> <C-K> <c-o>:call imapftl#jump2ph("vitex", -1)<CR>

inoremap <buffer> ... \textellipsis
inoremap <buffer> \|\| \textbar
" inoremap <buffer> <bslash><bslash> \backslash
inoremap <buffer> ., \dotsc
inoremap <buffer> .* \dotsb
inoremap <buffer> .v \vdots
inoremap <buffer> .h \hdots
inoremap <buffer> .d \ddots
inoremap <buffer> == &=
inoremap <buffer> __ <c-r>=imapftl#print_ph_jump('_{<++>}')<cr>
inoremap <buffer> ^^ <c-r>=imapftl#print_ph_jump('^{<++>}')<cr>
inoremap <buffer> $$ <c-r>=imapftl#print_ph_jump('$<++>$')<cr>
inoremap <buffer> () <c-r>=imapftl#print_ph_jump('(<++>)')<cr>
inoremap <buffer> [] <c-r>=imapftl#print_ph_jump('[<++>]')<cr>
inoremap <buffer> {} <c-r>=imapftl#print_ph_jump('{<++>}')<cr>
inoremap <buffer> <> <c-r>=imapftl#print_ph_jump('\langle <++> \rangle')<cr>
inoremap <buffer> (( <c-r>=imapftl#print_ph_jump('\left( <++> \right)')<cr>
inoremap <buffer> {{ <c-r>=imapftl#print_ph_jump('\left\{ <++> \right\}')<cr>
inoremap <buffer> << <c-r>=imapftl#print_ph_jump('\left\langle <++> \right\rangle')<cr>
