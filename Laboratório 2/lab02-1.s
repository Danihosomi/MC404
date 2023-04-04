main:
    # escolhe a operacao de leitura de inteiro (4)
    # efetua a leitura de um inteiro e guarda em a0
    
    addi t0, zero, 4   
    ecall
    
    addi a0, a0, 2

    addi t0, zero, 1
    ecall 

    j main

    ret