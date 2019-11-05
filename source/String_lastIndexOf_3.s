  .global String_lastIndexOf_3

String_lastIndexOf_3:

        push    {r4-r11, lr}              @ Save registers R4-R11,LR
        mov     r5, r2                   	  @ Load into R5 the address of string
        bl      String_length           @ Branch to String_length
        mov     r4, r0                      @ Move into R4 the result of String_length
 		mov     r3, r1
		mov     r1, r5                   	  @ Set R0 to the address of the string
        bl      String_length           @ Branch to String_length
        mov     r1, r3
		mov     r5, r0                   	  @ R5 now holds the length of the string
		mov     r8, r5
        add     r1, r4                       @ Add R1 to R4
		sub     r1, #1
        add     r2, r5                   	  @ Add R5 to R2, moves to one char before end
		sub     r2, #1
		mov     r9, r2 
loop:
        ldrb    r6, [r1], #-1             @ Load into R6 the char of the string
        ldrb    r7, [r2], #-1             @ Load into R7 the char of the substring
        cmp     r6, r7                    @ Compare R6 and R7 
        movne   r2, r9                 @ If not equal, save contents of substring
		movne   r5, r8
        bne     decrement      	@ If not equal, jump to decrement
        sub     r5, #1                    @ Subtract R5
        cmp     r5, #0                   @ Check if index is zero
        ble     endLoop           	 @ If index is less than zero, branch to endLoop
decrement:
        sub     r4, #1                   	@ Decrement index 
        cmp     r4, #0                   @ Cmp R4 to zero
        bge     loop          		@ Branch back to loop if R4 greater than zero

endLoop:
		sub     r4, #1
        mov     r0, r4                   @ Move index into R0
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      	@ Return to calling program
