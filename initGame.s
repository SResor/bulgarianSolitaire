@ initGame.s
@ This function initializes the game of Bulgarian Solitaire by dividing the
 @ deck of 45 cards into separate piles

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global initGame
.syntax unified
.type initGame, %function

initGame:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

	mov	r4, #0			@ Moves #0 into r4
	mov	r5, #0			@ Moves #0 into r5
	mov	r7, #45			@ Moves #45 into r7

loop1:
	cmp	r4, r7			@ Compares the value stored in r4 to 45
	bge	outloop1		@ If r4 is greater than or equal to 45, exits loop
	mov	r0, #0			@ Stores #0 into r0
	bl	rand			@ Generates random number
	sub	r1, r7, r4		@ Subtracts r4 from 45 and moves it into r1
	bl	modulo			@ Calls the modulo.s function
	
	add	r0, r0, #1		@ Adds 1 to the number returned by modulo.s
	add	r4, r4, r0		@ Adds randomly generated number to r4 and stores it in r4
	str	r0, [r10, r5]		@ Stores the number returned by modulo.s into the approriate array address
	ldr	r6, [r9]		@ Loads the number of piles counter into r6
	add	r6, r6, #1		@ Increments the number of piles by 1
	str	r6, [r9]		@ Stores the new value in r6 into the address that holds the number of piles
	add	r5, r5, #4		@ Adds 4 into r5 and moves it back into r5
	bl	loop1			@ Branches back to loop1
	
outloop1:
	str	r6, [r9]		@ Stores the number of piles into the address in r9

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
