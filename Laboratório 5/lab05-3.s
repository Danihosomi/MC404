.rodata 
vetor1:
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
vetor2:
    .word 6
    .word 7
    .word 8
    .word 9
    .word 10
.data
vetorF: 
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text
main:
    lui s0, %hi(vetor1)
    addi s0, s0, %lo(vetor1)

    lui s1, %hi(vetor2)
    addi s1, s1, %lo(vetor2)

    lui s2, %hi(vetorF)
    addi s2, s2, %lo(vetorF)

    addi a7, zero, 5
    addi a6, zero, 0
    addi t0, zero, 1

    for:
        add s3, s0, a6 
        lw s3, s3, 0

        add s4, s1, a6 
        lw s4, s4, 0

        add s5, s2, a6

        add s6, s3, s4 

        sw s6, s5, 0
        add a0, s6, zero 
        ecall

        addi a6, a6, 4
        addi a7, a7, -1
        bne a7, zero, for 


    ret 