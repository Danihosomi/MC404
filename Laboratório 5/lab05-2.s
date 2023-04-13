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

    addi t0, t0, 1
    addi t1, t1, 1
    addi t2, t2, 1

    sw t0, s0, 0
    sw t1, s0, 4
    sw t2, s0, 8

    add a0, t0, zero 
    addi t0, zero, 1
    ecall

    add a0, t1, zero 
    ecall

    add a0, t2, zero 
    ecall

    ret