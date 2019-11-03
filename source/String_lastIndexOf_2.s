.global String_lastIndexOf_2

String_lastIndexOf_2:

        push    {r4-r11, lr}            @ Save registers R4-R11, LR
        bl      String_length           @ Branch to String_length
        mov     r4, r1
        mov     r5, r0                   @ Move result from String_length into R0
        cmp     r3, #0                   @ Compare R2 to zero to check register contents
        movlt   r6, #-1                  @ If the index is invalid, the return value is set to -1
        blt     endLoop           @ If the index is invalid, immediately exit the subroutine
        cmp     r3, r5                   @ Check if the index equals the length of the string
        movge   r6, #-1                  @ If it is invalid(greater than or equal), set to -1
        bge     endLoop           @ If invalid, branch to end
        add     r4, r3                   @ Move index into R0
        mov     r6, r3                   @ Move the index into R6

loop:
        ldrb    r5, [r4], #-1             @ Load the char of our string into R5
        cmp     r5, r2                   @ Compare the chars
        beq     endLoop           @ If they are the same, exit loop
        sub     r6, #1                   @ Subtract our index by 1
        cmp     r6, #0                   @ Check if index is zero
        bge     loop          @ As long as its greater or equal to zero, continue

endLoop:
        mov     r0, r6                   @ Move result into R0 for return
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      @ Return to calling program
