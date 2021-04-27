@ playRound.s
@ This function executes one round of the Bulgarian Solitaire game
 @ It does this by removing one card from each of the piles and creates
 @ a new pile with those cards.
 
.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global playRound
.syntax unified
.type playRound, %function

playRound:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
	mov	r4, #0			@ Moves 0 into r4
	mov	r5, #0			@ Moves 0 into r5
	ldr	r6, [r9]		@ Loads the number of card piles into r6
	mov	r7, #0			@ Moves 0 into r7
	
loop1:
	cmp	r4, r6			@ Compares r4 and r6
	bge	outloop1		@ If r4 is greater than or equal to r6, exits loop
	ldr	r5, [r10, r7]		@ Loads the number stored in the relevant array index address into r5
	sub	r5, r5, #1		@ Decrements the value in r5 by 1
	str	r5, [r10, r7]		@ Stores the new value in r5 into the same array index address
	add	r4, r4, #1		@ Increments r4 by 1
	add	r7, r7, #4		@ Increments r7 by 4
	bl	loop1			@ Branches back to loop1
	
outloop1:
	str	r4, [r10, r7]		@ Stores the value in r4 into the index at the end of the array
	ldr	r6, [r9]		@ Loads the number of piles counter into r6
	add	r6, r6, #1		@ Increments the number of piles by 1
	str	r6, [r9]		@ Stores the new value in r6 into the address that holds the number of piles
	
	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
