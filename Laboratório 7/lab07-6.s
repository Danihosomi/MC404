.data
vetor: .word 0x00FF0000, 0x000000FF, 0x0000FF00, 0x00FF00FF
# 0, 4, 8, 12
.text
main: 
    la s0, vetor  
    add t0, zero, zero 
    addi t1, zero, 16

    li a0, 0x101
    li a1, 0x00FFFFFF
    ecall

    while:
        bge t0, t1, fim
        
        add s1, s0, t0 
        lw a2, 0(s1)

        li a0 0x100
        li a1, 0x00020002
        ecall 
        
        li a1, 0x00020003
        ecall 
        
        li a1, 0x00020004
        ecall 
        
        li a1, 0x00020005
        ecall 
        
        li a1, 0x00020006
        ecall 
        
        li a1, 0x00020007
        ecall 
        
        li a1, 0x00030007
        ecall 
        
        li a1, 0x00040007
        ecall 

        
        li a1, 0x00050007
        ecall

        
        li a1, 0x00060007
        ecall

        
        li a1, 0x00070007
        ecall


        li a1, 0x00070006
        ecall

        li a1, 0x00070005
        ecall

        li a1, 0x00070004
        ecall

        li a1, 0x00070003
        ecall

        li a1, 0x00070002
        ecall

        li a1, 0x00060002
        ecall

        li a1, 0x00050002
        ecall

        li a1, 0x00040002
        ecall

        li a1, 0x00030002
        ecall

        addi t0, t0, 4
        j while

    fim:
        addi a0, zero, 10
        ecalls