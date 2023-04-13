.data
vetor: 
    .word 10
    .word 20
    .word 30
.text
main:
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)
    lw t0, s0, 0
    lw t1, s0, 4
    lw t2, s0, 8

    add t0, t0, t1
    add t0, t0, t2
    add a0, t0, zero
    
    addi t0, zero, 1
    ecall

    ret