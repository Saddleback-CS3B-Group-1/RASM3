		      .data
test_string1: .skip 512
#test_string2: .skip 512
 ptr_string2: .word 0
input_prompt: .asciz "Enter a string: "
 result_good: .asciz "Strings Match"
  result_bad: .asciz "Strings MisMatch"
		      .global _start
			  .extern free

_start:
		ldr r1, =input_prompt
		bl putstring

		ldr r1, =test_string1
		mov r2, #512
		bl getstring

/*  test driver for String_equals 
		ldr r1, =input_prompt
		bl putstring

		ldr r1, =test_string2
		mov r2, #512
		bl getstring
*/
/*
		ldr r1, =test_string1
		ldr r2, =test_string2

/*
		bl String_equals
		bl String_copy
		ldr r1, =ptr_string2
		str r0, [r1]
		mov r1, r0
		ldr r2, =test_string1

*/
/*
		bl String_equalsIgnoreCase
		
		cmp r0, #0
		ldrne r1, =result_good
		ldreq r1, =result_bad
		bl putstring
*/
		bl String_length
		mov r3, r0
		sub r3, #1
		mov r2, #1
		bl String_substring_1
		bl free

terminate:
		mov r7, #1
		svc 0
		.end
