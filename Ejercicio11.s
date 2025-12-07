.data
.align 2
stri: .asciz "el resultado de la funcion es %f\n"
.align 2
num: .float 1.35, 9.0, 2.15, 5.0
ejemplo: .float 5.0
.text
.global main
main:
  ldr r4, =num
  vldr s0, [r4]
  add r4, r4, #4
  vldr s1, [r4]
  add r4, r4, #4
  vldr s2, [r4]
  add r4, r4, #4
  vldr s3, [r4]
  push {lr}
  bl funcion
  pop {lr}
  @s0 resultado de funcion
  @hay que promoverlo, pues printf imprime dobles
  ldr r0, =stri
  vcvt.F64.F32 d0, s0
  vmov r2, r3, d0

	bl printf
  bx lr
	
funcion:
  @ s0, s1, s2, s3 argumentos
  vmul.f32 s0, s0, s3 @ s0 = s0*s3
  vmul.f32 s1, s1, s2 @ s1 = s1*s2
  vsub.f32 s0, s0, s1 @s0 = s0*s3 - s1*s2
  bx lr

.section .note.GNU-stack
