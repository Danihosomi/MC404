.data
vetor1:
    .word 1, 2, 3, 4, 5
vetor2:
    .word 6, 7, 8, 9, 10
vetorF: 
    .word 0, 0, 0, 0, 0
.text
main:
    la s0, vetor1
    la s1, vetor2
    la s2, vetorF 

    addi a7, zero, 5
    addi a6, zero, 0
    addi t0, zero, 1

    for:
        add s3, s0, a6 
        lw s3, 0(s3)

        add s4, s1, a6 
        lw s4, 0(s4)

        add s5, s2, a6

        add s6, s3, s4 

        sw s6, 0(s5)
        li a0, 1
        add a1, s6, zero
        ecall

        addi a6, a6, 4
        addi a7, a7, -1
        bne a7, zero, for 


    fimMain:
        addi a0, zero, 10
        ecall