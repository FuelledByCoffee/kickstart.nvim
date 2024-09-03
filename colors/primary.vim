" Maintainer: Johannes Eckhoff <j.eckhoff@gmail.com

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='primary'

if !exists("syntax_cmd") || syntax_cmd == "on"
  " ":syntax on" Set's all colors and links
  command -nargs=* SynColor hi <args>
  command -nargs=* SynLink hi! link <args>
else
  if syntax_cmd == "enable"
    " ":syntax enable" keeps any existing colors
    command -nargs=* SynColor hi def <args>
    command -nargs=* SynLink hi def link <args>
  elseif syntax_cmd == "reset"
    " ":syntax reset" resets all colors to the default
    command -nargs=* SynColor hi <args>
    command -nargs=* SynLink hi! link <args>
  else
    " User defined syncolor file has already set the colors.
    finish
  endif
endif

": Links {{{
" SynLink String      Constant
SynLink Number      Constant
SynLink Conditional Keyword
SynLink Repeat      Keyword
SynLink Parameter   Variable
SynLink Method      Function
SynLink Label       Statement
SynLink Title       Identifier

SynLink Include           PreProc
SynLink Define            PreProc
SynLink Bracket           Parens
SynLink readlineVariable  Variable

SynLink @operator         Operator
SynLink @type             Type
SynLink @type.builtin     Special
SynLink @string           String
SynLink @diff.plus        diffAdded
SynLink @diff.minus       diffDelete
SynLink @markup.link      Macro
SynLink @keyword          Keyword
" SynLink @keyword(105)     specialcomment
SynLink @keyword.import   PreProc
SynLink @keyword.directive.define PreProc
SynLink @keyword.directive Macro
SynLink @variable         Variable
SynLink @attribute        Constant
SynLink @comment          Comment

SynLink BashTSFunction Keyword

SynLink vimCommand   statement
SynLink VimMap       Statement
SynLink vimString    String
SynLink VimUsrCmd    PreProc
SynLink vimFunc      Function
SynLink VimFuncName  Function
SynLink VimFtOption  Constant
SynLink VimMapModKey Identifier
SynLink VimIsCommand Variable
SynLink vimOption    Constant
SynLink vimVar       Variable

SynLink zshFunction    Function
SynLink zshBrackets    Bracket
SynLink zshRedir       Operator
SynLink zshVariableDef Variable

SynLink makeTarget Function
": }}}

SynColor @string.special.url          guifg=#ad13f9 ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE

" SynColor NormalFloat                  guifg=#dddddd ctermfg=NONE  guibg=NONE

