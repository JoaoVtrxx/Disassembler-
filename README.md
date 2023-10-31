# Disassembler

Este é um programa disassembler (desmontador ou
desassemblador) para o processador MIPS. O programa é deve ser escrito em assembly para o
processador MIPS e simulado no programa MARS. O programa lê um arquivo com código em
linguagem de máquina; Realiza a desmontagem e escreve o resultado do processamento
em um arquivo texto. Para cada instrução em linguagem de máquina, a saída do programa deve
gerar, pelo menos, o endereço da instrução desmontada, a instrução em linguagem de máquina
e a instrução em linguagem assembly. A seguir, apresentamos como exemplo, parte do arquivo
resultado do processamento:

| Endereço  | Instrução | assembly |
| ------------- | ------------- | ------------- |
| 0x00400000  | 0x27BDFFF8  | addiu $sp, $sp -8  | 
| 0x00400004  | 0x24080005  | addiu $t0, $zero, 5  |
| 0x00400008  | 0xAFA80004  | sw $t0, 4($sp) |
| ...  | ...  | ... |
