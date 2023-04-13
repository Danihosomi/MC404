SomaVetor:
for:
    beq  a0, zero, fim
    lw   t0, a1, 0
    add t0, t0, a2 
    sw   t0, a1, 0
    addi a1, a1, 4
    addi a0, a0, -1
    j    for

fim:
    ret
    
.data
vetor: 
    .word 1
    .word 2 
    .word 2
    .word 4
    .word 5
.text

main:
    addi a0, a0, 5 # Tamanho do vetor
    
    lui a1, %hi(vetor)
    addi a1, a1, %lo(vetor)
    
    addi a2, a2, 10 # Fator Soma
    
    addi sp, sp, -4 # Lembrar pra onde volta 
    sw ra, sp, 0

    call SomaVetor

    lw ra, sp, 0
    addi sp, sp, 4

    ret 