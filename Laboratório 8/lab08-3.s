.data 
    str1: .space 20 
.text 

main:
    addi sp, zero, -4
    sw ra, 0(sp)

    la a1, str1
    call gets

    addi a0, zero, 4
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4
    li a0, 10
    ecall
    ret

gets:
    add t0, zero, zero
    mv a2, a1
    li t2, 0x00
    li t3, 0x01
    
    li a0, 0x130
    ecall 

    while:
        li a0, 0x131
        ecall 
        add t1, t0, a2 
        
        beq a0, t2, fim
        beq a0, t3, fimw

        sb a1, 0(t1)

        addi t0, t0, 1
        fimw:
        j while

    fim:
        sw zero, 0(t1)
        mv a1, a2
    ret 