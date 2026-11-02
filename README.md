# MIPS Disassembler

An academic disassembler written in MIPS assembly and designed to run in the MARS simulator. It reads machine-code instructions from a binary file and writes their addresses, hexadecimal encodings and decoded assembly to a text file.

## Files

| File | Purpose |
| --- | --- |
| [trab.asm](trab.asm) | Disassembler implementation |
| [arquivoLeitura.bin](arquivoLeitura.bin) | Included binary input |
| [relatorioBaratto.odt](relatorioBaratto.odt) | Project report |

The program reads `arquivoLeitura.bin` and writes `saida.txt`. Both names are defined as strings in the source; the output is generated when the program runs.

## Run with MARS

Requires Java and a local copy of the MARS MIPS simulator.

1. Clone the repository and keep the assembly and input file together:

```bash
git clone https://github.com/JoaoVtrxx/Disassembler-.git
cd Disassembler-
```

2. Launch MARS from this directory so relative file paths resolve here. For a downloaded simulator JAR, use `java -jar /path/to/Mars.jar` with its actual path.
3. Open `trab.asm` in MARS, assemble it and run it.
4. Inspect the generated `saida.txt` in the working directory.

If MARS reports that it cannot open the input, check its working directory or change the `nome_do_arquivo` string in the assembly. Change `localArq` if you want another output path.

## Output format

Illustrative rows, based on the example in the original project README:

| Address | Machine instruction | Assembly |
| --- | --- | --- |
| `0x00400000` | `0x27BDFFF8` | `addiu $sp, $sp, -8` |
| `0x00400004` | `0x24080005` | `addiu $t0, $zero, 5` |
| `0x00400008` | `0xAFA80004` | `sw $t0, 4($sp)` |

Instruction decoding is limited to the cases implemented in `trab.asm`; this project is not a complete MIPS ISA implementation. The report contains the academic context and implementation discussion.
