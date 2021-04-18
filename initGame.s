@ initGame.s
@ This function generates a random number, modulos it with 11, adds 2 to it, and 
 @ then returns it to the calling program.

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global randomNumber
.syntax unified
.type initGame, %function

initGame:
push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r0, #0			@ Stores #0 into r0

	bl	rand			@ Generates random number
