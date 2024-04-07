# MIPS-Like Processor

## Relatorio: Mips-Like-Classic

O processador monociclo de multiplicação de matrizes 4x4 feito no Logisim é um sistema que executa a multiplicação de matrizes 4x4 de forma sequencial e controlada. Aqui está um breve resumo das principais componentes desse sistema:

1. Banco de Registradores: Esta é uma memória de acesso rápido usada para armazenar dados temporários, como os elementos das matrizes, assim como os resultados intermediários e finais da multiplicação.
2. Unidade de Controle: Responsável por coordenar e controlar as operações realizadas pelo processador. Ela emite sinais de controle para os diversos componentes do processador, como a Unidade Lógica Aritmética (ULA), a Controle da ULA e o Banco de Registradores, para garantir que as instruções sejam executadas corretamente.
3. Controle da ULA: Esta unidade recebe sinais de controle da Unidade de Controle e os traduz em sinais específicos para controlar a ULA. Ela determina a operação aritmética a ser realizada pela ULA, com base na instrução sendo executada.
4. ULA (Unidade Lógica Aritmética): Responsável por realizar operações aritméticas e lógicas, como adição e multiplicação.
5. Memória: Armazena os dados, incluindo as matrizes que serão multiplicadas e os resultados da multiplicação. Neste caso, a memória pode ser utilizada para armazenar as matrizes de entrada e a matriz resultante.

![image](https://github.com/isaaclvf/mips-like/assets/116222412/2dc5c699-2c1f-4f0a-8199-edf5a0b34619)

## Relatorio: Mips-Like-Deluxe

A transição do processador monociclo para o pipeline é uma estratégia comum para melhorar o desempenho e a eficiência do processador, permitindo a execução de múltiplas instruções simultaneamente:
1. IF/ID (Instruction Fetch/Instruction Decode): Após a busca (IF) de uma instrução na memória de instruções, o registrador IF/ID armazena essa instrução enquanto a próxima instrução é buscada. Isso permite que a próxima instrução comece a ser decodificada enquanto a atual ainda está sendo executada.

2. ID/EX (Instruction Decode/Execution): Nesta etapa, a instrução é decodificada e os operandos são lidos dos registradores. Além disso, os sinais de controle são gerados para a próxima etapa de execução (EX). Isso permite que a unidade de execução (ULA) comece a processar a instrução enquanto a próxima instrução é decodificada.

3. EX/MEM (Execution/Memory Access): Aqui, a ULA executa a operação especificada pela instrução. Além disso, nesta etapa, são calculados os endereços de memória, e as operações de acesso à memória são realizadas (leitura ou escrita).

4. MEM/WB (Memory Access/Write Back): Esta etapa envolve a finalização da operação de acesso à memória, incluindo a leitura ou escrita de dados na memória. Além disso, os resultados finais são escritos de volta nos registradores ou nos registradores intermediários.

![image](https://github.com/isaaclvf/mips-like/assets/116222412/acb6c411-0551-4ed5-b8a7-b3f500f2d7db)
![image](https://github.com/isaaclvf/mips-like/assets/116222412/4afe7134-5443-4abc-8b1a-48840a32047c)

A adição dos registradores intermediários (buffers de pipeline) entre cada estágio do pipeline ajuda a evitar condições de corrida e garantir que as instruções sejam executadas corretamente em cada estágio. Além disso, a introdução de três registradores antes de escrever no banco de registradores permite que a escrita no banco de registradores seja retardada, evitando bolhas no pipeline após instruções como sw (store word).

![image](https://github.com/isaaclvf/mips-like/assets/116222412/9bfef2d3-b2b3-488f-91c2-2f8ac70e232e)

