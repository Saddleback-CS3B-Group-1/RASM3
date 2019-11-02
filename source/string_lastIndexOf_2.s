.global string_lastIndexOf_2

string_lastIndexOf_2:

        push    {r4-r11, lr}            @ Save registers R4-R11, LR
        push    {r0-r3}                 @ Save register contents responsible for arguments
        bl      StringLength           @ Branch to String_length
        mov     r4, r0                   @ Move result from String_length into R0
        pop     {r0-r3}                 @ Restore saved register contents
        cmp     r2, #0                   @ Compare R2 to zero to check register contents
        movlt   r4, #-1                  @ If the index is invalid, the return value is set to -1
        blt     endLoop           @ If the index is invalid, immediately exit the subroutine
        cmp     r2, r4                   @ Check if the index equals the length of the string
        movge   r4, #-1                  @ If it is invalid(greater than or equal), set to -1
        bge     endLoop           @ If invalid, branch to end
        add     r0, r2                   @ Move index into R0
        sub     r4, r2                   @ Move the index into R4

loop:
        ldrb    r5, [r0], #-1             @ Load the char of our string into R5
        cmp     r5, r1                   @ Compare the chars
        beq     endLoop           @ If they are the same, exit loop
        sub     r4, #1                   @ Subtract our index by 1
        cmp     r4, #0                   @ Check if index is zero
        bge     loop          @ As long as its greater or equal to zero, continue

endLoop:
        mov     r0, r4                   @ Move result into R0 for return
        pop     {r4-r11, lr}            @ Restore saved register contents
        bx      lr                      @ Return to calling program
