main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
  ecall              # efetua a operacao de leitura de inteiro

  add s0, a0, zero
  andi s0, s0, 1

  beq s0, zero, P
  bne s0, zero, I

  P: 
    addi t0, zero, 2 # escolhe imprimir caracter
    addi a0, zero, 80 # Valor de P em ASCII
    ecall 
    beq zero, zero, fim

  I: 
    addi t0, zero, 2 
    addi a0, zero, 73 # Valor de I em ASCII
    ecall 
    beq zero, zero, fim

  fim:

  ret