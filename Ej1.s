.data
str: .word 0x0000, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888, 0x9999

.text
.global main
main:
  mov r1, #1
  ldr r3, =str
  ldr r0, [r3, #28] @ r0 = str[7]
  add r0, r0, r1 @ r0 = str[7] + y

  add r3, #36 @r3 = str[9]
  ldr r2, [r3, #-8] @r2 = str[7]
  add r2, r1 @r2 = str[7] + y
  str r2, [r3] @str[10] = str[7] + y

  


  svc #0

.section .note.GNU-stack
