# .login - csh login script, read by login shell, after `.cshrc' at login.

if ( $OSTYPE == 'OpenBSD' ) then
  if ( ! $?TERMCAP ) then
    tset -IQ '-munknown:?vt220' $TERM
  endif

  stty newcrt crterase
endif

# Query terminal size; useful for serial lines.
if ( -x /usr/bin/resizewin ) /usr/bin/resizewin -z

setenv	BLOCKSIZE	k
setenv	EDITOR	vi
setenv	EXINIT	'set showmatch showmode report=2 noeb'
setenv	PAGER	more

# Display a random cookie on each login.
if ( -x /usr/bin/fortune ) then
  # FreeBSD
  /usr/bin/fortune freebsd-tips
else if ( -x /usr/games/fortune ) then
  # OpenBSD
  /usr/games/fortune
endif
