main:
    addi t0, zero, 4
    ecall 

    addi s0, a0, -10

    bge s0, zero, positivo 
    blt s0, zero, negativo 

    positivo:
        addi t0, zero, 1
        add a0, s0, zero 
        ecall 
        bge s0, zero, fim

    negativo: 
        addi t0, zero, 2
        addi a0, zero, 45
        ecall  

        add a0, zero, zero 

        soma:
            addi a0, a0, 1
            addi s0, s0, 1
            blt s0, zero, soma

        addi t0, zero, 1
        ecall  
        bge s0, zero, fim

    fim: 

    ret