segment	.data
	msg					db		"Hello World!", 0x0a
	msglen				equ		$ - msg

segment	.text
	global entrypoint
	entrypoint:
		push dword	msglen					; message length.
		push dword	msg						; message.
		push dword	0x01					; stdout.
		sub			esp, 0x04				; 16 byte align the stack!
		mov			eax, 0x04				; sys_write
		int			0x80					; syscall!

		add			esp, 0x0f				; Clean the stack!  (pushed 3 aruments *  4 bytes each, plus the alignment count).

	exit:
		push dword 	0x00					; exit code.
		mov			eax, 0x01				; sys_exit
		int			0x80					; syscall!
