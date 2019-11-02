  .global string_lastIndexOf_3

string_lastIndexOf_3:

        push    {r4-r11, lr}            @ Save registers R4-R11,LR
        push    {r0, r1}                @ Save register contents
        mov     r5, r1                   @ Load into R5 the address of string
        bl      StringLength           @ Branch to String_length
        mov     r4, r0                   @ Move into R4 the result of String_length
        mov     r0, r5                   @ Set R0 to the address of the string
        bl      StringLength           @ Branch to String_length
        mov     r5, r0                   @ R5 now holds the length of the string
        pop     {r0, r1}                @ Restore saved register contents
        add     r0, r4                   @ Add R0 to R4
        add     r1, r5                   @ Add R4 to R1, moves to one char before end
        sub     r0, #1                   @ Move to last char in the string
        sub     r1, #1                   @ Move to last char in the substring
        sub     r4, #1                   @ Set R4 to last index of str
        sub     r5, #1                   @ Set R5 to last index of substr
        push    {r1, r5}                 @ Save register contents

loop:
        ldrb    r6, [r0], #-1             @ Load into R6 the char of the string
        ldrb    r7, [r1], #-1             @ Load into R7 the char of the substring
        cmp     r6, r7                   @ Compare R6 and R7 
        popne   {r1, r5}                 @ If not equal, restore saved register contents
        pushne  {r1, r5}                 @ If not equal, save contents of substring
        bne     decrement      @ If not equal, jump to LastIndex3Cont
        sub     r5, #1                   @ Subtract R5
        cmp     r5, #0                   @ Check if index is zero
        blt     endLoop           @ If index is less than zero, branch to end

decrement:
        sub     r4,#1                   @ Decrement index 
        cmp     r4,#0                   @ Cmp R4 to zero
        bge     loop          @ Brnach back to loop if R4 greater than zero

endLoop:
        mov     r0, r4                   @ Move index into R0
        pop     {r1, r5}                 @ Restore saved register contents
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      @ Return to calling program
