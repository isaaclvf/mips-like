```s
    .data
n:  .word 4
a:  .word 5, 7, 9, 10, 2, 3, 3, 8, 8, 10, 2, 3, 3, 3, 4, 8
b:  .word 3, 10, 12, 18, 12, 1, 4, 9, 9, 10, 12, 2, 3, 12, 4, 10
c:  .space 64  # espaço para a matriz c[4][4]

    .text
    .globl main
main:
    la $t1, n
    lw $t1, 0($t1)  # $t1 = n
    la $t2, a
    la $t3, b
    la $t4, c

    # i loop
    li $t5, 0  # $t5 = i
i_loop:
    # j loop
    li $t6, 0  # $t6 = j
j_loop:
    sw $t0, 0($t4)  # c[i][j] = 0

    # k loop
    li $t7, 0  # $t7 = k
k_loop:
    mul $t8, $t5, $t1  # $t8 = i * n
    add $t8, $t8, $t7  # $t8 = i * n + k
    sll $t8, $t8, 2  # $t8 *= 4 (para obter o deslocamento em bytes)
    add $t8, $t8, $t2  # $t8 = &a[i][k]
    lw $t8, 0($t8)  # $t8 = a[i][k]

    mul $t9, $t7, $t1  # $t9 = k * n
    add $t9, $t9, $t6  # $t9 = k * n + j
    sll $t9, $t9, 2  # $t9 *= 4 (para obter o deslocamento em bytes)
    add $t9, $t9, $t3  # $t9 = &b[k][j]
    lw $t9, 0($t9)  # $t9 = b[k][j]

    mul $t8, $t8, $t9  # $t8 = a[i][k] * b[k][j]
    lw $t9, 0($t4)  # $t9 = c[i][j]
    add $t8, $t8, $t9  # $t8 = a[i][k] * b[k][j] + c[i][j]
    sw $t8, 0($t4)  # c[i][j] = a[i][k] * b[k][j] + c[i][j]

    addi $t7, $t7, 1  # k++
    blt $t7, $t1, k_loop  # se k < n, vá para k_loop

    addi $t4, $t4, 4  # avança para a próxima célula em c
    addi $t6, $t6, 1  # j++
    blt $t6, $t1, j_loop  # se j < n, vá para j_loop

    addi $t5, $t5, 1  # i++
    blt $t5, $t1, i_loop  # se i < n, vá para i_loop

    jr $ra
```