main:
    addi sp, zero, -4
    sw ra, 0(sp)

    call LeNumero
    mv a1, a0
    li a0, 1 
    ecall 

    lw ra, 0(sp)
    addi sp, sp, 4

    li a0, 10
    ecall
    ret

LeNumero:
    add a2, zero, zero
    li t1, 10
    li t2, 1    
    li a0, 0x130
    ecall 

    while:
        li a0, 0x131
        ecall 
        
        beq a0, zero, fim
        beq a0, t2, fimw

        addi a1, a1, -48
        mul a2, a2, t1 
        add a2, a2, a1

        fimw:
        j while

    fim:
        mv a0, a2
    ret 