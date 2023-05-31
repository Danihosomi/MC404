# RA: 248255

.data

    numeros: .word 0b00000000000000111, 0b00000000000000001, 0b00000000000000111, 0b00000000000000100, 0b00000000000000111 # 2
             .word 0b00000000000000101, 0b00000000000000101, 0b00000000000000111, 0b00000000000000001, 0b00000000000000001 # 4
             .word 0b00000000000000111, 0b00000000000000101, 0b00000000000000111, 0b00000000000000101, 0b00000000000000111 # 8
             .word 0b00000000000000111, 0b00000000000000001, 0b00000000000000111, 0b00000000000000100, 0b00000000000000111 # 2
             .word 0b00000000000000111, 0b00000000000000100, 0b00000000000000111, 0b00000000000000001, 0b00000000000000111 # 5
             .word 0b00000000000000111, 0b00000000000000100, 0b00000000000000111, 0b00000000000000001, 0b00000000000000111 # 5
.text
main:
    addi sp, zero, -4
    sw ra, 0(sp)

    li s0, 0 # linha 7
    li s1, 0 # linha 6
    li s2, 0 # linha 5
    li s3, 0 # linha 4
    li s4, 0 # linha 3
    la s5, numeros # guarda o vetor de números
    li s6, 120 
    add s7, zero, zero
    
    while:
        li a0, 1000
        call Pausa
        mv a0, s0
        mv a1, s1
        mv a2, s2
        mv a3, s3
        mv a4, s4
        call AtualizaRobo

        andi t6, s0, 15
        bne t6, zero, semNumero # caso ainda não consigamos colocar o número na tela
        beq s7, s6, semNumero # caso todos os números já foram passados 

        add t0, s5, s7 
        lw a0, 0(t0)
        lw a1, 4(t0)
        lw a2, 8(t0)
        lw a3, 12(t0)
        lw a4, 16(t0)

        or s0, s0, a0
        or s1, s1, a1
        or s2, s2, a2
        or s3, s3, a3
        or s4, s4, a4
        addi s7, s7, 20
        j while

        semNumero: # apenas desloca todos os números para esquerda
            mv a0, s0
            mv a1, s1
            mv a2, s2
            mv a3, s3
            mv a4, s4
            call Deslocar
            mv s0, a0
            mv s1, a1
            mv s2, a2
            mv s3, a3
            mv s4, a4

            bne s0, zero, while

    # aqui termino de atualizar a tela
    li a0, 2000 
    call Pausa
    mv a0, s0
    mv a1, s1
    mv a2, s2
    mv a3, s3
    mv a4, s4
    call AtualizaRobo

    lw ra, 0(sp)
    addi sp, sp, 4

    addi a0, zero, 10
    ecall
    ret


Pausa: 
    li t6, 0
    
    whilePausa:
        addi t6, t6, 1
        bne t6, a0, whilePausa

    ret

Deslocar: # Desloco os números para a esquerda da Tela do Robozinho (left shift)
    li t6, 0b11111111111111111
    slli a0, a0, 1
    slli a1, a1, 1
    slli a2, a2, 1
    slli a3, a3, 1
    slli a4, a4, 1

    and a0, a0, t6
    and a1, a1, t6
    and a2, a2, t6
    and a3, a3, t6
    and a4, a4, t6

    ret

AtualizaRobo: # Atualizo a tela do robozinho
    addi sp, sp, -20
    sw s0, 0(sp) 
    sw s1, 4(sp) 
    sw s2, 8(sp) 
    sw s3, 12(sp) 
    sw s4, 16(sp) 

    mv s0, a0
    mv s1, a1
    mv s2, a2
    mv s3, a3
    mv s4, a4

    li a0, 0x110
    li a1, 3
    mv a2, s4
    ecall
    li a1, 4
    mv a2, s3
    ecall
    li a1, 5
    mv a2, s2
    ecall
    li a1, 6
    mv a2, s1
    ecall
    li a1, 7
    mv a2, s0
    ecall

    lw s0, 0(sp) 
    lw s1, 4(sp) 
    lw s2, 8(sp) 
    lw s3, 12(sp) 
    lw s4, 16(sp) 
    addi sp, sp, 20
    
    ret
