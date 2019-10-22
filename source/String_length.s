		.global String_length

String_length:
		push {r4-r8,r10,r11,lr}
		mov r5, r1
		mov r0, #0
str_len_loop:
		ldrb r4, [r5], #1
		cmp r4, #0
		addne r0, #1
		bne str_len_loop
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
