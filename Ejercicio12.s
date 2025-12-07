.data
arr1: .byte 1, 2, 3, 4
arr2: .byte 2, 3, 4, 5
stra: .asciz "La suma es: %d\n"
.text
.global main

main:
	ldr r0, =arr1 @ A
	ldr r1, =arr2 @ B
	mov r2, #4    @ L
	bl suma
	mov r1, r0
	ldr r0, =stra
	bl printf
	
	bx lr

suma:
	mov r3, #0 @ i
	mov r4, #0

	cmp r3, r2
	beq fin
	
	bucle:
		cmp r3, r2
		beq fin

		ldrb r5, [r0], #1
		add r4, r4, r5
		ldrb r5, [r1], #1
		add r4, r4, r5
		
		add r3, r3, #1
		b bucle
	
fin:
	mov r0, r4
	bx lr

.section .note.GNU-stack
