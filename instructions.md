```c
void multiplyMatrix(int mat1[N][N], int mat2[N][N], int result[N][N]) {
    int i, j, k;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            result[i][j] = 0;
            for (k = 0; k < N; k++) {
                result[i][j] += mat1[i][k] * mat2[k][j];
            }
        }
    }
}
```

```s
.data
N:      .word   4       # Tamanho da matriz

.text
.globl multiplyMatrix
multiplyMatrix:
    # Argumentos:
    # $a0 = endereço base de mat1
    # $a1 = endereço base de mat2
    # $a2 = endereço base de result

    # Variáveis locais:
    # $t0 = i (contador do loop externo)
    # $t1 = j (contador do loop interno)
    # $t2 = k (contador do loop mais interno)
    # $t3 = endereço de mat1[i][k]
    # $t4 = endereço de mat2[k][j]
    # $t5 = endereço de result[i][j]
    # $t6 = mat1[i][k]
    # $t7 = mat2[k][j]
    # $t8 = result[i][j]

    li      $t0, 0          # Inicializa i = 0

outer_loop:
    li      $t1, 0          # Inicializa j = 0

inner_loop:
    li      $t8, 0          # Inicializa result[i][j] = 0
    li      $t2, 0          # Inicializa k = 0

innermost_loop:
    # Calcula endereço de mat1[i][k]
    mul     $t3, $t0, N     # i * N
    add     $t3, $t3, $t2   # i * N + k
    sll     $t3, $t3, 2     # (i * N + k) * 4 (4 bytes por inteiro)

    # Calcula endereço de mat2[k][j]
    mul     $t4, $t2, N     # k * N
    add     $t4, $t4, $t1   # k * N + j
    sll     $t4, $t4, 2     # (k * N + j) * 4 (4 bytes por inteiro)

    # Carrega mat1[i][k] e mat2[k][j] da memória
    lw      $t6, 0($a0, $t3)   # mat1[i][k]
    lw      $t7, 0($a1, $t4)   # mat2[k][j]

    # Calcula result[i][j] += mat1[i][k] * mat2[k][j]
    mul     $t6, $t6, $t7       # mat1[i][k] * mat2[k][j]
    add     $t8, $t8, $t6       # result[i][j] += mat1[i][k] * mat2[k][j]

    # Atualiza k
    addi    $t2, $t2, 1     # k++

    # Verifica se k < N
    blt     $t2, N, innermost_loop

    # Armazena result[i][j] em result
    mul     $t5, $t0, N     # i * N
    add     $t5, $t5, $t1   # i * N + j
    sll     $t5, $t5, 2     # (i * N + j) * 4 (4 bytes por inteiro)
    sw      $t8, 0($a2, $t5)   # result[i][j] = t8

    # Atualiza j
    addi    $t1, $t1, 1     # j++

    # Verifica se j < N
    blt     $t1, N, inner_loop

    # Atualiza i
    addi    $t0, $t0, 1     # i++

    # Verifica se i < N
    blt     $t0, N, outer_loop

    jr      $ra             # Retorna

```

- ✅ add
- ✅ sub
- mul $t1, $t2, $t3 => $t1 = $t2 \* $t3
- li (pseudo)
  - addiu $t1, $t0, 1000 => $t1 = $t0 + abs(1000)
- sll $t1, $t2, 10 => $t2 \* 2^10
- lw $t1, 100($t2) => $t1 = $t2[100]
- addi $t1, $t2, 10 => $t1 = $t2 + 10
- blt (pseudo)
  - slt $t1, $t2, $t3 => $t1 = $t2 < $t3 ? 1 : 0
  - bne $t1, $t2, label
- sw $t1, 100($t2) => $t2[100] = $t1
- jr
