main:
    
    addi t0, zero, 4   
    ecall

    add s0, a0, zero
    
    addi a0, a0, 2

    addi t0, zero, 1
    ecall 

    bne s0, zero, main

    ret