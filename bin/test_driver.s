    		   .data
 input_buffer: .skip 512
   int_string: .skip 12
 	   ptr_s1: .word 0
 	   ptr_s2: .word 0
 	   ptr_s3: .word 0
	   ptr_s4: .word 0
    prompt_s1: .asciz "s1"
    prompt_s2: .asciz "s2"
    prompt_s3: .asciz "s3"
	prompt_s4: .asciz "s4"
prompt_1: .asciz ".length() = "
prompt_2: .asciz "String_equals(s1,s3) = "
prompt_3: .asciz "String_equals(s1,s1) = "
prompt_4: .asciz "String_equalsIgnoreCase(s1,s3) = "
prompt_5: .asciz "String_equalsIgnoreCase(s1,s2) = "
prompt_6: .asciz "String_copy(s1)"
prompt_6A: .asciz " = "
prompt_7: .asciz "String_substring_1(s3,4,13) = "
prompt_8: .asciz "String_substring_2(s3,7) = "
prompt_9: .asciz "String_charAt(s2,4) = "
prompt_10: .asciz "String_startsWith_1(s1,11,\"hat.\") = "
prompt_11: .asciz "String_startsWith_2(s1,\"Cat\") = "
prompt_12: .asciz "String_endsWith(s1,\"in the hat.\") = "
prompt_13: .asciz "String_indexOf_1(s2,\'g\') = "
prompt_14: .asciz "String_indexOf_2(s2,\'g\',9) = "
prompt_15: .asciz "String_indexOf_3(s2,\"eggs\") = "
prompt_16: .asciz "String_lastIndexOf_1(s2,\'g\') = "
prompt_17: .asciz "String_lastIndexOf_2(s2,\'g\',6) = "
prompt_18: .asciz "String_lastIndexOf_3(s2,\"egg\") = "
prompt_19: .asciz "String_replace(s1,\'a\',\'o\') = "
prompt_20: .asciz "String_toLowerCase(s1) = "
prompt_21: .asciz "String_toUpperCase(s1) = "
prompt_22A: .asciz "String_concat(s1,\" \")"
prompt_22B: .asciz "String_concat(s1,s2) = "
  result_good: .asciz "TRUE"
   result_bad: .asciz "FALSE"
   char_nL: .byte 10
   char_qT: .byte 34
   char_wS: .byte 32
   arg_10: .asciz "hat."
   arg_11: .asciz "Cat"
   arg_12: .asciz "in the hat."
   arg_15: .asciz "eggs" 
   arg_13: .byte 'g'
   arg_19A: .byte 'a'
   arg_19B: .byte 'o'
     out_char: .byte 0
   			.text
	  	    .global _start
			.extern free

_start:
	ldr r1, =prompt_s1
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =input_buffer
	mov r2, #512
	bl getstring
	bl String_copy
	ldr r1, =ptr_s1
	str r0, [r1]

	ldr r1, =prompt_s2
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =input_buffer
	mov r2, #512
	bl getstring
	bl String_copy
	ldr r1, =ptr_s2
	str r0, [r1]

	ldr r1, =prompt_s3
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =input_buffer
	mov r2, #512
	bl getstring
	bl String_copy
	ldr r1, =ptr_s3
	str r0, [r1]

@Part 1
	
	ldr r1, =prompt_s1
	bl putstring
	ldr r1, =prompt_1
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	bl String_length
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

	ldr r1, =prompt_s2
	bl putstring
	ldr r1, =prompt_1
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	bl String_length
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch
	
	ldr r1, =prompt_s3
	bl putstring
	ldr r1, =prompt_1
	bl putstring
	ldr r1, =ptr_s3
	ldr r1, [r1]
	bl String_length
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 2

	ldr r1, =prompt_2
	bl putstring
	ldr r1, =ptr_s1
	ldr r2, =ptr_s3
	ldr r1, [r1]
	ldr r2, [r2]
	bl String_equals
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 3

	ldr r1, =prompt_3
	bl putstring
	ldr r1, =ptr_s1
	ldr r2, =ptr_s1
	ldr r1, [r1]
	ldr r2, [r2]
	bl String_equals
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 4

	ldr r1, =prompt_4
	bl putstring
	ldr r1, =ptr_s1
	ldr r2, =ptr_s3
	ldr r1, [r1]
	ldr r2, [r2]
	bl String_equalsIgnoreCase
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 5

	ldr r1, =prompt_5
	bl putstring
	ldr r1, =ptr_s1
	ldr r2, =ptr_s2
	ldr r1, [r1]
	ldr r2, [r2]
	bl String_equals
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 6

	ldr r1, =prompt_s4
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =prompt_6
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	bl String_copy
	ldr r1, =ptr_s4
	str r0, [r1]
	ldr r1, =char_nL
	bl putch
	ldr r1, =prompt_s1
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	bl putstring
	ldr r1, =char_nL
	bl putch
	ldr r1, =prompt_s4
	bl putstring
	ldr r1, =prompt_6A
	bl putstring
	ldr r1, =ptr_s4
	ldr r1, [r1]
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 7

	ldr r1, =prompt_7
	bl putstring
	ldr r1, =ptr_s3
	ldr r1, [r1]
	mov r2, #4
	mov r3, #13
	bl String_substring_1
	mov r1, r0
	bl putstring
	bl free
	ldr r1, =char_nL
	bl putch

