let g:imapftl#vitex#leader_pat = '\\'

let g:imapftl#vitex#macro_token_excl_pat = '[^\_@a-zA-Z0-9]'

"Enter - generic
let g:imapftl#vitex#generic_mapping_13 =
    \ "\\begin{%N}\n<++>\n\\end{%N}\n<++>"
"Tab - generic
let g:imapftl#vitex#generic_mapping_9 = '\<%N>{<++>}<++>'

" Imap Dictionaries: {{{
" Form: { [ key = macro name, value = expansion text ], ... }
" Description: {{{ Each dictionary has a name of the form 
" `imapftl_vitex#dict_{nr1}_{nr2}`. Here {nr1} is the UTF-8 / ASCII code for the 
" leader character, and {nr2} that of the triggering keystroke character, 
" to which the pairs `[{macro name}, {macro expansion text}]` in the 
" dictionary are to be associated. (This allows similar / identical macro 
" name patterns to be used with different leader + trigger pairs so that 
" they do not clobber each other.) A particular dictionary is chosen for 
" the expansion text lookup in `func GetRunningImap()` below based on that 
" leader + trigger pair typed by the user. The token checked against the 
" dictionary keys is that text lying between the leader, on the left, and 
" one column left of the cursor position when the trigger was typed.
" }}}

" imap dictionary: \...<cr> {{{
" Leader 92 = '\'
" Trigger 13 = "\<cr>"
let s:env_dict = {
    \ "document" : {},
    \ "center" : {},
    \ "figure" : {"lab" : "fig:"},
    \ "tikzpicture" : {},
    \ "tabular" : {"paramc" : 1, "opt" : 1},
    \ "array" : {"paramc" : 1},
    \ "abstract" : {},
    \ "block" : {"raw" : "\\block{<++>}{\n<++>\n}\n<++>"},
    \ "onslide" : {"raw" : "\\onslide<<++>-<++>>{<++>}\n<++>"},
    \ "*onslide" : {"raw" : "\\onslide*<<++>-<++>>{<++>}\n<++>"},
    \ "displaymath" : {},
    \ "math" : {"txt" : "displaymath"},
    \ "equation" : {"lab" : "eq:"},
    \ "*equation" : {"txt" : "equation*"},
    \ "align" : {},
    \ "*align" : {"txt" : "align*"},
    \ "enumerate" : {},
    \ "itemize"	: {},
    \ "frame" : {},
    \ "theorem" : {"lab" : "thm:", "opt" : 1},
    \ "thm" : {"lab" : "thm:", "opt" : 1},
    \ "athm" : {"lab" : "thm:", "opt" : 1},
    \ "proposition" : {"txt" : "prop", "lab" : "prop:", "opt" : 1},
    \ "lemma" : {"txt" : "lem", "lab" : "lem:", "opt" : 1},
    \ "corollary" : {"txt" : "cor", "lab" : "cor:", "opt" : 1},
    \ "definition" : {"txt": "defn", "lab" : "def:", "opt" : 1},
    \ "example" : {"txt" : "exm", "lab" : "exm:", "opt" : 1},
    \ "problem" : {"txt" : "prob", "lab" : "prob:", "opt" : 1},
    \ "question" : {"txt" : "qn", "lab" : "qn:", "opt" : 1},
    \ "remark" : {"txt" : "rem", "lab" : "rem:", "opt" : 1},
    \ "observation" : {"txt" : "obs", "lab" : "obs:", "opt" : 1},
    \ "note" : {"lab" : "note:", "opt" : 1},
    \ "proof" : {},
    \ }
" }}}

