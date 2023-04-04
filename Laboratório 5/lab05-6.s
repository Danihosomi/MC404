.data
vetor: 
    .word 1
    .word 2 
    .word 2
    .word 4
    .word 4
    .word 5
    .word 10
    .word 12
    .word 10
    .word 15
.text
main:
    lui s0, %hi(vetor)
    addi s0, s0, %lo(vetor)

    lw s8, s0, 0
    lw s9, s0, 4

    addi s6, zero, 8
    addi s7, zero, 40
    for:     
        add s1, s0, s6
        lw s2, s1, 0

        blt s2, s8, menorr
        beq s2, s8, comparey
        bge s2, s8, change

        comparey:
            addi s6, s6, 4 
            add s1, s0, s6 
            lw s3, s1, 0
            blt s3, s9, menor
            add s8, zero, s2
            add s9, zero, s3 
            beq zero, zero, menor

        change:
            add s8, zero, s2 
            addi s6, s6, 4 
            add s1, s0, s6 
            lw s2, s1, 0
            add s9, zero, s2 
            addi s6, s6, 4
            bne s6, s7, for
        
        menor:
            addi s6, s6, 4
            bne s6, s7, for
            beq s6, s7, fim

        menorr:
        addi s6, s6, 8
        bne s6, s7, for
    
    fim:
        addi t0, zero, 1
        add a0, s8, zero 
        ecall 
        add a0, s9, zero
        ecall 

    ret