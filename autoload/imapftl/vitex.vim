let g:imapftl#vitex#leaders = [ char2nr('\') ]

let g:imapftl#vitex#macro_token_excl = [
    \ char2nr('\s'),
    \ char2nr('{'),
    \ char2nr('}'),
    \ char2nr('['),
    \ char2nr(']'),
    \ char2nr('\$')
    \ ]

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
    \ "document"     : "\\begin{document}\n<++>\n\\end{document}",
    \ "maketitle"     : "\\maketitle\n<++>",
    \ "title"     : "\\maketitle\n<++>",
    \ "tableofcontents"     : "\\tableofcontents\n<++>",
    \ "toc"     : "\\tableofcontents\n<++>",
    \ "center" : "\\begin{center}\n<++>\n\\end{center}\n<++>",
    \ "figure"
    \ : "\\begin{figure}\n<++>\n\\caption{<++>}\n"
    \ . "\\label{fig:<++>}\n\\end{figure}\n<++>",
    \ "tikzpicture" : "\\begin{tikzpicture}\n<++>\n\\end{tikzpicture}\n<++>",
    \ "tabular" : "\\begin{tabular}[<++>]{<++>}\n<++>\n\\end{tabular}\n<++>",
    \ "array" : "\\begin{array}{<++>}\n<++>\n\\end{array}\n<++>",
    \ "abstract"     : "\\begin{abstract}\n<++>\n\\end{abstract}\n<++>",
    \ "block"     : "\\block{<++>}{\n<++>\n}\n<++>",
    \ "onslide"     : "\\onslide<<++>-<++>>{<++>}\n<++>",
    \ "*onslide"     : "\\onslide*<<++>-<++>>{<++>}\n<++>",
    \ "displaymath" : "\\begin{displaymath}\n<++>\n\\end{displaymath}\n<++>",
    \ "math" : "\\begin{displaymath}\n<++>\n\\end{displaymath}\n<++>",
    \ "equation"
    \ : "\\begin{equation} \\label{eq:<++>}\n<++>\n\\end{equation}\n<++>",
    \ "*equation" : "\\begin{equation*}\n<++>\n\\end{equation*}\n<++>",
    \ "align"	     : "\\begin{align}\n<++>\n\\end{align}\n<++>",
    \ "*align"    : "\\begin{align*}\n<++>\n\\end{align*}\n<++>",
    \ "enumerate" : "\\begin{enumerate}\n\\item <++>\n\\end{enumerate}\n<++>",
    \ "itemize"	: "\\begin{itemize}\n\\item <++>\n\\end{itemize}\n<++>",
    \ "frame"	     : "\\begin{frame}\n<++>\n\\end{frame}\n<++>",
    \ "theorem"
    \ : "\\begin{theorem}[<++>] \\label{thm:<++>}\n<++>\n\\end{thm}\n<++>",
    \ "thm" : "\\begin{thm}[<++>] \\label{thm:<++>}\n<++>\n\\end{thm}\n<++>",
    \ "athm"
    \ : "\\begin{athm}[<++>] \\label{thm:\theathm}\n<++>\n\\end{thm}\n<++>",
    \ "proposition"
    \ : "\\begin{prop}[<++>] \\label{prop:<++>}\n<++>\n\\end{prop}\n<++>",
    \ "lemma"
    \ : "\\begin{lem}[<++>] \\label{lem:<++>}\n<++>\n\\end{lem}\n<++>",
    \ "corollary"
    \ : "\\begin{cor}[<++>] \\label{cor:<++>}\n<++>\n\\end{cor}\n<++>",
    \ "definition"
    \ : "\\begin{defn}[<++>] \\label{def:<++>}\n<++>\n\\end{defn}\n<++>",
    \ "example"
    \ : "\\begin{exm}[<++>] \\label{exm:<++>}\n<++>\n\\end{exm}\n<++>",
    \ "problem"
    \ : "\\begin{prob}[<++>] \\label{prob:<++>}\n<++>\n\\end{prob}\n<++>",
    \ "remark"
    \ : "\\begin{rem}[<++>] \\label{rem:<++>}\n<++>\n\\end{rem}\n<++>",
    \ "observation"
    \ : "\\begin{obs}[<++>] \\label{obs:<++>}\n<++>\n\\end{obs}\n<++>",
    \ "note"
    \ : "\\begin{note}[<++>] \\label{note:<++>}\n<++>\n\\end{note}\n<++>",
    \ "proof"    : "\\begin{proof}\n<++>\n\\end{proof}\n<++>",
    \ }
" }}}

