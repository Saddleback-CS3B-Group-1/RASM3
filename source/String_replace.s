        .global String_replace
        .data
	ptrStr:  .word   0
        .text

String_replace:
        push    {r4-r11, lr}   
	mov 	r4, r1
	mov	r10, r2
	mov 	r11, r3
        bl      String_length        	 @ get the length of string
	mov	r5, r0
        add     r0, #1                    @ Add the null char room
        bl      malloc                    @ Branch to malloc to generate required memory
	mov	r1, r1
	mov 	r2, r10
	mov 	r3, r11	
        ldr     r3, =ptrStr       	@ Load our pointer address into r4
        str     r0, [r3]                     @ Save our pointer to new memory

replaceLoop:
	cmp 	r5, #0
	beq	b done
        ldrb    r6, [r4], #1              @ Load first char from string1 into R5, increment our pointer
        cmp     r6, r2 
	moveq	r6, r3
	strb	r6, [r0], #1 
       	sub r5, #1
        b       replaceLoop            @ Branch to loop

done:
	mov	r8, #0
	strb	r8, [r0]
	ldr	r8, =ptrStr
	ldr 	r0, [r8]
	pop    {r4-r11, lr}
	bx	lr

.end
