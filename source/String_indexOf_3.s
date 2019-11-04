.global	String_indexOf_3

String_indexOf_3:

	push {r4-r11, lr}	@Save registers R4-R11,LR
	mov	r5, r2		@Move substring into R5
	bl	String_length	@Branch to String_length
	mov	r4, r0		@Move result of String_length into R4
	mov r3, r1
	mov	r1, r5		@Move substring into R0
	bl	String_length	@Branch to String_length
	mov r1, r3
	mov	r5, r0		@Move result of String_length into R5
	mov	r9, r2		@Move substring into R9
	mov	r6, #0		@Move 0 into R6 for future calc.

loop:
	ldrb	r7, [r1], #1	@Load first byte of string into R7
	ldrb	r8, [r2], #1	@Load first byte of substring into R8
	cmp	r8, #0		@Check if substring holds null
	beq	endLoop		@Branch to endLoop if null
	cmp	r7, r8		@Compare the string char to substring char
	movne	r2, r9		@If not equal, move original substring back into R1
	add	r6, #1		@Add one to R6 index
	cmp	r7, #0		@Check if string holds null
	bne	loop			@If not null, return to start of loop
	mov	r6, #-1		@If null, set index to -1

endLoop:
	cmp	r6, #-1		@Check if index is -1
	subne	r6, r5		@If not -1, sub R5 from R6
	mov	r0, r6		@Move result index into R0
	pop	{r4-r11, lr}	@Restore saved register contents
	bx	lr		@Return to calling program
