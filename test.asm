ori r10 r0 0        // r10 tem o endereço da matriz 1
ori r11 r0 16       // r11 tem o endereço da matriz 2
ori r12 r0 32       // r12 tem o endereço da matriz 3 (resultado)
ori r15 r0 4        // N = 4
ori r1 r0 0         // Inicializa i = 0
ori r2 r0 0         // Inicializa j = 0                             // outer_loop
ori r9 r0 0         // Inicializa result[i][j] = 0                  // inner_loop 
ori r3 r0 0         // Inicializa k = 0
mul r4 r1 r15       // i * N (Calcula endereço de mat1[i][k])       // innermost_loop
add r4 r4 r3        // i * N + k
sll r4 r4 2         // (i * N + k) * 4 (4 bytes por inteiro)
mul r5 r3 r15       // k * N (Calcula endereço de mat2[k][j])
add r5 r5 r2        // k * N + j
sll r5 r5 2         // (k * N + j) * 4 (4 bytes por inteiro)
add r13 r10 r4      // Deslocamento da matriz 1
add r14 r11 r5      // Deslocamento da matriz 2
lw r7 r13[0]        // mat1[i][k] (Carrega mat1[i][k] e mat2[k][j] da memória)
lw r8 r14[0]        // mat2[k][j]
mul r7 r7 r8        // mat1[i][k] * mat2[k][j] (Calcula result[i][j] += mat1[i][k] * mat2[k][j])
add r9 r9 r7        // result[i][j] += mat1[i][k] * mat2[k][j]
addi r3 r3 1        // k++ (Atualiza k)
blt r3 r15 32       // Verifica se k < N e pula para innermost_loop
mul r6 r1 r15       // i * N (Armazena result[i][j] em result)
add r6 r6 r2        // i * N + j
sll r6 r6 2         // (i * N + j) * 4 (4 bytes por inteiro)
add r13 r11 r6      // Deslocamento da matriz result
sw r9 r13[0]        // result[i][j] = t8
addi r2 r2 1        // j++ (Atualiza j)
blt r2 r15 24       // Verifica se j < N e pula para inner_loop
addi r1 r1 1        // i++ (Atualiza i)
blt r1 r15 20       // Verifica se i < N e pula para outer_loop