" imap dictionary: \...<tab> {{{
" Leader 92 = '\'
" Trigger 9 = "\<tab>"
let s:cmd_dict = {
      \ "tex"	      : "\\TeX{}",
      \ "latex"	      : "\\LaTeX{}",
      \ "input"	      : "\\input{<++>}",
      \ "usepackage"    : "\\usepackage[<++>]{<++>}",
      \ "newcommand"    : "\\newcommand{<++>}[<++>][<++>]{<++>}",
      \ "renewcommand" : {"txt" : "renewcommand", "paramc" : 2, "opt" : 0},
      \ "section"	: "\\section{<++>}\n<++>",
      \ "subsection"    : "\\subsection{<++>}\n<++>",
      \ "ssection"      : "\\subsection{<++>}\n<++>",
      \ "subsubsection" : "\\subsubsection{<++>}\n<++>",
      \ "sssection"     : "\\subsubsection{<++>}\n<++>",
      \ "paragraph"     : "\\paragraph{<++>} <++>",
      \ "frametitle"    : "\\frametitle{<++>}\n<++>",
      \ "boldsymbol"    : "\\boldsymbol{<++>}<++>",
      \ "text"	      : "\\text{<++>}<++>",
      \ "tx"	      : "\\text{<++>}<++>",
      \ "mathbf"	      : "\\mathbf{<++>}<++>",
      \ "mbf"	      : "\\mathbf{<++>}<++>",
      \ "mathbb"	      : "\\mathbb{<++>}<++>",
      \ "bb"	      : "\\mathbb{<++>}<++>",
      \ "mathrm"	      : "\\mathrm{<++>}<++>",
      \ "rm"	      : "\\mathrm{<++>}<++>",
      \ "mathcal"	      : "\\mathcal{<++>}<++>",
      \ "cal"	      : "\\mathcal{<++>}<++>",
      \ "mathscr"	      : "\\mathscr{<++>}<++>",
      \ "scr"	      : "\\mathscr{<++>}<++>",
      \ "textbf"	      : "\\textbf{<++>}<++>",
      \ "bf"	      : "\\textbf{<++>}<++>",
      \ "textit" : {"txt" : "textit", "paramc" : 1, "opt" : v:false},
      \ "it" : {"txt" : "textit", "paramc" : 1, "opt" : v:false},
      \ "textsc"	      : "\\textsc{<++>}<++>",
      \ "sc"	      : "\\textsc{<++>}<++>",
      \ "texttt"	      : "\\texttt{<++>}<++>",
      \ "tt"	      : "\\texttt{<++>}<++>",
      \ "emph"	      : "\\emph{<++>}<++>",
      \ "cite"	      : "\\cite[<++>]{<++>}<++>",
      \ "ref"	      : "\\ref{<++>}<++>",
      \ "eqref"	      : "\\eqref{eq:<++>}<++>",
      \ "hyperref"      : "\\hyperref[<++>]{<++>}<++>",
      \ "label"	      : "\\label{<++>}<++>",
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
      \ "6" : {"txt" : "partial", "paramc" : 0, "opt" : 0},
      \ "partial" : {"txt" : "partial", "paramc" : 0, "opt" : 0},
      \ "8" : {"txt" : "infty", "paramc" : 0, "opt" : 0},
      \ "infty" : {"txt" : "infty", "paramc" : 0, "opt" : 0},
      \ "-" : {"txt" : "setminus", "paramc" : 0, "opt" : 0},
      \ "setminus" : {"txt" : "setminus", "paramc" : 0, "opt" : 0},
      \ '^' : '\hat{<++>}<++>',
      \ '_' : '\bar{<++>}<++>',
      \ '/' : '\frac{<++>}{<++>}<++>',
      \ 'frac' : '\frac{<++>}{<++>}<++>',
      \ '@' : '\circ',
      \ '0' : '^\circ',
      \ '=' : '\equiv',
      \ '.' : '\cdot',
      \ '*' : '\times',
      \ '2' : '\sqrt[<++>]{<++>}<++>',
      \ 'nonumber' : '\nonumber{}',
      \ "square" : '\square{}',
      \ "tilde" : '\tilde{<++>}<++>',
      \ "hat" : '\hat{<++>}<++>',
      \ "bar" : '\bar{<++>}<++>',
      \ "widetilde" : '\widetilde{<++>}<++>',
      \ "wtilde" : '\widetilde{<++>}<++>',
      \ "widehat" : '\widehat{<++>}<++>',
      \ "what" : '\widehat{<++>}<++>',
      \ "widebar" : '\widebar{<++>}<++>',
      \ "wbar" : '\widebar{<++>}<++>',
      \ "wedge" : '\wedge{}',
      \ 'int' : "\\int_{<++>}^{<++>}<++>",
      \ 'dot' : '\dot{<++>}<++>',
      \ 'sum' : '\sum_{<++>}^{<++>}<++>',
      \ }
" }}}

" }}}

let g:imapftl#vitex#phs = "<+"
let g:imapftl#vitex#phe = "+>"
let g:imapftl#vitex#ph = g:imapftl#vitex#phs.g:imapftl#vitex#phe

func s:lookup_macro(dict, token)
  if has_key(a:dict, a:token)
    return a:dict[a:token]
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
    return {}
  endif

  if len(l:matches) == 1
    " Unique macro key matching token, so just grab that one's 
    " corresponding l:macro text.
    return a:dict[l:matches[0]]
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
  return a:dict[selMacro]
endfunc

function s:bld_macro_cmd(token, trigger)
  let l:macro_dict = s:lookup_macro(s:cmd_dict, a:token)
  if empty(l:macro_dict)
    return v:null
  endif

  let l:macro = "\\".l:macro_dict["txt"]

  if a:trigger == 32 " <space>
    return l:macro." "
  endif

  if l:macro_dict["opt"]
    let l:macro .= "[<++>]"
  endif
  let l:param_nr = 0
  while l:param_nr < l:macro_dict["paramc"]
    let l:param_nr += 1
    let l:macro .= "{<++>}"
  endwhile

  return l:macro."<++>"
endfunction

function s:bld_macro_env(token)
  return s:lookup_macro(s:env_dict, a:token)
  let l:macro = "\\begin{".a:name."}"
  if a:ins_label
    let l:macro .= " \\label{".ph."}"
  endif
  let l:macro .= "\n".ph."\n\\end{".a:name."}\n"
  return "\\begin{".a:name."}\n".ph."\n"
endfunction

function imapftl#vitex#get_macro(token, trigger, leader)
  if a:trigger == 13 " <cr>
    return s:bld_macro_env(a:token)
  else
      return s:bld_macro_cmd(a:token, a:trigger)
  endif
endfunction

" vim:ft=vim:fdm=marker
