# Multiplicação de matrizes 4x4
ori r1 r0 4
ori r2 r0 0
ori r3 r0 16
ori r4 r0 32
ori r5 r0 0
ori r6 r0 0     
sw r0 r4[0]     
ori r7 r0 0
mul r8 r5 r1    
add r8 r8 r7
add r8 r8 r2
lw r8 r8[0]
mul r9 r7 r1
add r9 r9 r6
add r9 r9 r3
lw r9 r9[0]
mul r8 r8 r9
lw r9 r4[0]
add r8 r8 r9
sw r8 r4[0]
addi r7 r7 1
blt r7 r1 32
addi r4 r4 1
addi r6 r6 1
blt r6 r1 24
addi r5 r5 1
blt r5 r1 20


# Programa compilado
A1000004 A2000000 A3000010 A4000020 A5000000 A6000000 80040000 A7000000 28510000 08870000 08820000 78080000 29710000 09960000 09930000 79090000 28890000 79040000 08890000 88040000 67070001 90710020 64040001 66060001 90610018 65050001 90510014


# Matrizes de teste
00000005 00000007 00000009 0000000A 00000002 00000003 00000003 00000008 00000008 0000000A 00000002 00000003 00000003 00000003 00000004 00000008 00000003 0000000A 0000000C 00000012 0000000C 00000001 00000004 00000009 00000009 0000000A 0000000C 00000002 00000003 0000000C 00000004 0000000A 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000D2 0000010B 000000EC 0000010F 0000005D 00000095 00000068 00000095 000000AB 00000092 000000AC 0000010C 00000069 000000A9 00000080 000000A9


# Programa com bolhas
ori r1 r0 4
ori r2 r0 0
ori r3 r0 16
ori r4 r0 32
ori r5 r0 0
ori r6 r0 0  
add r0 r0 r0   
add r0 r0 r0  
add r0 r0 r0  
sw r0 r4[0]     
ori r7 r0 0
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
mul r8 r5 r1 
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0     
add r8 r8 r7
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
add r8 r8 r2
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
lw r8 r8[0]
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
mul r9 r7 r1
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
add r9 r9 r6
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
add r9 r9 r3
lw r9 r9[0]
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
mul r8 r8 r9
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
lw r9 r4[0]
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
add r8 r8 r9
sw r8 r4[0]
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
addi r7 r7 1
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
blt r7 r1 32
add r0 r0 r0  
add r0 r0 r0  
addi r4 r4 1
addi r6 r6 1
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
blt r6 r1 24
add r0 r0 r0  
add r0 r0 r0  
addi r5 r5 1
add r0 r0 r0  
add r0 r0 r0  
add r0 r0 r0  
blt r5 r1 20