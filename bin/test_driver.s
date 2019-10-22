		      .data
test_string1: .skip 512
test_string2: .skip 512
input_prompt: .asciz "Enter a string: "
 result_good: .asciz "Strings Match"
  result_bad: .asciz "Strings MisMatch"
		      .global _start
	
_start:
		ldr r1, =input_prompt
		bl putstring

		ldr r1, =test_string1
		mov r2, #512
		bl getstring

		ldr r1, =input_prompt
		bl putstring

		ldr r1, =test_string2
		mov r2, #512
		bl getstring

		ldr r1, =test_string1
		ldr r2, =test_string2
		bl String_equals

		cmp r0, #0
		ldrne r1, =result_good
		ldreq r1, =result_bad
		bl putstring

terimnate:
		mov r7, #1
		svc 0
		.end
