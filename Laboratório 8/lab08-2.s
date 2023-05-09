.data
    str1: .space 20
    str2: .string "Rodolfo Jardins"
.text

main:
    addi sp, zero, -4
    sw ra, 0(sp)


    la a1, str1 
    la a2, str2
    call strcpy
    
    addi a0, zero, 4
    ecall

    lw ra, 0(sp)
    addi sp, sp, 4

    li a0, 10
    ecall
    ret

strcpy:
    add t0, zero, zero 

    while:
        add t1, t0, a2 
        lbu t2, 0(t1)
        add t3, t0, a1 
        beq t2, zero, fim
        sw t2, 0(t3) 

        addi t0, t0, 1
        j while 
    fim:
        sw zero, 0(t3)
    ret