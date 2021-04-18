@ Main.s
@ 

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global main
.syntax unified
.type main, %function

main:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r0, #47			@ Moves the size of the array (45) + 2 into r0
	mov	r0, r0, LSL #2		@ Multiplies r0 by 4 and moves that into r0
					 @ This is the amount of memory needed
	sub	sp, sp, r0		@ Moves the stack pointer to point to the start of the array
	mov	r10, sp			@ Moves the stack pointer address into r10
	str	sp, [fp, #-8]		@ Stores the stack pointer address into the first available memory address
  	mov	r0, #0			@ Moves #0 into r0. This is the current number of piles
	str	r0, [fp, #-12]		@ Stores array size into second available memory address	
	ldr	r1, [fp, #-12]		@ Loads the number of piles into r1
	
	bl	time			@ Gets time from clock
	bl	srand			@ Sets seed for srand
