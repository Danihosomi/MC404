main:
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)
    
    ecall # efetua a leitura de um inteiro e guarda em a0
    add s0, a0, zero
    ecall 
    add s1, s0, a0
    
    add a0, s1, zero 

    addi t0, zero, 1   # escolhe a operacao de imprimir (1)
    ecall # efetua a impressão na tela
    
    ret