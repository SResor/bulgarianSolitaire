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
	
	ldr	r0, [r10]		@ Loads the first array index value into r0
	ldr	r1, [r10, #4]		@ Loads the second array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #8]		@ Loads the third array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #12]		@ Loads the fourth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #16]		@ Loads the fifth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #20]		@ Loads the sixth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #4]		@ Loads the second array index value into r0
	ldr	r1, [r10, #8]		@ Loads the third array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #12]		@ Loads the fourth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #16]		@ Loads the fifth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #20]		@ Loads the sixth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #8]		@ Loads the third array index value into r0
	ldr	r1, [r10, #12]		@ Loads the fourth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #16]		@ Loads the fifth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #20]		@ Loads the sixth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #12]		@ Loads the fourth array index value into r0
	ldr	r1, [r10, #16]		@ Loads the fifth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #20]		@ Loads the sixth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #16]		@ Loads the fifth array index value into r0
	ldr	r1, [r10, #20]		@ Loads the sixth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #20]		@ Loads the sixth array index value into r0
	ldr	r1, [r10, #24]		@ Loads the seventh array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #24]		@ Loads the seventh array index value into r0
	ldr	r1, [r10, #28]		@ Loads the eighth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	
	ldr	r0, [r10, #28]		@ Loads the eighth array index value into r0
	ldr	r1, [r10, #32]		@ Loads the ninth array index value into r1
	cmp	r0, r1			@ Compares r0 to r1
	beq	nextRound		@ If they are equal, leaves sentinel value as is
	
	mov	r8, #1			@ Changes sentinel value to exit the loop in main.s
nextRound:

	sub 	sp, fp, #4		@ Moves down one memory location from fp and stores it in sp
	pop 	{fp, pc}		@ Pops fp and pc from the stack
