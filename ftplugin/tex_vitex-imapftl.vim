inoremap <buffer> <tab> <c-r>=imapftl#Imapftl_GetMapping(9, "imapftl_vitex")<cr>
inoremap <buffer> <space> <c-r>=imapftl#Imapftl_GetMapping(32, "imapftl_vitex")<cr>
inoremap <buffer> <cr> <c-r>=imapftl#Imapftl_GetMapping(13, "imapftl_vitex")<cr>

inoremap <buffer> <F5> <c-r>=imapftl#Imapftl_GetGenericMapping(9, "imapftl_vitex")<cr>
inoremap <buffer> <F6> <c-r>=imapftl#Imapftl_GetGenericMapping(13, "imapftl_vitex")<cr>
