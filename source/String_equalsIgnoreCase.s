		.global String_equalsIgnoreCase

String_equalsIgnoreCase:
		push {r4-r8,r10,r11,lr}
		bl String_length
		mov r4, r0
		mov r6, r1
		mov r1, r2
		bl String_length
		mov r5, r0
		mov r1, r6
		cmp r4, r5
		mov r0, #0
		bne done
		mov r6, r4
		mov r4, r1
		mov r5, r2
loop:
		cmp r6, #0
		beq done
		ldrb r7, [r4], #1
		ldrb r8, [r5], #1
		cmp r7, r8
		blne check_alpha
		sub r6, #1
		b loop

check_alpha:
        mov r9, #0
        cmp r7, #65
        addge r9, #1
		cmp r7, #90
		addle r9, #1
		cmp r9, #2
		addeq r7, #32

		mov r9, #0
		cmp r8, #65
		addge r9, #1
		cmp r8, #90
		addle r9, #1
		cmp r9, #2
		addeq r8, #32

		cmp r7, r8
		bne done
        bx lr

done:
		cmp r6, #0
		moveq r0, #1
		pop {r4-r8,r10,r11,lr}
		bx lr
		.end
