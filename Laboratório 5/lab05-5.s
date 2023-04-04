.data
string: 
    .word 0
    .word 0 
    .word 0
    .word 0
    .word 0
.text
main:
    lui s0, %hi(string)
    addi s0, s0, %lo(string)
    addi a1, zero, 20

    addi t0, zero, 6
    ecall 

    mv s0, a0

    add a2, zero, zero
    addi a4, zero, 48
    addi a3, zero, 20
    for:     
        add s1, s0, a2
        lb s2, s1, 0

        bne s2, a4, nzero
        addi a1, a1, -1

        nzero:

        addi a2, a2, 1
        bne a2, a3, for
    
    addi t0, zero, 1
    add a0, a1, zero
    ecall

    ret