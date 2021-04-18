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
