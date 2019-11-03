.global	String_indexOf_2

String_indexOf_2:

	push	 {r4-r11, lr}		@Save contents of registers R1-R8, LR
	mov	r6, #0		
	add	r0, r2		@Modify our string to start at desired index
	add	r6, r2		@Modify our index count to start at desired index

loop:
	ldrb	r3, [r0]	@Load the next char of our string
	cmp	r3, #0		@Check first if null char is found
	moveq r6, #-1		@If null is reached, return index as -1 for driver
	beq 	endLoop		@If null is found branch to end
	cmp	r3, r1		@Compare string with desired char
	beq	endLoop		@If desired char found, branch to end
	add	r0, #1		@If not found, nove to next char in string
	add	r6, #1		@If not found, increment index by 1
	b 	loop

endLoop:
	mov	r0, r6		@Load R0 with the result
	pop	{r4-r11, lr}	@Restore saved register contents
	bx	lr		@Return to calling program
