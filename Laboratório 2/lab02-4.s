main:
    addi s0, zero, 9

    comando:
        addi t0, zero, 4   
        ecall

        addi s0, s0, -1

        addi a0, a0, 2

        addi t0, zero, 1
        ecall 

        bge s0, zero, comando # se maior igual

    ret