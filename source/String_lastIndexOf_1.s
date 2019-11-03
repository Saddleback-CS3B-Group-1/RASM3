 .extern malloc
        .global String_lastIndexOf_1

String_lastIndexOf_1:

        push    {r4-r11, lr}            @ Save registers R4-R11, LR
        bl      String_length           @ get stringlength, return into R0
        mov     r4, r1
        mov     r5, r0                   @ put string length into R5
        sub     r5, #1
        add     r4, r5                   @ Add to the string the length of string passed in
        
loop:
        ldrb    r6, [r4], #-1             @ Load into R6 the char from the string
        cmp     r6, r2                   @ Check if string values are equal
        beq     endLoop                  @ If equal, branch to end
        sub     r5, #1                   @ Decrement our index value
        cmp     r5, #0                   @ Check if index is zero
        bge     loop                     @ If index is not zero, continue

endLoop:
        mov     r0, r5                   @ Move result into R0 for return
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      @ Return to calling program
