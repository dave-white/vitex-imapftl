inoremap <buffer> <tab> <c-r>=imapftl#get_macro(9, "vitex")<cr>
inoremap <buffer> <space> <c-r>=imapftl#get_macro(32, "vitex")<cr>
inoremap <buffer> <cr> <c-r>=imapftl#get_macro(13, "vitex")<cr>

inoremap <buffer> <F5> <c-r>=imapftl#get_generic_macro(9, "vitex")<cr>
inoremap <buffer> <F6> <c-r>=imapftl#get_generic_macro(13, "vitex")<cr>
