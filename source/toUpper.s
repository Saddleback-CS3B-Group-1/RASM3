    .global toUpper
        .data
ptrStrToUpper:    .word   0
        .text
toUpper:
        push    {R4-R11, LR}   	        
        push    {R0}                    
	ldr	R0, [R0]			
        bl      StringLength           
        add     R0, #1                  
        bl      malloc                  
        ldr     R4, =ptrStrToUpper         
        str     R0, [R4]                 
        pop     {R0}                    
	push	  {R0}			
	ldr	R0, [R0]			
        ldr     R4, [R4]                 
loop:
        ldrb    R5, [R0], #1              
        cmp     R5, #0                   
        beq     loopEnd                
        cmp     R5, #'a'                 
        blt     copy               
        cmp     R5, #'z'                 
        bgt     copy            
        and     R5, #0xdf                
copy:
        strb    R5, [R4], #1              
        b       loop               
loopEnd:
        strb    R5, [R4]                
	pop	{R0}			
	push	 {R0}			
	ldr	R0, [R0]			
	bl	free			
	pop	{R0}			
        ldr     R4, =ptrStrToUpper        
        ldr     R4, [R4]                 
	str	R4, [R0]			
        pop     {R4-R11, LR}    	
        bx      LR                    