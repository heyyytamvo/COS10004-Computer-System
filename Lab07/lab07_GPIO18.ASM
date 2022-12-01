BASE = $3F000000   ;  $ means HEX 
GPIO_OFFSET=$200000 
 
mov r0,BASE 
orr r0,GPIO_OFFSET    ;r0 now equals 0xFE200000 
 
mov r1,#1  
lsl r1,#24          ;write 1 into r1, lsl 24 times to move the 1 to bit 24 
str r1,[r0,#4]      ;write it into 5th (16/4+1)block of function register 
 
mov r1,#1 
lsl r1,#18           ;write 1 into r1, lsl 18 times to move the 1 to bit 18 
str r1,[r0,#28]     ;write it into first block of pull-up register 
 
loop$: 
b loop$        ;loop forever 