" imap dictionary: \...<tab> {{{
" Leader 92 = '\'
" Trigger 9 = "\<tab>"
let s:cmd_dict = {
    \ "maketitle" : {},
    \ "title" : {"txt" : "maketitle"},
    \ "tableofcontents" : {},
    \ "to" : {},
    \ "toc" : {"txt" : "tableofcontents"},
    \ "Tex" : {"txt" : "TeX"},
    \ "Latex" : {"txt" : "LaTeX"},
    \ "in" : {},
    \ "inverse" : {"raw" : "^{-1}"},
    \ "input" : {"paramc" : 1},
    \ "usepackage" : {"paramc" : 1, "opt" : 1},
    \ "newcommand" : {"paramc" : 2},
    \ "renewcommand" : {"paramc" : 2},
    \ "section" : {"paramc" : 1},
    \ "subsection" : {"paramc" : 1},
    \ "ssection" : {"txt" : "subsection", "paramc" : 1},
    \ "subsubsection" : {"paramc" : 1},
    \ "sssection" : {"txt" : "subsubsection", "paramc" : 1},
    \ "paragraph" : {"paramc" : 1},
    \ "frametitle" : {"paramc" : 1},
    \ "boldsymbol"    : {"paramc" : 1},
    \ "text"    : {"paramc" : 1},
    \ "mathbf" : {"paramc" : 1},
    \ "mbf" : {"txt" : "mathbf", "paramc" : 1},
    \ "mathbb" : {"paramc" : 1},
    \ "bb" : {"txt" : "mathbb", "paramc" : 1},
    \ "mathrm" : {"paramc" : 1},
    \ "rm" : {"txt" : "mathrm", "paramc" : 1},
    \ "mathcal" : {"paramc" : 1},
    \ "cal" : {"txt" : "mathcal", "paramc" : 1},
    \ "mathscr" : {"paramc" : 1},
    \ "scr" : {"txt" : "mathscr", "paramc" : 1},
    \ "textbf" : {"paramc" : 1},
    \ "bf" : {"txt" : "textbf", "paramc" : 1},
    \ "textit" : {"paramc" : 1},
    \ "it" : {"txt" : "textit", "paramc" : 1},
    \ "textsc" : {"paramc" : 1},
    \ "sc" : {"txt" : "textsc", "paramc" : 1},
    \ "texttt" : {"paramc" : 1},
    \ "tt" : {"txt" : "texttt", "paramc" : 1},
    \ "emph" : {"paramc" : 1},
    \ "cite" : {"paramc" : 1},
    \ "ref" : {"paramc" : 1},
    \ "eqref" : {"raw" : "\\eqref{eq:<++>}"},
    \ "hyperref" : {"paramc" : 1},
    \ "label" : {"paramc" : 1},
    \ "a" : {"txt" : "alpha", "paramc" : 0, "opt" : 0},
    \ "b" : {"txt" : "beta", "paramc" : 0, "opt" : 0},
    \ "c" : {"txt" : "varsigma", "paramc" : 0, "opt" : 0},
    \ "d" : {"txt" : "delta", "paramc" : 0, "opt" : 0},
    \ "e" : {"txt" : "epsilon", "paramc" : 0, "opt" : 0},
    \ "f" : {"txt" : "phi", "paramc" : 0, "opt" : 0},
    \ "g" : {"txt" : "gamma", "paramc" : 0, "opt" : 0},
    \ "h" : {"txt" : "eta", "paramc" : 0, "opt" : 0},
    \ "i" : {"txt" : "iota", "paramc" : 0, "opt" : 0},
    \ "j" : {"txt" : "varepsilon", "paramc" : 0, "opt" : 0},
    \ "k" : {"txt" : "kappa", "paramc" : 0, "opt" : 0},
    \ "l" : {"txt" : "lambda", "paramc" : 0, "opt" : 0},
    \ "m" : {"txt" : "mu", "paramc" : 0, "opt" : 0},
    \ "n" : {"txt" : "nu", "paramc" : 0, "opt" : 0},
    \ "o" : {"txt" : "omicron", "paramc" : 0, "opt" : 0},
    \ "p" : {"txt" : "pi", "paramc" : 0, "opt" : 0},
    \ "q" : {"txt" : "theta", "paramc" : 0, "opt" : 0},
    \ "r" : {"txt" : "rho", "paramc" : 0, "opt" : 0},
    \ "s" : {"txt" : "sigma", "paramc" : 0, "opt" : 0},
    \ "t" : {"txt" : "tau", "paramc" : 0, "opt" : 0},
    \ "u" : {"txt" : "upsilon", "paramc" : 0, "opt" : 0},
    \ "v" : {"txt" : "varphi", "paramc" : 0, "opt" : 0},
    \ "w" : {"txt" : "omega", "paramc" : 0, "opt" : 0},
    \ "x" : {"txt" : "chi", "paramc" : 0, "opt" : 0},
    \ "y" : {"txt" : "psi", "paramc" : 0, "opt" : 0},
    \ "z" : {"txt" : "zeta", "paramc" : 0, "opt" : 0},
    \ "D" : {"txt" : "Delta", "paramc" : 0, "opt" : 0},
    \ "F" : {"txt" : "Phi", "paramc" : 0, "opt" : 0},
    \ "G" : {"txt" : "Gamma", "paramc" : 0, "opt" : 0},
    \ "L" : {"txt" : "Lambda", "paramc" : 0, "opt" : 0},
    \ "P" : {"txt" : "Pi", "paramc" : 0, "opt" : 0},
    \ "Q" : {"txt" : "Theta", "paramc" : 0, "opt" : 0},
    \ "S" : {"txt" : "Sigma", "paramc" : 0, "opt" : 0},
    \ "U" : {"txt" : "Upsilon", "paramc" : 0, "opt" : 0},
    \ "W" : {"txt" : "Omega", "paramc" : 0, "opt" : 0},
    \ "Y" : {"txt" : "Psi", "paramc" : 0, "opt" : 0},
    \ "6" : {"txt" : "partial"},
    \ "partial" : {},
    \ "8" : {"txt" : "infty"},
    \ "infty" : {},
    \ "-" : {"txt" : "setminus"},
    \ "setminus" : {},
    \ "tilde" : {"paramc" : 1},
    \ "widetilde" : {"paramc" : 1},
    \ "wtilde" : {"txt" : "widetilde", "paramc" : 1},
    \ "hat" : {"paramc" : 1},
    \ "widehat" : {"paramc" : 1},
    \ "what" : {"txt" : "widehat", "paramc" : 1},
    \ "bar" : {"paramc" : 1},
    \ "widebar" : {"paramc" : 1},
    \ "wbar" : {"txt" : "widebar", "paramc" : 1},
    \ '/' : {"txt" : "frac", "paramc" : 2},
    \ "frac" : {"paramc" : 2},
    \ "2" : {"txt" : "sqrt", "paramc" : 1, "opt" : 1},
    \ "square" : {},
    \ "wedge" : {},
    \ "integral" : {"raw" : "\\int_{<++>}^{<++>}<++>"},
    \ "sum" : {"raw" : "\\sum_{<++>}^{<++>}<++>"},
    \ "dot" : {"paramc" : 1},
    \ }
