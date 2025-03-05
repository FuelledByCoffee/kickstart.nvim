syntax match qfLineNr  "[^|]*"   contained contains=qfError,qfWarning,qfInfo
syntax match qfError   "error"   contained
syntax match qfWarning "warning" contained
syntax match qfInfo    "note"    contained

hi! default link qfError   Error
hi! default link qfWarning Warning
hi! default link qfInfo    Info
