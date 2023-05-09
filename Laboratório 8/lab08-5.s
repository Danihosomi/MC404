strcmp:
    mv a2, a0 
    add t0, zero, zero 

    while:
        add t1, t0, a1
        add t2, t0, a2 

        lbu t3, 0(t1)
        lbu t4, 0(t2)

        blt t3, t4, menor
        bne t3, t4, maior 
        beq t3, zero, igual

        addi t0, t0, 1 
        j while

    igual:
        li a0, 0
        j fim
    menor:
        li a0, 1
        j fim 
    maior:
        li a0, -1
        j fim 
    fim:
    ret

strcat:
    mv a2, a1
    mv a1, a0 
    la a0, str1 
    add t2, zero, zero
    add t3, zero, zero

    while:
        add t0, t2, a1 
        lb t1, 0(t0)
        
        beq t1, zero, fimw
        
        add t0, t2, a0 
        sb t1, 0(t0)

        addi t2, t2, 1
        j while 

    fimw:

    while1:
        add t0, t3, a2 
        lb t1, 0(t0)
        add t0, t2, a0

        beq t1, zero, fims
        
        sb t1, 0(t0)

        addi t3, t3, 1
        addi t2, t2, 1
        j while1 

    fims:
        sb zero, 0(t0)
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