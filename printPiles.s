@ printPiles.s
@ This function prints the number of cards in each of the piles

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global printPiles
.syntax unified
.type printPiles, %function

printPiles:
push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
