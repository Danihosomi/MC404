.data
  vetor: .space 40
.text 

main:
    addi sp, zero, -4
    sw ra, 0(sp)

    la a0, vetor
    li a1, 10 

    call LeVetor 
    
    mv s0, a0 
    li s1, 40
    li t0, 0
    li a0, 1
    forPrint:
        add t1, t0, s0 
        lw t2, 0(t1) 

        mv a1, t2 
        li a0, 1
        ecall 
        add a1, zero, 32
        li a0, 11 
        ecall
         
        addi t0, t0, 4
        bne t0, s1, forPrint
        

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

LeVetor:   # Le um vetor de inteiros colocando no parâmetro a0 e tamanho em a1
    addi  sp, sp, -36
    sw    s2, 32(sp)
    sw    s1, 28(sp)
    sw    s0, 24(sp)
    sw    ra, 20(sp)

    mv    s0, a0
    mv    s1, a1

    l2: blt   s1, zero, fiml2  
        li    a0, 4
        la    a1, mensagem1
        ecall 
        mv    a0, sp
        call  LeString
        mv    a0, sp
        call  ConverteNumero
        sw    a0, 0(s0)
        addi  s0, s0, 4
        addi  s1, s1, -1
        j     l2

    fiml2:
        lw    ra, 20(sp)
        lw    s0, 24(sp)
        lw    s1, 28(sp)
        sw    s2, 32(sp)
        addi  sp, sp, 36
    ret