" }}}

" }}}

let g:imapftl#vitex#phs = "<+"
let g:imapftl#vitex#phe = "+>"
let g:imapftl#vitex#ph = g:imapftl#vitex#phs.g:imapftl#vitex#phe

func s:lookup_macro(dict, token) " {{{
  if has_key(a:dict, a:token)
    return [a:token, a:dict[a:token]]
  endif

  " User-typed token does not match a macro name exactly, so build a list of 
  " those it pattern-matches.
  let l:matches = []
  for l:key in keys(a:dict)
    if l:key =~ '\C^'.a:token.'\w*$'
      call extend(l:matches, [l:key])
    endif
  endfor

  if len(l:matches) <= 0
    return [v:null, {}]
  endif

  if len(l:matches) == 1
    " Unique macro key matching token, so just grab that one's 
    " corresponding l:macro text.
    return [l:matches[0], a:dict[l:matches[0]]]
  endif

  call sort(l:matches)
  let l:sel_prompt_list = ['Select macro:']
  for selection in l:matches
    call add(l:sel_prompt_list,
	\ index(l:matches, selection) + 1
	\ . '. ' . selection)
  endfor
  let selMacro = l:matches[
      \ inputlist(l:sel_prompt_list) - 1 ]
  return [selMacro, a:dict[selMacro]]
endfunc
" }}}

func s:bld_macro_cmd(token, trigger) " {{{
  let l:macro_key_dict = s:lookup_macro(s:cmd_dict, a:token)
  let l:macro_key = l:macro_key_dict[0]
  let l:macro_dict = l:macro_key_dict[1]
  if empty(l:macro_key)
    return v:null
  endif

  if has_key(l:macro_dict, "raw")
    return l:macro_dict["raw"]
  endif

  if has_key(l:macro_dict, "txt")
    let l:macro = "\\".l:macro_dict["txt"]
  else
    let l:macro = "\\".l:macro_key
  endif

  if a:trigger == 32 " <space>
    return l:macro." "
  endif

  if has_key(l:macro_dict, "opt") && l:macro_dict["opt"]
    let l:macro .= "[<++>]"
  endif

  if has_key(l:macro_dict, "paramc") && l:macro_dict["paramc"] > 0
    let l:param_nr = 0
    while l:param_nr < l:macro_dict["paramc"]
      let l:param_nr += 1
      let l:macro .= "{".g:imapftl#vitex#ph."}"
    endwhile
  endif

  return l:macro
endfunc
" }}}

func s:bld_macro_env(token) " {{{
  let l:macro_key_dict = s:lookup_macro(s:env_dict, a:token)
  let l:macro_key = l:macro_key_dict[0]
  let l:macro_dict = l:macro_key_dict[1]
  if empty(l:macro_key)
    return v:null
  endif

  if has_key(l:macro_dict, "raw")
    return l:macro_dict["raw"]
  endif

  let l:name = l:macro_key
  if has_key(l:macro_dict, "txt")
    let l:name = l:macro_dict["txt"]
  endif
  let l:macro = "\\begin{".l:name."}"

  if has_key(l:macro_dict, "opt") && l:macro_dict["opt"]
    let l:macro .= "[".g:imapftl#vitex#ph."]"
  endif

  if has_key(l:macro_dict, "paramc") && l:macro_dict["paramc"] > 0
    let l:param_nr = 0
    while l:param_nr < l:macro_dict["paramc"]
      let l:param_nr += 1
      let l:macro .= "{".g:imapftl#vitex#ph."}"
    endwhile
  endif

  if has_key(l:macro_dict, "lab")
    let l:macro .= " \\label{".l:macro_dict["lab"].g:imapftl#vitex#ph."}"
  endif

  return l:macro."\n".g:imapftl#vitex#ph."\n\\end{".l:name."}\n"
endfunc
" }}}

function imapftl#vitex#get_macro(token, trigger, leader)
  if a:trigger == 13 " <cr>
    return s:bld_macro_env(a:token)
  else
      return s:bld_macro_cmd(a:token, a:trigger)
  endif
endfunction

" vim:ft=vim:fdm=marker
