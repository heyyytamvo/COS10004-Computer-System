; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        ;compare r0 and r1, if r0 is less or equal to r1, assign r1 to r0
        cmp r0, r1
        movle r0, r1

        ;compare r0 and r2, if r0 is less or equal to r2, assign r1 to r0
        cmp r0, r2
        movle r0, r2

        bx lr