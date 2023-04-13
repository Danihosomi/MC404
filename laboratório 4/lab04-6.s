main:
    while:
    addi t0, zero, 4
    ecall
    beq a0, zero, fim 
    addi t0, zero, 2


    add s4, zero, a0
    addi s2, zero, 28
    addi s1, zero, 10

    while2: 
        blt s2, zero, fim1 

        srl a0, s4, s2 
        andi a0, a0, 15  
        
        bltu a0, s1, number
        bgeu a0, s1, leter

        number:
            addi a0, a0, 48
            ecall
            j fimw

        leter:
            addi a0, a0, 55
            ecall 
            j fimw 

        fimw:
            addi  s2, s2, -4
            j while2 

    fim1:
        addi a0, zero, 104
        ecall
        j while 

    fim:
    ret 