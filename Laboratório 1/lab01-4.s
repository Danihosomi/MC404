main:
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    ecall # efetua a leitura de um inteiro e guarda em a0
    addi s0, a0, 2  
    add a0, s0, zero        
    addi t0, zero, 1   # escolhe a operacao de leitura de inteiro (4)
    ecall # efetua a leitura de um inteiro e guarda em a0
    ret