main:
  addi t0, zero, 4   # escolhe a operacao de leitura de inteiro (4)  
  ecall              # efetua a operacao de leitura de inteiro
  add s1, a0, zero
  addi s0, zero, 30
  addi s3, zero, 1

  addi t0, zero, 2
  for: 
    sll s2, s3, s0 

    bgeu s2, s1, nosub
    bltu s2, s1, sub

    sub:
      addi a0, zero, 49
      sub s1, s1, s2
      ecall
      beq zero, zero, condicoes

    nosub:  
      addi a0, zero, 48
      ecall
      beq zero, zero, condicoes

    condicoes:
      addi s0, s0, -1
      bge s0, zero, for
      blt s0, zero, fim    


  fim:

  ret