BASE=$FE000000
GPIO_OFFSET=$200000
mov     r0,BASE 
orr     r0,GPIO_OFFSET

;Program GPIO18 for writing
mov     r1,#1           
lsl     r1,#24
str     r1,[r0,#4]


;Setting it on
mov     r1,#1   
lsl     r1,#18 ;bit quan ly
str     r1,[r0,#28] ;offset


;Setting it off GPIO18
;mov      r1,#1
;lsl      r1,#18
;str      r1,[r0,#40]

loop$:  
b       loop$