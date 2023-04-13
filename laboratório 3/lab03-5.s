main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
  ecall              # efetua a operacao de leitura de inteiro
  add s0, zero, a0

  while:  
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
    ecall              # efetua a operacao de leitura de inteiro
    beq a0, zero, fim

    xor a0, a0, s0
    addi t0, zero, 1
    ecall
    beq zero, zero, while
    
  fim:

  ret