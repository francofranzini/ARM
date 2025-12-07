.data
etiqueta: .asciz " %d\n"
.text
.global main
main:
	push {lr} @ Se preserva el valor de LR (direcci´on de retorno de main)
	mov r2, #6
	mov r1, #5
	mov r0, #4
	bl campesino_ruso
	pop {lr} @ Se restaura el valor de LR
	bx lr @ Retornan
campesino_ruso:
	sub sp, sp, #16
	str r0, [sp, #12] @ i
	str r1, [sp, #8] @ j
	mov r3, #0 @ res
	mov r4, #2
	
	ldr r1, [sp,#12]
	ldr r2, [sp, #8]
	
	
	cmp r2, #1
	bls fin
	
	mayor:
		cmp r2, #1
		bls fin
		
		ands r5, r2, #1
		@ r1 & r2 = 0
		lsleq r1, r1, #1
		lsreq r2, r2, #1
		
		beq mayor
		@ r1 & r2 != 0
		add r3, r3, r1
		sub r2, r2, #1
		b mayor
		
	fin:
		mov r0, r3 @ r0 = res
		add r0, r0, r1 @ + i
		add sp, sp, #16
		bx lr
	
	
	
	



	