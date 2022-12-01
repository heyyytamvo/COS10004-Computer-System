SETUP_LED:
 GPIO_OFFSET = $200000
 orr r0,GPIO_OFFSET

 mov r1,#1
 lsl r1,#24
 str r1,[r0,#4]     ;set GPIO23 to output
bx lr

FLASH: ;Para = r1 = 9, r0 = 3F000000
BASE = $3F000000
GPIO_OFFSET = $200000
orr r0,GPIO_OFFSET

mov r7,r1
loop$:
  ;Turn GPIO18 on
  mov r1,#1
  lsl r1,#18
  str r1,[r0,#28]

  push{r0, r1, r7, lr}
  mov r0,BASE
  mov r11,$19000 ;delay time is my first 6 digit of student
  orr r11,$00430
  orr r11,$0000F
  mov r1,r11 ;1943F

  bl Delay
  pop{r0, r1, r7, lr}

  ;Turn GPIO18 off
  mov r1,#1
  lsl r1,#18
  str r1,[r0,#40]

  push{r0, r1, r7, lr}
  mov r0,BASE
  mov r11,$10000 ;delay time is my first 6 digit of student
  orr r11,$9430
  orr r11,$000F
  mov r1,r11 ;1943F
  
  bl Delay
  pop{r0, r1, r7, lr}

  sub r7,#1
  cmp r7,#0
bne loop$

bx lr