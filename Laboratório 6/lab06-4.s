strlen:
    addi a0, zero, 20
    addi a1, zero, 0
    addi a4, zero, 48
    addi a3, zero, 20

    for:     
        add a5, s0, a1
        lb a2, a5, 0

        bne a2, a4, nzero
        addi a0, a0, -1

        nzero:

        addi a1, a1, 1
        bne a1, a3, for

    ret

TamanhoString:
    addi sp, sp, -24
    sw ra, sp, 20
    sw a0, sp, 0
     
    addi t0, zero, 6
    ecall

    mv s0, a0 
    call strlen
    
    lw s0, sp, 0
    lw ra, sp, 20
    addi sp, sp, 24
    
    ret 

main:
    addi sp, sp, -4
    sw ra, sp, 0

    call TamanhoString

    lw ra, sp, 0
    addi sp, sp, 4

    addi t0, zero, 1
    ecall

    ret