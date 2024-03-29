	.global String_concat
	.extern malloc

String_concat:
	push {r4-r8,r10,r11,lr}
	mov r8, r1
	mov r9, r2
	bl String_length
	mov r5, r0
	mov r1, r2
	bl String_length
	mov r10, r0
	add r0, r5
	add r0, #3
	bl malloc
	mov r11, r0
	mov r4, r0
	mov r2, r8

loop1:
	cmp  r5, #0		@Have we finished copying szValA?
	beq  bottom1
	ldrb r6, [r2],#1
	strb r6, [r4],#1
	sub  r5, #1
	b    loop1

bottom1:
	mov r2, r9
	mov r5, r10
	add r5, #1

loop2:
	cmp  r5, #0		@Have we finished copying szValB?
	beq  bottom2
	ldrb r6, [r2],#1
	strb r6, [r4],#1
	sub  r5, #1
	b    loop2

bottom2:
	mov r0, r11
	mov r1, r8
	mov r2, r9
	pop {r4-r8,r10,r11,lr}
	bx lr

.end
