		.global String_copy
		.extern malloc
String_copy:
	    push {r4-r8,r10,r11,lr}	
        bl String_length
		cmp r0, #0
		beq terminate
		mov r6, r0
		add r0, #3
		mov r4, r1
		bl malloc
		mov r5, r0

copy_loop:
		ldrb r7, [r4], #1
		str r7, [r5], #1
		sub r6, #1
		cmp r6, #0
		bgt copy_loop
		mov r7, #0
		str r7, [r5]

terminate:
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
