BASE = $FE000000 
GPIO_OFFSET = $200000  

mov r0,BASE 
orr r0,GPIO_OFFSET ;Base address of GPIO 

mov r1,#1 
lsl r1,#18 ;GPIO16 
str r1,[r0,#4] ;enable output 

mov r1,#1 
lsl r1,#16  
loop$:  
 str r1,[r0,#40] ;Turn on LED 
 ;new timer 
TIMER_OFFSET = $3000 
mov r3,BASE 
orr r3,TIMER_OFFSET ;store base address of timer (r3) 
 mov r4, 524288      ;store delay (r4) 
 ldrd r6,r7,[r3,#4]  
 mov r5,r6           ;store starttime (r5)(=currenttime (r6)) 
 loopt1: 
  ldrd r6,r7,[r3,#4] ;read currenttime (r6) 
  sub r8,r6,r5  ;remainingtime (8)= currenttime (r6) - starttime (r5) 
  cmp  r8,r4  ;compare remainingtime (r8), delay (r4) 
  bls loopt1 ;loop if LE (reaminingtime <= delay) 
 str r1,[r0,#28]  ;turn off LED 
 ;re-use timer 
 ldrd r6,r7,[r3,#4]  
 mov r5,r6 ;store starttime (r5)(=currenttime (r6)) 
 loopt2: 
  ldrd r6,r7,[r3,#4] ;read currenttime (r6) 
  sub r8,r6,r5  ;remainingtime (8)= currenttime (r6) - starttime (r5) 
  cmp  r8,r4  ;compare remainingtime (r8), delay (r4) 
  bls loopt2 ;loop if LE (reaminingtime <= delay) 
 b loop$
