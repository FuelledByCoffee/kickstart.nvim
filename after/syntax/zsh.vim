
syntax match zshBrackets    display '[\[\]]'
syntax match zshParenthesis display '[()]'
syntax match zshBraces      display '[{}]'
syntax match flag           display ' --\?\S\+'
syntax match path           display '/\@<=\.\?\(\w*\|\\ *\)*'
syntax match path           display '\(\~\)/\@='

"let zshOperatorList  = '[-&|+<>=*/!~]'    " A list of symbols that we don't want to immediately precede the operator
"let zshOperatorList .= '\@<!'             " Negative look-behind (check that the preceding symbols aren't there)
"let zshOperatorList .= '\%('              " Beginning of a list of possible operators
"let zshOperatorList .=     '\('           " First option, the following symbols...
"let zshOperatorList .=        '[&|+<>=]'
"let zshOperatorList .=     '\)'
"let zshOperatorList .=     '\1\?'         " Followed by (optionally) the exact same symbol, so -, --, =, ==, &, && etc
"let zshOperatorList .= '\|'               " Next option:
"let zshOperatorList .=     '->'           " Pointer dereference operator
"let zshOperatorList .= '\|'               " Next option:
"let zshOperatorList .=     '[-+*/%&|^!]=' " One of the listed symbols followed by an =, e.g. +=, -=, &= etc
"let zshOperatorList .= '\|'               " Next option:
"let zshOperatorList .=     '[*?,!~%^]'    " Some simple single character operators
"let zshOperatorList .= '\|'               " Next option:
"let zshOperatorList .=     '\.\s'         " Dot operator
"let zshOperatorList .= '\|'               " Next option:
"let zshOperatorList .=     '\('           " One of the shift characters:
"let zshOperatorList .=         '[<>]'
"let zshOperatorList .=     '\)'
"let zshOperatorList .=     '\2\?'         " Optionally followed by another identical character, so << or >>...
"let zshOperatorList .=     '='            " Followed by =, so <<= or >>=.
"let zshOperatorList .= '\)'               " End of the long list of options
"let zshOperatorList .= '[-+/*&|^~<>=!]'   " The list of symbols that we don't want to follow
"let zshOperatorList .= '\@!'              " Negative look-ahead (this and the \@<! prevent === etc from matching)
"
"exe "syn match zshOperator display '" . zshOperatorList . "'"

syn match zshOperator display ';'

hi! def link zshParenthesis     Paren
hi! def link zshBrackets        Paren
hi! def link zshBraces          Paren
hi! def link zshVariableDef     Variable
hi! def link zshKshFunction     Function
hi! def link zshFunction        Function
hi! def link zshStringDelimiter String
hi! def link zshOperator        Operator

hi! def path guifg=darkblue
hi! def flag guifg=darkcyan
