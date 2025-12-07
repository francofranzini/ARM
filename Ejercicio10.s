.data
stri: .asciz "el resultado de la funcion es %d\n"
.text
.global main
main:
	mov r0, #5
	bl funcion
	mov r1, r0
	ldr r0, =stri
	bl printf
	
funcion:
	@r0 tiene i, tenemos que retornar 2^i
	mov r1, #1
	bucle:
		cmp r0, #0
		beq fin
		
		mov r1, r1, LSL #1
    sub r0, #1
		b bucle
	fin:
		mov r0, r1
		bx lr
.section .note.GNU-stack
