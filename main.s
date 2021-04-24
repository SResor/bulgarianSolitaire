@ Main.s
@ This program simulates the game of Bulgarian Solitaire with a 45 card deck.

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

	sub	sp, sp, #8		@ Moves the stack pointer down two memory addresses
	mov	r9, sp			@ Moves the address of the pile counter into r9

	mov	r0, #45			@ Moves the size of the array (45) + 2 into r0
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
	
	mov	r8, #0			@ Moves 0 into r8. This is a sentinel value for our main loop
	bl	initGame		@ Branches to initGame.s
	bl	printPiles		@ Branches to printPiles.s to print the number of cards in each pile
	
loop1:
	cmp	r8, #1			@ Compares sentinel value (r8) to 1
	beq	outloop1		@ If they are equal, exits the loop
	
	bl	playRound		@ Branches to playRound.s
	bl	checkPiles		@ Branches to checkPiles.s
	bl	printPiles		@ Branches to printPiles.s
	bl	finalConfig		@ Branches to finalConfig.s
	bl	loop1			@ Branches back to the start of the loop
	
outloop1:
	bl	printPiles		@ Branches to printPiles.s, which prints the final configuration
	
	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
