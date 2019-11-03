.extern free

.global	String_indexOf_1

String_indexOf_1:

	push	{r4-r8, lr}	@Save contents of registers R1-R8, LR
	mov	r5, #0		@Set R2 is intialized to zero and is a pointer
	mov 	r4, r1

loop:
	ldrb	r3, [r4]	@Load next character of our string
	cmp	r3, #0		@First, check if the char is a null
	moveq r5, #-1		@If null is found, set R2 to -1
	beq	endLoop		@If null found, branch to end
	cmp	r3, r2		@Compare string with desired char
	beq	endLoop		@If desired char found, branch to end
	add	r4, #1		@If not found, move to next char in string
	add	r5, #1		@If not found, increment index by 1, keep moving
	b loop		

endLoop:
	mov	r0, r5		@Move result into R0 for return
	pop	{r4-r8, lr}	@Restore saved register contents
	bx	LR		@Return to calling program