SynColor Normal                       guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Variable                     guifg=#86d700 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=Bold
SynColor Function                     guifg=#f58720 ctermfg=4     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Keyword                      guifg=#fcd000 ctermfg=3     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor PreProc                      guifg=#c22add ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Special                      guifg=#f21d27 ctermfg=1     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Type                         guifg=#2f7dff ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Parens                       guifg=#f23d17 ctermfg=1     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Comment                      guifg=#b0b0b0 ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Constant                     guifg=#17d9c9 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Quote                        guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Character                    guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Boolean                      guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Float                        guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor String                       guifg=#ffdd00 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Identifier                   guifg=#42bdf7 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Statement                    guifg=#ffc026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
" SynColor Repeat                       guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Operator                     guifg=#ffdd00 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Exception                    guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Macro                        guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor PreCondit                    guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StorageClass                 guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Structure                    guifg=#429df7 ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Typedef                      guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor SpecialComment               guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Error                        guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=bold,reverse cterm=bold,reverse
SynColor Todo                         guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=bold,italic  cterm=bold,italic
SynColor Underlined                   gui=underline cterm=underline
SynColor Cursor                       guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=reverse      cterm=reverse
SynColor ColorColumn                  guifg=NONE    ctermfg=NONE  guibg=#2c323c ctermbg=236  gui=NONE         cterm=NONE
SynColor CursorLineNr                 guifg=#cccccc ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor SignColumn                   guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Conceal                      guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CursorColumn                 guifg=NONE    ctermfg=NONE  guibg=#2c323c ctermbg=236  gui=NONE         cterm=NONE
SynColor CursorLine                   guifg=NONE    ctermfg=NONE  guibg=#2c323c ctermbg=236  gui=NONE         cterm=NONE
SynColor Directory                    guifg=#429df7 ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor ErrorMsg                     guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor VertSplit                    guifg=#000000 ctermfg=black guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Folded                       guifg=#1e1e1e ctermfg=234   guibg=#707070 ctermbg=242  gui=NONE         cterm=NONE
SynColor FoldColumn                   guifg=#1e1e1e ctermfg=234   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor IncSearch                    guifg=#ffdd00 ctermfg=220   guibg=#6272a4 ctermbg=61   gui=NONE         cterm=NONE
SynColor LineNr                       guifg=#707070 ctermfg=242   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor MatchParen                   guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=underline    cterm=underline
SynColor NonText                      guifg=#3b4048 ctermfg=238   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor Pmenu                        guifg=#f3f3f3 ctermfg=255   guibg=#282c34 ctermbg=236  gui=NONE         cterm=NONE
SynColor PmenuSel                     guifg=#1e1e1e ctermfg=234   guibg=#bbbbbb ctermbg=214  gui=NONE         cterm=NONE
SynColor PmenuSbar                    guifg=NONE    ctermfg=NONE  guibg=#3b4048 ctermbg=238  gui=NONE         cterm=NONE
SynColor PmenuThumb                   guifg=NONE    ctermfg=NONE  guibg=#f3f3f3 ctermbg=255  gui=NONE         cterm=NONE
SynColor Question                     guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor QuickFixLine                 guifg=#1e1e1e ctermfg=234   guibg=#ffdd00 ctermbg=220  gui=NONE         cterm=NONE
SynColor Search                       guifg=#1e1e1e ctermfg=234   guibg=#ffdd00 ctermbg=220  gui=NONE         cterm=NONE
SynColor SpecialKey                   guifg=#3b4048 ctermfg=238   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor SpellBad                     guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=underline    cterm=underline
SynColor SpellCap                     guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor SpellLocal                   guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor SpellRare                    guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StatusLine                   guifg=#f3f3f3 ctermfg=255   guibg=#2c323c ctermbg=236  gui=NONE         cterm=NONE
SynColor StatusLineNC                 guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StatusLineTerm               guifg=#f3f3f3 ctermfg=255   guibg=#2c323c ctermbg=236  gui=NONE         cterm=NONE
SynColor StatusLineTermNC             guifg=#2c323c ctermfg=236   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TabLine                      guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TabLineSel                   guifg=#f3f3f3 ctermfg=255   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TabLineFill                  guifg=NONE    ctermfg=NONE  guibg=#202020 ctermbg=234  gui=NONE         cterm=NONE
SynColor Terminal                     guifg=#f3f3f3 ctermfg=255   guibg=#1e1e1e ctermbg=234  gui=NONE         cterm=NONE
SynColor Visual                       guifg=#1e1e1e ctermfg=234   guibg=#bbbbbb ctermbg=214  gui=NONE         cterm=NONE
SynColor VisualNOS                    guifg=#3e4452 ctermfg=238   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WarningMsg                   guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WildMenu                     guifg=#1e1e1e ctermfg=234   guibg=#3bffff ctermbg=87   gui=NONE         cterm=NONE
SynColor EndOfBuffer                  guifg=#1e1e1e ctermfg=234   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSError                      guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSPunctDelimiter             guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSPunctSpecial               guifg=#5050ff ctermfg=63    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSConstBuiltin               guifg=#3ac8c5 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor @string.regex                guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor @string.escape               guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSCharacter                  guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSBoolean                    guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSFloat                      guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSAnnotation                 guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSAttribute                  guifg=#3ac8c5 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSNamespace                  guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSFuncMacro                  guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSParameterReference         guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSField                      guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSProperty                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSConstructor                guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSKeywordFunction            guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSException                  guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSText                       guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSStrong                     guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSEmphasis                   guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSUnderline                  guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSLiteral                    guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSURI                        guifg=#ffff00 ctermfg=226   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSTag                        guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor TSTagDelimiter               guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor vimMapRhs                    guifg=#dd5fdd ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor vimBracket                   guifg=#707070 ctermfg=242   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor vimEnvvar                    guifg=#3ac8c5 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor vimParenSep                  guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor LspDiagnosticsSignWarning    guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE

" Git
" Git config
SynColor gitconfigVariable            guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor gitconfigSection             guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor gitconfigAssignment          guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor gitconfigDelim               guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE

" Git commit
SynColor gitcommitFirstLine           guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor gitcommitSummary             guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE

" Git diff
SynColor diffIndexLine                guifg=#3ac8c5 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffSubNmae                  guifg=#429df7 ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffFile                     guifg=#3b4048 ctermfg=238   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffOldFile                  guifg=#70ef2b ctermfg=29    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffNewFile                  guifg=#da4040 ctermfg=238   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffAdd                      guifg=#87d700 ctermfg=2     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffChange                   guifg=#fde026 ctermfg=3     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffDelete                   guifg=#fc2525 ctermfg=1     guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffText                     guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffAdded                    guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffRemoved                  guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor diffFileId                   guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=bold,reverse cterm=bold,reverse

SynColor makeCommands                 guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeSpecial                  guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeIdent                    guifg=#429df7 ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeStatement                guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeDString                  guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeSString                  guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor makeSpecTarget               guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor readlineKeyword              guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor sqlFold                      guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor sqlStatement                 guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor sqlString                    guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor sqlComment                   guifg=#3ac8c5 ctermfg=80    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor plug1                        guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor plug2                        guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor plugName                     guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlArg                      guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlBold                     guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor htmlEndTag                   guifg=#f3f3f3 ctermfg=255   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH1                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH2                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH3                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH4                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH5                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlH6                       guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlItalic                   guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=italic       cterm=italic
SynColor htmlLink                     guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=underline    cterm=underline
SynColor htmlSpecialChar              guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlSpecialTagName           guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlTag                      guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlTagN                     guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlTagName                  guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor htmlTitle                    guifg=#f3f3f3 ctermfg=255   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownBlockquote           guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=italic       cterm=italic
SynColor markdownBold                 guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownCode                 guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownCodeBlock            guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownCodeDelimiter        guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownH1                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownH2                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownH3                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownH4                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownH5                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownH6                   guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor markdownHeadingDelimiter     guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownHeadingRule          guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownId                   guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownIdDeclaration        guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownIdDelimiter          guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownItalic               guifg=#ffdd00 ctermfg=220   guibg=NONE    ctermbg=NONE gui=italic       cterm=italic
SynColor markdownLinkDelimiter        guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownLinkText             guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownListMarker           guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownOrderedListMarker    guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownRule                 guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor markdownUrl                  guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=underline    cterm=underline
SynColor CocExplorerIndentLine        guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerBufferRoot        guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerFileRoot          guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerBufferFullPath    guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerFileFullPath      guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerBufferReadonly    guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerBufferModified    guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerBufferNameVisible guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerFileReadonly      guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerFileModified      guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerFileHidden        guifg=#6272a4 ctermfg=61    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor CocExplorerHelpLine          guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor EasyMotionTarget             guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor EasyMotionTarget2First       guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor EasyMotionTarget2Second      guifg=#c91b00 ctermfg=160   guibg=NONE    ctermbg=NONE gui=bold         cterm=bold
SynColor EasyMotionShade              guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyNumber               guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifySelect               guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyBracket              guifg=#429df7 ctermfg=75    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifySpecial              guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyVar                  guifg=#ff1dce ctermfg=200   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyPath                 guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyFile                 guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifySlash                guifg=#d8d8d2 ctermfg=188   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyHeader               guifg=#ffa026 ctermfg=214   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifySection              guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor StartifyFooter               guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WhichKey                     guifg=#ad13f9 ctermfg=129   guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WhichKeySeperator            guifg=#50ef2b ctermfg=82    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WhichKeyGroup                guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor WhichKeyDesc                 guifg=#3bffff ctermfg=87    guibg=NONE    ctermbg=NONE gui=NONE         cterm=NONE
SynColor debugPc                      guifg=NONE    ctermfg=NONE  guibg=#3bffff ctermbg=87   gui=NONE         cterm=NONE
SynColor debugBreakpoint              guifg=#ff2525 ctermfg=196   guibg=NONE    ctermbg=NONE gui=reverse      cterm=reverse

delcommand SynColor
delcommand SynLink

" vim: nowrap ts=2 sw=2 foldlevel=99
