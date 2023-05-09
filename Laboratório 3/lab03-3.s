main:
  add s1, zero, zero
  add s2, zero, zero

  while:  
    addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
    ecall              # efetua a operacao de leitura de inteiro
    beq a0, zero, fim

    add s0, a0, zero
    andi s0, s0, 1

    beq s0, zero, P
    bne s0, zero, I

    P:
      add s1, s1, a0       
      beq zero, zero, while
      
    I: 
      add s2, s2, a0
      beq zero, zero, while

  fim:
    addi t0, zero, 1
    sub a0, s2, s1
    ecall

  ret