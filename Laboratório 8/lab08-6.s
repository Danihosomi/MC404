.data
    str1: .string "Rodolfo Jardins"
    str2: .space 2
.text

main:
    addi sp, zero, -4
    sw ra, 0(sp)

    la a0, str1 
    call strrev

    lw ra, 0(sp)
    addi sp, sp, 4

    li a0, 10
    ecall
    ret

strrev:
    addi sp, sp, -4
    sw ra, 0(sp)
    
    mv s0, a0
    call strlen 
    mv t1, a0

    la a1, str2
    addi t1, t1, -1
    while1:
        blt t1, zero, fim1
        add t0, t1, s0 
        lb t2, 0(t0)
        
        sw t2, 0(a1)
        sw zero, 1(a1)
        
        addi a0, zero, 4
        ecall

        addi t1, t1, -1
        j while1 

    fim1:
    mv a0, s0
    lw ra, 0(sp)
    addi sp, sp, 4
    ret 

strlen:
    mv a1, a0   
    add a0, zero, zero
    
    while:
        add t0, a0, a1 
        lb t1, 0(t0)
        beq t1, zero, fim 
        addi a0, a0, 1
        j while 

    fim:
    ret     