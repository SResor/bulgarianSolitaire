@ printPiles.s
@ This function prints the number of cards in each of the piles

.cpu cortex-a53
.fpu neon-fp-armv8

.data
	finalConfig:	.asciz "\nThe final configuration of the piles is:\n"
	notFinal: 	.asciz "\nThe piles are:\n"
	pile: 		.asciz "%d, "
	lastPile:	.asciz "%d\n"

.text
.align 2
.global printPiles
.syntax unified
.type printPiles, %function

printPiles:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
	mov	r4, #1			@ Moves 1 into r4
	mov	r5, #0			@ Moves 0 into r5
	ldr	r6, [r9]		@ Loads the number of card piles into r6
	
	cmp	r8, #1			@ Checks whether sentinel value has been triggered
	bne	notFinalConfig		@ If it hasn't, jumps past final configuration message
	ldr	r0, =finalConfig	@ If it has, loads final configuration header into r0
	bl	printf			@ Branches to printf
	bl	finalConfigFound	@ Jumps past non-final configration message
	
notFinalConfig:
	ldr	r0, =notFinal		@ Loads the output message into r0
	bl	printf			@ Branches to printf

finalConfigFound:

loop1:
	ldr	r0, =pile		@ Loads the pile message into r0
	cmp	r4, r6			@ Compares r4 and r6
	bge	outloop1		@ If r4 is greater than or equal to r6, exits the loop
	ldr	r1, [r10, r5]		@ Loads the number stored in the relevant array index address into r1
	bl	printf			@ Branches to printf
	
	add	r4, r4, #1		@ Increments r4 by 1
	add	r5, r5, #4		@ Increments r5 by 4
	bl	loop1			@ Returns to the start of the loop
	
outloop1:
	ldr	r0, =lastPile		@ Loads last pile message into r0
	ldr	r1, [r10, r5]		@ Loads index value into r1
	bl	printf			@ Branches to printf

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
