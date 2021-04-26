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
	
	mov	r4, #0			@ Moves 0 into r4, our iterator register
	mov	r5, #0			@ Moves 0 into r5, our iterator address location register
	ldr	r6, [r9]		@ Loads the number of card piles into r6
	mov	r7, r6, LSL #2		@ Moves r6 * 4 into r7, the address where the last array index is stored
	mov	r2, #0			@ Moves 0 into r2
	
loop1:
	cmp	r4, r6			@ Compares r4 to number of piles
	bge	outloop1		@ If r4 is greater than or equal to number of piles, exit loop
	
	ldr	r0, [r10, r5]		@ Loads the number stored in the relevant array index address into r0
	cmp	r0, #0			@ Compares r0 to 0
	bne	outloop2		@ If they are not equal, exits the loop
	ldr	r1, [r10, r7]		@ Loads the value at the end of the array into r1
	str	r2, [r10, r7]		@ Places the value in r2 at the end of the array
	str	r1, [r10, r5]		@ Stores the value in r1 into the array index address being considered
	add	r4, r4, #1		@ Increments r4 by 1, our iterator
	add	r5, r5, #4		@ Increments r4 by 4, our iterator address location register
	sub	r6, r6, #1		@ Decrements r6 by 1, the number of card piles
	sub	r7, r7, #4		@ Decrements r7 by 4, the address where the last array index is stored
	
	outloop2:
	bl	loop1			@ Branches back to the start of the loop
	
outloop1:
	str	r6, [r9]		@ Stores the value in r6 into the address in r9
	
	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
