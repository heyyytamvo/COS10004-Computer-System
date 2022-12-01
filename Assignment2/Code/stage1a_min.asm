; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

		push { lr }
		;compare r0 and r1, if r0 is larger or equal to r1, assign r1 to r0
        	cmp r0, r1
        	movge r0, r1

        ;compare r0 and r2, if r0 is larger or equal to r2, assign r2 to r0
        	cmp r0, r2
        	movge r0, r2
		pop { lr }

         bx lr