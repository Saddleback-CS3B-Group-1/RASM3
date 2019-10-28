		.global String_substring_1
		.extern malloc

String_substring_1:
		push {r4-r8,r10,r11,lr}
		mov r8, r1
		sub r0, r3, r2
		add r0, #1
		mov r6, r0
		mov r5, r1
		add r5, r2
		bl malloc
		mov r4, r0

loop:
		cmp r6, #0
		beq done
		ldrb r7, [r5], #1
		strb r7, [r4], #1
		sub r6, #1
		b loop

done:
		mov r7, #0
		strb r7, [r4]
		mov r1, r8
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
