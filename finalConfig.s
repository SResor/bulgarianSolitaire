@ finalConfig.s
@ This function checks whether any of the piles have no cards left and
 @ condenses the array accordingly so all piles are in contiguous memory addresses

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global finalConfig
.syntax unified
.type finalConfig, %function

finalConfig:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp
	
  	ldr	r6, [r9]		@ Loads the number of card piles into r6
	cmp	r6, #9			@ Compares the value in r6 to 9
	bne	nextRound		@ If they are not equal, leave sentinel value as is
	
	mov	r0, #0			@ Moves #0 into r0
	mov	r2, #9			@ Moves #9 into r2
	mov	r7, #8			@ Moves #8 into r7
	
loop1:
	sub	r2, r6, r7		@ Subtracts value in r7 from r6 and stores it in r2
	mov	r1, r0, LSL #2		@ Moves address location offset into r1
	ldr	r4, [r10, r1]		@ Loads value in array into r4

	loop2:
		cmp	r2, #9		@ Compares r2 to #9
		bge	exitLoop2	@ If r2 is greater than or equal to 9, exit secondary loop
		
		mov	r3, r2, LSL #2	@ Moves address location offset into r3
		ldr	r5, [r10, r3]	@ Loads second value in array into r5
		
		cmp	r4, r5		@ Compares the two values
		beq	nextRound	@ If they're equal, moves on to the next round
		
		add	r2, r2, #1	@ Increments r2 by 1
		bl	loop2		@ Returns to start of secondary loop
		
exitLoop2:
	add	r0, r0, #1		@ Increments r0 by 1
	sub	r7, r7, #1		@ Decrements r7 by 1
	
	cmp	r0, #9			@ Compares the value in r0 to #9
	bge	finalConfigFound	@ If r0 is greater than or equal to #9, exit loop and set sentinel value
	bl	loop1			@ Returns to the start of the primary loop
	
finalConfigFound:
	mov	r8, #1			@ Changes sentinel value to exit the loop in main.s

nextRound:

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
