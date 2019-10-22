		.global String_equals

String_equals:
		push {r4-r8,r10,r11,lr}
		mov r0, #0
		bl String_length
		mov r4, r0
		mov r3, r1
		mov r1, r2
		bl String_length
		mov r5, r0
		mov r1, r3
		cmp r4, r5
		bne terminate
		mov r6, r4
	    mov r0, #0

compare_loop:
		cmp r6, #0
		moveq r0, #1
		beq terminate
		ldrb r4, [r1], #1
		ldrb r5, [r2], #1
		cmp r4, r5
		bne terminate
		sub r6, #1
		b compare_loop
		
terminate:
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
