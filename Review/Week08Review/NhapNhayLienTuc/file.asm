BASE = $FE000000 ;or $3F000000 for 2B and 3B/3B+  
GPIO_OFFSET = $200000 
mov r0,BASE 
orr r0,GPIO_OFFSET ;start of GPIO 
mov r1,#1 
lsl r1,#24 
str r1,[r0,#4]     ;set GPIO18 to output 
loop$:             ;outer loop - repeat LED on, wait, LED off, wait 
  mov r1,#1 
  lsl r1,#18 
  str r1,[r0,#28]  ;turn LED on 
  mov r2,$3F0000 
  wait1$: 
    sub r2,#1 
    cmp r2,#0 
    bne wait1$    ;count from 4128768 to 0 (busy wait) 
  mov r1,#1  ;can be omitted 
  lsl r1,#18 ;can be omitted 
  str r1,[r0,#40]   ;turn LED off (writing to the pull up register) 
  mov r2,$3F0000 ;Model 2 is a bit slower in single core mode 
  wait2$: 
    sub r2,#1 
    cmp r2,#0 
    bne wait2$    ;count from 4128768 to 0 (busy wait) 
b loop$  ;end of outer loop