@Part 8

	ldr r1, =prompt_8
	bl putstring
	ldr r1, =ptr_s3
	ldr r1, [r1]
	mov r2, #7
	bl String_substring_2
	mov r1, r0
	bl putstring
	bl free
	ldr r1, =char_nL
	bl putch

@Part 9

	ldr r1, =prompt_9
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	mov r2, #4
	bl String_charAt
	ldr r1, =out_char
	str r0, [r1]
	bl putch
	ldr r1, =char_nL
	bl putch

@Part 10

	ldr r1, =prompt_10
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	mov r3, #11
    ldr r2, =arg_10
	bl String_startsWith_1
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 11

	ldr r1, =prompt_11
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	ldr r2, =arg_11
	bl String_startsWith_2
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 12

	ldr r1, =prompt_12
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	ldr r2, =arg_12
	bl String_endsWith
	cmp r0, #1
	ldreq r1, =result_good
	ldrne r1, =result_bad
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 13

	ldr r1, =prompt_13
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_13
	ldrb r2, [r2]
	bl String_indexOf_1
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 14

	ldr r1, =prompt_14
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_13
	ldrb r2, [r2]
	mov r3, #9
	bl String_indexOf_2
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 15

	ldr r1, =prompt_15
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_15
	bl String_indexOf_3
	ldr r1, =int_string
	bl intasc32
	bl putstring	
	ldr r1, =char_nL
	bl putch

@Part 16

	ldr r1, =prompt_16
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_13
	ldrb r2, [r2]
	bl String_lastIndexOf_1
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 17

	ldr r1, =prompt_17
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_13
	ldrb r2, [r2]
	mov r3, #6
	bl String_lastIndexOf_2
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 18

	ldr r1, =prompt_18
	bl putstring
	ldr r1, =ptr_s2
	ldr r1, [r1]
	ldr r2, =arg_15
	bl String_lastIndexOf_3
	ldr r1, =int_string
	bl intasc32
	bl putstring
	ldr r1, =char_nL
	bl putch

@Part 19

	ldr r1, =prompt_19
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	ldr r2, =arg_19A
	ldrb r2, [r2]
	ldr r3, =arg_19B
	ldrb r3, [r3]
	bl String_replace
	mov r1, r0
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	ldr r2, =ptr_s1
	str r0, [r2]
	mov r0, r1
	bl free
	ldr r1, =char_nL
	bl putch

@Part 20 

	ldr r1, =prompt_20
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	bl String_toLowerCase
	mov r1, r0
	bl putstring
	bl free
	ldr r1, =char_nL
	bl putch

@Part 21
	
	ldr r1, =prompt_20
	bl putstring
	ldr r1, =ptr_s1
	ldr r1, [r1]
	bl String_toUpperCase
	mov r1, r0
	bl putstring
	bl free
	ldr r1, =char_nL
	bl putch

@Part 22

terminate:
		mov r11, #0
		ldr r0, =ptr_s1
		ldr r0, [r0]
		bl free
		ldr r0, =ptr_s1
		str r11, [r0]
		
		ldr r0, =ptr_s2
		ldr r0, [r0]
		bl free
		ldr r0, =ptr_s2
		str r11, [r0]
		
		ldr r0, =ptr_s3
		ldr r0, [r0]
		bl free
		ldr r0, =ptr_s3
		str r11, [r0]
		
		ldr r0, =ptr_s4
		ldr r0, [r0]
		bl free
		ldr r0, =ptr_s4
		str r11, [r0]

		mov r7, #1
		svc 0
		.end
