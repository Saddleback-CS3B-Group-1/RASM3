		.global String_charAt

String_charAt:
		push {r4-r8,r10,r11,lr}
		mov r4, r1
		add r4, r2
		ldrb r0, [r4]

done:
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
