.data
.align 2
stri: .asciz "el resultado de la funcion es %f\n"
.align 2
str2: .asciz "%f\n"
.align 2
a: .float 1.0, 2.0, 3.0, 4.0, 5.0
.align 2
b: .float 2.0, 4.0, 6.0, 8.0, 10.0
.align 2
c: .float 0.0, 0.0, 0.0, 0.0, 0.0

.text
.global main
main:
  push {lr}
  @ s2 = suma
  mov r1, #0
  vmov s2, r1
  
  ldr r2, =a
  ldr r3, =b
  ldr r4, =c
  bucle:
    cmp r1, #5
    beq fin

    @s1 c[i]
    mov r0, #0
    vmov s1, r0

    @sumo a[i]
    vldr.32 s0, [r2]
    add r2, #4
    vadd.f32 s1, s1, s0

    @sumo b[i]
    vldr.32 s0, [r3]
    add r3, #4
    vadd.f32 s1, s1, s0


    @guardo en c[i]
    vstr.32 s1, [r4]
    add r4, #4
    @actualizo suma
    vadd.f32 s2, s2, s1

    @preparamos printf
    push {r0 - r4, lr}
    vpush {s0-s2}

    mov r3, #0
    mov r4, #0
    ldr r0, =str2
    vcvt.f64.f32 d0, s1
    vmov r2, r3, d0
    bl printf
    vpop {s0-s2}
    pop {r0-r4, lr}


    add r1, r1, #1
    b bucle
  fin:
    @ suma esta en s2
    ldr r0, =stri
    mov r1, #0
    vmov s0, r1
    vmov s1, r1
    vcvt.f64.f32 d0, s2
    vmov r2, r3, d0
    
    push {lr}
    bl printf
    pop {lr}
    pop {lr}
    bx lr
  

.section .note.GNU-stack
