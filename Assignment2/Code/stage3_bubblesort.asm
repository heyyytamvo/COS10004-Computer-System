; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

          ; for i in range(size - 1):
          ;     for j in range(size - i - 1):
          ;             if array[j] >= array[ j + 1 ]:
          ;                     swap(array[j], array[ j + 1 ])                  

        ; your function must mov the address of the sorted array to r0

          ; r5 is the register that store the value at array[ j ]
          ; r3 is the register storing the needed value to go to array[ i ]
          ; r6 is the register that store the value at array[ j + 1 ]   
          ; r4 is the register storing the value at array[ i + 1 ]
          ; r7 acts like i
          ; r8 acts like j
          ; r9 acts like size
          ; r10 acts like "size - i - 1" 

          push { lr, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 }

          mov r7, #0    ;;i start from 0
          mov r8, #0      ;;j start from 0
          mov r9, r0    ;;r0 is the size of the array
          mov r2, #1
          loopBubble:
                loopBubble1:
                        ;assigning r10
                        push { r7, r9 }
                                sub r9, r9, r7
                                sub r9, r9, r2
                                mov r10, r9
                        pop { r7, r9 }
                        
                        ;;;load r5, r6
                        push { r7, r8, r9 }
                        mov r7, r8 
                        mov r9, #4
                        mul r8, r7, r9  ;;;increase r8
                        push { r1 }
                        add r1, r1, r8
                        ldr r5, [r1]
                        pop { r1 }  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
                        mov r3, r8        
                        add r8, r8, r9          ;;add 4 to r8
                        push { r1 }
                        add r1, r1, r8
                        ldr r6, [r1] 
                        pop { r1 }
                        
                        mov r4, r8              
                        pop { r7, r8, r9 }

                        ;;;;;;;swap value here
                        cmp r5, r6
                        strge r6, [r1, r3]  ;;storing r6 to the address of array[ i ] if r5 is greater or equal to r6
                        strge r5, [r1, r4]  ;;storing r5 to the address of array[ i  + 1 ] if r5 is greater or equal to r6
                    
                        add r8, r8, #1
            cmp r8, r10
                blt loopBubble1                 ;if r8 is LESS than r10, then continue loop1

                add r7, r7, #1
                cmp r7, r9
                movlt r8, #0
        blt loopBubble                          ;if r7 is LESS than r9, then continue loop
          mov r0, r1
          push { lr, r0, r1, r2}
                BASE = $FE000000 ; RPI 4 Peripherals address ;
                ;BASE=$3F000000 for RP2 and RP3 Peripherals address
                mov r1, r9
                mov r2, r0  ;;array to flash
                mov r0, BASE
                bl stage2_flash_array
          pop { lr, r0, r1, r2}
          pop { lr, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 } 
        bx lr