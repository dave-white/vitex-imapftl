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
let g:imapftl#vitex#generic_mapping_92_13 =
    \ "\\begin{%N}\n<++>\n\\end{%N}\n<++>"
"Tab - generic
let g:imapftl#vitex#generic_mapping_92_9 = '\<%N>{<++>}<++>'

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
let g:imapftl#vitex#dict_92_13 = {
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
    \ : "\\begin{equation} \\label{eq:<++>}<++>\\end{equation}<++>",
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
let g:imapftl#vitex#dict_92_9 = {
      \ "tex"	      : "\\TeX{}",
      \ "latex"	      : "\\LaTeX{}",
      \ "input"	      : "\\input{<++>}",
      \ "usepackage"    : "\\usepackage[<++>]{<++>}",
      \ "newcommand"    : "\\newcommand{<++>}[<++>][<++>]{<++>}",
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
      \ "textit"	      : "\\textit{<++>}<++>",
      \ "it"	      : "\\textit{<++>}<++>",
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
      \ 'a' : '\alpha',
      \ 'b' : '\beta',
      \ 'c' : '\varsigma',
      \ 'd' : '\delta',
      \ 'e' : '\epsilon',
      \ 'f' : '\phi',
      \ 'g' : '\gamma',
      \ 'h' : '\eta',
      \ 'i' : '\iota',
      \ 'j' : '\varepsilon',
      \ 'k' : '\kappa',
      \ 'l' : '\lambda',
      \ 'm' : '\mu',
      \ 'n' : '\nu',
      \ 'o' : '\omicron',
      \ 'p' : '\pi',
      \ 'q' : '\theta',
      \ 'r' : '\rho',
      \ 's' : '\sigma',
      \ 't' : '\tau',
      \ 'u' : '\upsilon',
      \ 'v' : '\varphi',
      \ 'w' : '\omega',
      \ 'x' : '\chi',
      \ 'y' : '\psi',
      \ 'z' : '\zeta',
      \ 'D' : '\Delta',
      \ 'F' : '\Phi',
      \ 'G' : '\Gamma',
      \ 'L' : '\Lambda',
      \ 'P' : '\Pi',
      \ 'Q' : '\Theta',
      \ 'S' : '\Sigma',
      \ 'U' : '\Upsilon',
      \ 'W' : '\Omega',
      \ 'Y' : '\Psi',
      \ '^' : '\hat{<++>}<++>',
      \ '_' : '\bar{<++>}<++>',
      \ '6' : '\partial',
      \ 'partial' : '\partial',
      \ '8' : '\infty',
      \ 'infty' : '\infty',
      \ '-' : '\setminus',
      \ 'setminus' : '\setminus',
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

" imap dictionary: \...<space> {{{
" Leader 92 = '\'
" Trigger 32 = "\<space>"
let g:imapftl#vitex#dict_92_32 = {
      \ "tex"	      : "\\TeX{} <++>",
      \ "latex"	      : "\\LaTeX{} <++>",
      \ "item"	      : "\\item ",
      \ "boldsymbol"  : "\\boldsymbol ",
      \ "mathbf"      : "\\mathbf ",
      \ "mbf"	      : "\\mathbf ",
      \ "mathbb"      : "\\mathbb ",
      \ "bb"	      : "\\mathbb ",
      \ "mathrm"      : "\\mathrm ",
      \ "rm"	      : "\\mathrm ",
      \ "mathcal"     : "\\mathcal ",
      \ "cal"	      : "\\mathcal ",
      \ "mathscr"     : "\\mathscr ",
      \ "scr"	      : "\\mathscr ",
      \ "a" : '\alpha ',
      \ 'b' : '\beta ',
      \ 'c' : '\varsigma ',
      \ 'd' : '\delta ',
      \ 'e' : '\epsilon ',
      \ 'f' : '\phi ',
      \ 'g' : '\gamma ',
      \ 'h' : '\eta ',
      \ 'i' : '\iota ',
      \ 'j' : '\varepsilon ',
      \ 'k' : '\kappa ',
      \ 'l' : '\lambda ',
      \ 'm' : '\mu ',
      \ 'n' : '\nu ',
      \ 'o' : '\omicron ',
      \ 'p' : '\pi ',
      \ 'q' : '\theta ',
      \ 'r' : '\rho ',
      \ 's' : '\sigma ',
      \ 't' : '\tau ',
      \ 'u' : '\upsilon ',
      \ 'v' : '\varphi ',
      \ 'w' : '\omega ',
      \ 'x' : '\chi ',
      \ 'y' : '\psi ',
      \ 'z' : '\zeta ',
      \ 'D' : '\Delta ',
      \ 'F' : '\Phi ',
      \ 'G' : '\Gamma ',
      \ 'L' : '\Lambda ',
      \ 'P' : '\Pi ',
      \ 'Q' : '\Theta ',
      \ 'S' : '\Sigma ',
      \ 'U' : '\Upsilon ',
      \ 'W' : '\Omega ',
      \ 'Y' : '\Psi ',
      \ '^' : '\hat ',
      \ '_' : '\bar ',
      \ '6' : '\partial ',
      \ '8' : '\infty ',
      \ '-' : '\setminus ',
      \ '/' : '\frac ',
      \ 'frac' : '\frac ',
      \ '@' : '\circ ',
      \ '0' : '^\circ ',
      \ '=' : '\equiv ',
      \ '.' : '\cdot ',
      \ '*' : '\times ',
      \ '2' : '\sqrt ',
      \ '~' : '\tilde ',
      \ 'nonumber' : '\nonumber ',
      \ "square" : '\square ',
      \ "tilde" : '\tilde ',
      \ "hat" : '\hat ',
      \ "bar" : '\bar ',
      \ "widetilde" : '\widetilde ',
      \ "wtilde" : '\widetilde ',
      \ "widehat" : '\widehat ',
      \ "what" : '\widehat ',
      \ "widebar" : '\widebar ',
      \ "wbar" : '\widebar ',
      \ "wedge" : '\wedge ',
      \ 'dot' : '\dot ',
      \ }
" }}}

" }}}

let g:imapftl#vitex#phs = "<+"
let g:imapftl#vitex#phe = "+>"
let g:imapftl#vitex#ph = g:imapftl#vitex#phs.g:imapftl#vitex#phe

function s:bld_macro_cmd(name, paramc = 0, opt_param = v:false)
  let l:macro = "\\".a:name

  if a:opt_param
    let l:macro .= "[".ph."]"
  endif

  let l:cnt = 0
  while l:cnt < a:paramc
    let l:cnt += 1
    let l:macro .= "{".ph."}"
  endwhile
  return l:macro
endfunction

function s:bld_macro_env(name, ins_label = v:false)
  let l:macro = "\\begin{".a:name."}"
  if a:ins_label
    let l:macro .= " \\label{".ph."}"
  endif
  let l:macro .= "\n".ph."\n\\end{".a:name."}\n"
  return "\\begin{".a:name."}\n".ph."\n"
endfunction

function s:get_macro(type, ...)
  if a:type == "env"
    return bld_macro_env(a:000)
  else
    return bld_macro_cmd(a:000)
  endif
endfunction

" vim:ft=vim:fdm=marker
