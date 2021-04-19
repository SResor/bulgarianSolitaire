@ finalConfig.s
@ This function checks whether any of the piles have no cards left and
 @ condenses the array accordingly so all piles are in contiguous memory addresses

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global checkPiles
.syntax unified
.type finalConfig, %function

finalConfig:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
  
