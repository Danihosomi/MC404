main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
  ecall              # efetua a operacao de leitura de inteiro

  add s0, a0, zero

  ecall

  xor a0, a0, s0

  addi t0, zero, 1

  ecall


  ret