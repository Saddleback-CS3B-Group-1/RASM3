		.global String_startsWith_1

String_startsWith_1:
		push {r4-r8,r10,r11,lr}
		mov r4, r1
		mov r5, r2
		add r4, r3
		bl String_length
		mov r6, r0
		mov r1, r5
		bl String_length
		mov r7, r0
		mov r1, r4
		mov r2, r5
		mov r0, #0
		cmp r6, r7
		blt done
loop:
		cmp r7, #0
		moveq r0, #1
		beq done
		ldrb r10, [r4], #1
		ldrb r11, [r5], #1
		cmp r10, r11
		bne done
		sub r7, #1
		b loop

done:
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
