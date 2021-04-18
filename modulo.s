@ modulo.s
@ This function computes the modulo of the two numbers passed to it.

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global modulo
.syntax unified
.type modulo, %function

modulo:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add	fp, sp, #4		@ Moves up one memory location from sp and stores it in fp

	udiv	r2, r0, r1		@ Divides r0 by r1 and stores it in r2
	mul	r2, r1, r2		@ Multiplies r2 by r1 and stores it in r2
	sub	r0, r0, r2		@ Subtracts r2 from r0 and stores it in r0

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
