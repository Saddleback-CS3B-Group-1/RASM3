	.global String_toLowerCase
	.data
	ptrStr: 	.word
	.text

String_toLowerCase:
	push {r4-r11, lr} 		@AACPS registers
	push {r0}				@Preserve the passed string
	ldr r0, [r0]				@Load string into register r0
	bl String_length		@Must get the length of string
	add r0, #1			@Add the null byte to our string
	bl malloc				@Allocate memory for the string
	ldr r4, =ptrStr			@Load address of pointer into R4
	str r0, [r4]				@Save the memory address of r4 into r0
	pop {r0}				@Restoring the string
	push {r0}				@Preserve the pointer to the string
	ldr r0, [r0]				@dereference string pointer
	ldr r4, [r4]				@dereference pointer ptrStr

convertLoop:
	ldrb r6, [r0], #1			@Increment pointer to traverse through array of characters
	cmp r6, #0			@If char is null
	beq freeLoop			@Branch if char is equal to null
	cmp r6, #'A'			@Checking the ascii char is uppercase A
	blt copy				@Branch if less than 
	cmp r5, #'Z'			@Checking the ascii char is uppercase Z
	bgt copy				@Branch if greater than
	orr r5, #0x20			@lowercase convert
copy:
	strb r6, [r4], #1
	b convertLoop

LowerEnd:
        strb    r6, [r4]                    @ Store null byte to end of our string
	pop	{r0}				@ Restore string pointer
	push	 {r0}				@Preserve the pointer to the string
	ldr	r0, [r0]			@ Dereference string pointer
	bl	free				@ Free up string pointer
	pop	{r0}				@ Restore string pointer
        ldr     r4, =ptrStrLower     @ Load our pointer into R1 for return
        ldr     r4, [r4]                 	 @ Dereference the pointer for our return
	str	r4, [r0]			 @ Save the memory of R4 into R0
        pop  {r4-r11, lr}       		  @ Restore saved register contents
        bx      lr                      	 @ Branch to calling program

.end
