@ checkPiles.s
@ This function checks whether any of the piles have no cards left and
 @ condenses the array accordingly so all piles are in contiguous memory addresses

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global checkPiles
.syntax unified
.type checkPiles, %function

checkPiles:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
	mov	r4, #0			@ Moves #0 into r4 (our iterator)
	ldr	r6, [r9]		@ Moves the number of piles into r6
	
while:
	cmp	r4, r6			@ Compares the iterator (r4) to the numbers of piles
	bge	endWhile
	
	mov	r5, r4, LSL #2		@ Moves proper array address offset into r5
	ldr	r3, [r10, r5]		@ Moves the array index value into r3
	
	cmp	r3, #0			@ Compares r3 to #0
	bne	skipSwap		@ If they're not equal, skips the swapping code
	sub	r6, r6, #1		@ Decrements the number of piles by 1
	mov	r3, r6, LSL #2		@ Moves the address of the last array index into r3
	ldr	r3, [r10, r3]		@ Moves the value held in the last array index into r3
	str	r3, [r10, r5]		@ Replaces the zero in the array with the value in r3
	
skipSwap:
	add	r4, r4, #1		@ Increments the iterator (r4) by one
	bl	while			@ Branches back to while
	
endWhile:
	cmp	r4, r6			@ Compares the iterator (r4) to the number of piles (r6)
	bne	doneRemoveZero		@ If they're not equal, skips code
	
	mov	r5, r4, LSL #2		@ Stores the address of the array index into r5
	ldr	r5, [r10, r5]		@ Stores the value at the proper array index into r5
	cmp	r5, #0			@ Compares the value in r5 to #0
	bne	doneRemoveZero
	
	sub	r6, r6, #1		@ Decrements r6 by 1
	
doneRemoveZero:
	str	r6, [r9]		@ Stores the number of piles into the address in r9
	
	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
