; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ;i used r3 for the index keep tracking ;;
        ;i used r4 for the value keep tracking ;
        ;i used r5 for the time delay between flashes
        push { r0, r3, r2, r4 , r5}
        mov r5, $50000
        mov r3, #1
        loop:
		    ldr r4, [r2] , #4
                push { lr , r1, r2 }

                mov r1, r4
                mov r2, r5                
                bl FLASH
                ;pause before increase the index
		    mov r1,$150000 ; pause time
		    bl PAUSE

                pop { lr , r1, r2 }
                add r3, r3, #1
                cmp r3, r1
        ble loop 
        pop { r0, r3, r2, r4, r5 }
        bx lr