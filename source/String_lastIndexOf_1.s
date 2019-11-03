 .extern malloc
        .global String_lastIndexOf_1

String_lastIndexOf_1:

        push    {r4-r11, lr}            @ Save registers R4-R11, LR
        push    {r0, r1}                @ Save the regsisters 
        bl      String_length           @ get stringlength, return into R0
        mov     r4, r0                   @ put string length into R4
        pop     {r0, r1}                @ Restore saved register contents
        add     r0, r4                   @ Add to the string the length of string passed in
        sub     r0, #1                   @ Subtract to last char of the string
        sub     r4, #1                   @ Subtract to last char of the string

loop:
        ldrb    r5, [r0], #-1             @ Load into R5 the char from the string
        cmp     r5, r1                   @ Check if string values are equal
        beq     endLoop           @ If equal, branch to end
        sub     r4, #1                   @ Decrement our index value
        cmp     r4, #0                   @ Check if index is zero
        bge     loop          @ If index is not zero, continue

endLoop:
        mov     r0, r4                   @ Move result into R0 for return
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      @ Return to calling program
