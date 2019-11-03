        .global String_replace
        .data
	ptrStr:  .word   0
        .text

String_replace:
        push    {r4-r11, lr}            
        push    {r0-r2}                  @ Save regiser contents
	ldr	r0, [r0]			@ Get string1 into R0
        bl      StringLength          @ get the length of string
        add     r0, #1                    @ Add the null char room
        bl      malloc                    @ Branch to malloc to generate required memory
        ldr     r4, =ptrStr       	@ Load our pointer address into r4
        str     r0, [r4]                     @ Save our pointer to new memory
        pop    {r0-r2}                 	@ Restore saved register contents
	push   {r0}			@ Save string pointer
	ldr	r0, [r0]			@ Get string into r0
        ldr     r4, [r4]                 	@ Dereference our pointer

replaceLoop:
        ldrb    r5, [r0], #1              @ Load first char from string1 into R5, increment our pointer
        cmp     r5, #0                   @ Check if string1 holds a null character
        beq     freeLoop              	 @ If null, branch to the end
        cmp     r5, r1                     @ Comparing our string to the old char
        moveq   r5, r2                   @ If they are equal, replace with new char
        strb    r5, [r4], #1               @ Copy the new char to the string, increment pointer
        b       replaceLoop            @ Branch to loop

freeLoop:
        strb    r5, [r4]            @ Store the null byte at the end of our new string
	pop	{r0}			@ Restore string1 pointer
	push	 {r0}			@ Save string1 pointer
	ldr	r0, [r0]		@ Dereference string1 pointer
	bl	free			@ Free string1
	pop	{r0}			@ Restore string1 pointer
        ldr     r4, =ptrStr       @ Load the pointer into R0 for return
	ldr	r4, [r4]		@ Dereference strReplace pointer
        str	r4, [r0]		@ String1 ptr = strReplace
        pop     {r4-r11, lr}     @ Restore saved register contents
        bx      lr                    @ Branch to calling program

.end