fun! SendPing() abort
	let channel = ch_open("localhost:8785", {"timeout": 0})
	call ch_evalexpr(channel, expand("%:p"))
	call ch_close(channel)
endfun

au BufWritePost *.py :silent! call SendPing()

let pyconnectpath = "/home/dillon/Desktop/pyconnect"

silent execute "!source" g:pyconnectpath . "/venv2/bin/activate && gnome-terminal -- python" g:pyconnectpath . "/pyconnect.py"
redraw!
