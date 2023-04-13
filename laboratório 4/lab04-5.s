main:
    addi t0, zero, 4
    
    ecall

    addi t0, zero, 2

    add s0, a0, zero 
    addi s1, zero, 10
    blt s0, s1, number
    bge s0, s1, leter

    number:
        addi a0, a0, 48
        ecall
        j fim 

    leter:
        addi a0, a0, 55
        ecall
        j fim 
    

    fim:
        addi a0, zero, 104
        ecall

    ret