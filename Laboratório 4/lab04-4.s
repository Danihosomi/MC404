main:
    addi t0, zero, 5
    ecall

    addi s0, zero, 97
    addi s1, zero, 65

    blt a0, s0, maiusculo 
    bge a0, s0, minusculo 

    maiusculo:
        blt a0, s1, fim 
        addi a0, a0, 32
        j fim


    minusculo:
        addi s0, zero, 123
        bge a0, s0, fim 
        addi a0, a0, -32
        j fim

    fim:
        addi t0, zero, 2
        ecall

    ret