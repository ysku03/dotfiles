# .cshrc - csh resource script, read at beginning of execution by each shell

alias	df	df -k
alias	du	du -k
alias	h	'history -r | more'
alias	j	jobs -l
alias	la	ls -a
alias	lf	ls -A
alias	ll	ls -lA
alias	ls	ls -F

set path = (/{,s}bin /usr/{{,s}bin,games,X11R6/bin,local/{,s}bin} $HOME/bin)

if ( $?prompt ) then
  # An interactive shell -- set some stuff up
  set filec
  set history = 1000
  set savehist = (1000 merge)
  set mail = (/var/mail/$USER)
  if ( $?tcsh ) then
    set autoexpand
    set autolist = ambiguous
    set autorehash
    set prompt = "%n@%m($OSTYPE):%~ %# "
    set promptchars = "%#"
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  else
    set prompt = "`whoami`@`hotname -s`% "
  endif
  umask 022
endif
