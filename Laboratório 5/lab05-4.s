.data
matriz: 
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
.text

main:
    lui s0, %hi(matriz)
    addi s0, s0, %lo(matriz)

    addi s9, zero, 1
    addi s1, zero, 0
    addi s4, zero, 0
    for1:
        addi s8, zero, 2
        for2:
            add s2, s0, s1 
            lw s3, s2, 0

            add s3, zero, s4         
            sw s3, s2, 0 

            addi s1, s1, 4
            addi s8, s8, -1
            addi s4, s4, 1

            bge s8, zero, for2 
        
        addi s9, s9, -1
        bge s9, zero, for1 

    ret 