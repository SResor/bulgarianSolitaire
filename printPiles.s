@ printPiles.s
@ This function prints the number of cards in each of the piles

.cpu cortex-a53
.fpu neon-fp-armv8

.data
	output: .asciz "\nThe piles are:\n"
	pile: 	.asciz "%d, "

.text
.align 2
.global printPiles
.syntax unified
.type printPiles, %function

printPiles:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
	mov	r4, #0			@ Moves 0 into r4
	mov	r5, #0			@ Moves 0 into r5
	ldr	r6, [r9]		@ Loads the number of card piles into r6
	ldr	r0, =output		@ Loads the output message into r0
	bl	printf			@ Branches to printf
	ldr	r0, =pile		@ Loads the pile message into r0
	
loop1:
	cmp	r4, r6			@ Compares r4 and r6
	bge	outloop1		@ If r4 is greater than or equal to r6, exits the loop
	ldr	r1, [r10, r5]		@ Loads the number stored in the relevant array index address into r1
	bl	printf			@ Branches to printf
	
	add	r4, r4, #1		@ Increments r4 by 1
	add	r5, r5, #4		@ Increments r5 by 4
	bl	loop1			@ Returns to the start of the loop
	
outloop1:
	ldr	r0, =newline		@ Loads a newline into r0 for ease of reading
	bl	printf			@ Branches to printf

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
	
