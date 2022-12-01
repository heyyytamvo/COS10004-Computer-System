; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ;get the minimum value
        push { r3, r4 }
        push { r0, lr }
        bl stage1a_min

        ;r3 is the register storing the minimum value
        mov r3, r0
        pop { r0, lr}


        push { lr }
        bl stage1b_max
	  pop { lr }
        ;r4 is the register storing the max value
        mov r4, r0

        ;storing different value between min and max to r0
        sub r4, r3
        mov r0, r4
	pop { r3, r4 }
    
bx lr


        