main:

    comando:
        addi t0, zero, 4   
        
        ecall
        add s0, a0, zero 

        ecall
        add s1, a0, zero 

        beq s0, zero, fim 
        beq s1, zero, fim 


        addi t0, zero, 1
        bge s0, s1, printas0 
        blt s0, s1, printas1
        
        printas0:
            add a0, s0, zero 
            ecall 
            bne a0, zero, comando

        printas1:
            add a0, s1, zero 
            ecall 
            bne a0, zero, comando 

    fim:

    ret