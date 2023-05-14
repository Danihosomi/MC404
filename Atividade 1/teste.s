main:
    li a0, 1
    li a1, 0b1100000000000000
    ecall 
    li a2, 0b1100000000000000
    ecall
    slli a1, a1, 2
    ecall
    li a1, 5
    ecall

    li a0, 1
    mv a1, a2
    ecall

    fim:
    addi a0, zero, 10
    ecall
    ret