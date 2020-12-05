fun! SendPing() abort
	let channel = ch_open("localhost:8785", {"timeout": 0})
	call ch_evalexpr(channel, expand("%:p"))
	call ch_close(channel)
endfun

au BufWritePost *.py :silent! call SendPing()

let pyconnectpath = expand('<sfile>:p:h')
echoerr pyconnectpath

if empty($PYCONNECT_TERM)
	let pyconnectterm = "gnome-terminal --"
else
	let pyconnectterm = $PYCONNECT_TERM
endif

silent execute "!source" g:pyconnectpath . "/venv/bin/activate &&" g:pyconnectterm "python" g:pyconnectpath . "/pyconnect.py"
redraw!
