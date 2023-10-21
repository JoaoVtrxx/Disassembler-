.data   
        ################ DADOS ARQUIVO LEITURA: ##########################################################


        descritor_arquivo_leitura: .word 0                    # DESCRITOR DO ARQUIVO: INTEIRO NAO NEGATIVO
        nome_do_arquivo: .asciiz "arquivoLeitura.bin"         # NOME DO ARQUIVO
        .align 2                                    
                                                    
        buffer_leitura: .space 32                             # BUFFER PARA LEITURA DO ARQUIVO

        ################ DADOS ARQUIVO ESCRITA: ##########################################################

        descritor_arquivo_escrita: .word 0                    # DESCRITOR DO ARQUIVO: INTEIRO NAO NEGATIVO
        localArq: .asciiz "saida.txt"                         # NOME DO ARQUIVO GERADO

        endereco_instrucoes: .word 0x00400000                 # INTEIRO PARA ENDERECO DAS INSTRUCOES  
        endereco_instrucoes_string: .ascii "0xFFFFFFFF \0"    # STRING PARA ENDERECO DAS INSTRUCOES
        codigo_hexadecimal_string: .ascii "0xFFFFFFFF \0"     # STRING PARA CODIGO DA INSTRUCAO COMPLETA
        imediato: .ascii "0xFFFFFFFF \0"                      # STRING PARA IMEDIATO DA INSTRUCAO
        nova_linha: .asciiz "\n"                              # STRING DE CARACTER NOVA LINHA
        abre_parenteses:.asciiz "("                           # STRING DE CARACTER ABRE PARENTESES
        fecha_parenteses:.asciiz ")"                          # STRING DE CARACTER FECHA PARENTESES

        ############### DADOS GERAIS ARQUIVOS ##########################################################

        str_erro_abertura_arquivo: .asciiz "O arquivo nao pode ser aberto\n"  # STRING ERRO 1
        str_erro_leitura_registro: .asciiz "Erro de leitura do arquivo"       # STRING ERRO 2

        ###############  DECODIFICADOR #################################################################

        stringNaoAchouInstrucao: .asciiz "instrucao nao encontrada... "       # STRING ERRO FUNCAO

        codigoCompleto: .word 0         #$s5                   #INTEIRO CODIGO COMPLETO INSTRUCAO
	instruc_parte_1: .word 0	#$s0                   #INTEIRO COM PRIMEIRA PARTE DA INSTRUCAO
	instruc_parte_2: .word 0	#$s1                   #INTEIRO COM SEGUNDA PARTE DA INSTRUCAO
	instruc_parte_3: .word 0	#$s2                   #INTEIRO COM TERCEIRA PARTE DA INSTRUCAO
	instruc_parte_4: .word 0	#$s3                   #INTEIRO COM QUARTA PARTE DA INSTRUCAO
	instruc_parte_5: .word 0	#$s4                   #INTEIRO COM QUINTA PARTE DA INSTRUCAO

        ############# VETORES ##########################################################################
	
	instrucoes:
	instruc1: .ascii "bltz \0"
	instruc2: .ascii "j \0"
	instruc3: .ascii "jal \0"
	instruc4: .ascii "beq \0"
	instruc5: .ascii "bne \0"
	instruc6: .ascii "blez \0"
	instruc7: .ascii "bgtz \0"
	instruc8: .ascii "addi \0"
	instruc9: .ascii "addiu \0"
	instruc10: .ascii "slti \0"
	instruc11: .ascii "sltiu \0"
	instruc12: .ascii "andi \0"
	instruc13: .ascii "ori \0"
	instruc14: .ascii "xori \0"
	instruc15: .ascii "lui \0"
	instruc16: .ascii "instrucao nao encontrada... \0"
	instruc17: .ascii "instrucao nao encontrada... \0"
	instruc18: .ascii "instrucao nao encontrada... \0"
	instruc19: .ascii "instrucao nao encontrada... \0"
	instruc20: .ascii "beql \0"
	instruc21: .ascii "bnel \0"
	instruc22: .ascii "blezl \0"
	instruc23: .ascii "bgtzl \0"
	instruc24: .ascii "instrucao nao encontrada... \0"
	instruc25: .ascii "instrucao nao encontrada... \0"
	instruc26: .ascii "instrucao nao encontrada... \0"
	instruc27: .ascii "instrucao nao encontrada... \0"
	instruc28: .ascii "mul \0"
	instruc29: .ascii "instrucao nao encontrada... \0"
	instruc30: .ascii "instrucao nao encontrada... \0"
	instruc31: .ascii "instrucao nao encontrada... \0"
	instruc32: .ascii "lb \0"
	instruc33: .ascii "lh \0"
	instruc34: .ascii "lwl \0"
	instruc35: .ascii "lw \0"
	instruc36: .ascii "lbu \0"
	instruc37: .ascii "lhu \0"
	instruc38: .ascii "lwr \0"
	instruc39: .ascii "instrucao nao encontrada... \0"
	instruc40: .ascii "sb \0"
	instruc41: .ascii "sh \0"
	instruc42: .ascii "swl \0"
	instruc43: .ascii "sw \0"

	vetor_instrucoes: .word instruc1, instruc2, instruc3, instruc4, instruc5, instruc6, instruc7, instruc8, instruc9, instruc10, instruc11, instruc12, instruc13, instruc14, instruc15, instruc16, instruc17, instruc18, instruc19, instruc20, instruc21, instruc22, instruc23, instruc24, instruc25, instruc26, instruc27, instruc28, instruc29, instruc30, instruc31, instruc32, instruc33, instruc34, instruc35, instruc36, instruc37, instruc38, instruc39, instruc40, instruc41, instruc42, instruc43

	function:
	func0: .ascii "sll \0"
	func1: .ascii "Comando n existe\0"
	func2: .ascii "slr \0"
	func3: .ascii "sra \0"
	func4: .ascii "sllv \0"
	func5: .ascii "instrucao nao encontrada... \0"
	func6: .ascii "srlv \0"
	func7: .ascii "srav \0"
	func8: .ascii "jr \0"
	func9: .ascii "jalr \0"
	func10: .ascii "instrucao nao encontrada... \0"
	func11: .ascii "instrucao nao encontrada... \0"
	func12: .ascii "syscall \0"
	func13: .ascii "break \0"
	func14: .ascii "instrucao nao encontrada... \0"
	func15: .ascii "instrucao nao encontrada... \0"
	func16: .ascii "mfhi \0"
	func17: .ascii "mfhi \0"
	func18: .ascii "mflo \0"
	func19: .ascii "mtlo \0"
	func20: .ascii "instrucao nao encontrada... \0"
	func21: .ascii "instrucao nao encontrada... \0"
	func22: .ascii "instrucao nao encontrada... \0"
	func23: .ascii "instrucao nao encontrada... \0"
	func24: .ascii "mulT \0"
	func25: .ascii "multu \0"
	func26: .ascii "div \0"
	func27: .ascii "divu \0"
	func28: .ascii "instrucao nao encontrada... \0"
	func29: .ascii "instrucao nao encontrada... \0"
	func30: .ascii "instrucao nao encontrada... \0"
	func31: .ascii "instrucao nao encontrada... \0"
	func32: .ascii "add \0"
	func33: .ascii "addu \0"
	func34: .ascii "sub \0"
	func35: .ascii "subu \0"
	func36: .ascii "and \0"
	func37: .ascii "or \0"
	func38: .ascii "xor \0"
	func39: .ascii "nor \0"
	func40: .ascii "instrucao nao encontrada... \0"
	func41: .ascii "instrucao nao encontrada... \0"
	func42: .ascii "slt \0"
	func43: .ascii "slt \0"
	vetor_functions: .word func0, func1, func2, func3, func4, func5, func6, func7, func8, func9, func10, func11, func12, func13, func14, func15, func16, func17, func18, func19, func20, func21, func22, func23, func24, func25, func26, func27, func28, func29, func30, func31, func32, func33, func34, func35, func36, func37, func38, func39, func40, func41, func42, func43
	
	registradores:
	reg0: .ascii "$zero \0"
	reg1: .ascii "$at \0"
	reg2: .ascii "$v0 \0"
	reg3: .ascii "$v0 \0"
	reg4: .ascii "$a0 \0"
	reg5: .ascii "$a1 \0"
	reg6: .ascii "$a2 \0"
	reg7: .ascii "$a3 \0"
	reg8: .ascii "$t0 \0"
	reg9: .ascii "$t1 \0"
	reg10: .ascii "$t2 \0"
	reg11: .ascii "$t3 \0"
	reg12: .ascii "$t4 \0"
	reg13: .ascii "$t5 \0"
	reg14: .ascii "$t6 \0"
	reg15: .ascii "$t7 \0"
	reg16: .ascii "$s0 \0"
	reg17: .ascii "$s1 \0"
	reg18: .ascii "$s2 \0"
	reg19: .ascii "$s3 \0"
	reg20: .ascii "$s4 \0"
	reg21: .ascii "$s5 \0"
	reg22: .ascii "$s6 \0"
	reg23: .ascii "$s7 \0"
	reg24: .ascii "$t8 \0"
	reg25: .ascii "$t9 \0"
	reg26: .ascii "n existe \0"
	reg27: .ascii "n existe \0"
	reg28: .ascii "$gp \0"
	reg29: .ascii "$sp \0"
	reg30: .ascii "$fp \0"
	reg31: .ascii "$ra \0"
	vetor_registradores: .word reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31

        .eqv ESCREVE_ARQUIVO 15
        .eqv ABRE_ARQUIVO 13
.text

init:
        jal     main                    # EXECUTA PROCEDIMENTO PRINCIPAL
finit:
        move	$a0, $v0            # $a0 = CODIGO DE RETORNO DO PROGRAMA
        li      $v0, 17                 # $v0 = SERVICO EXIT 2
        syscall                         # CHAMADA AO SISTEMA            

arquivo_abrir_leitura:

        li      $a1, 0                  # $a1 = FLAG = 0: ABRIR ARQUIVO PARA LEITURA
        li      $a2, 0                  # $a2 = MODO (NAO USADO)
        li      $v0, ABRE_ARQUIVO       # $v0 = SERVICO 13: ABRIR ARQUIVO PARA LEITURA OU ESCRUTA
        syscall                         # CHAMADA AO SISTEMA

        jr	    $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

arquivo_abrir_escrita:

        li $v0, ABRE_ARQUIVO             # $v0 = SERVICO 13: ABRIR ARQUIVO PARA LEITURA OU ESCRUTA  
        la $a1, 1                        # $a1 = FLAG = 1: ABRIR ARQUIVO PARA ESCRITA
        syscall                          # CHAMADA AO SISTEMA

        jr	    $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

arquivo_fechar:

        la      $t0, descritor_arquivo_leitura # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO LEITURA
        lw      $a0, 0($t0)                    # $a0 = DESCRITOR DO ARQUIVO LEITURA
        li      $v0, 16                        # $v0 = SERVICO 16: FECHA O ARQUIVO COM DESCRITOR EM $a0
        syscall                                # CHAMADA AO SISTEMA

        la $t0, descritor_arquivo_escrita      # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                         # $a0 = DESCRITOR DO ARQUIVO ESCRITA
        li $v0, 16                             # $v0 = SERVICO 16: FECHA O ARQUIVO COM DESCRITOR EM $a0
        syscall                                # CHAMADA AO SISTEMA

        jr	    $ra                            # RETORNA AO PROCEDIMENTO CHAMADOR       

arquivo_leia_codigo:

        lw      $a0, 0($t0)                    # $a0 = ENDERECO DESCRITOR DO ARQUIVO 
        la	    $a1, buffer_leitura            # $a1 = ENDERECO DO BUFFER COM OS DADOS A SEREM ESCRITOS
        li      $a2, 4                         # $a2 = NUMERO DE BYTES QUE DEVEM SER LIDOS
        li      $v0, 14                        # $v0 = SERVICO PARA LER ARQUIVO
        syscall                         

        jr	    $ra                            # RETORNA AO PROCEDIMENTO CHAMADOR

codigo_processa:
   
        addiu   $sp, $sp, -12                 # AJUSTAR A PILHA
        sw $ra, 4($sp)                        # 4($sp) = ENDERECO DE RETORNO PRINCIPAL
        sw $a0, 8($sp)                        # 8($sp) = ENDERECO DO BUFFER

        #IMPRIME ENDERECO
        la $t0, endereco_instrucoes	      # $t0 = ENDERECO DO VALOR DO ENDERECO DA INSTRUCAO
        lw $a0, 0($t0)                        # $a0 = VALOR DO ENDERECO DA INSTRUCAO
        la $a1, endereco_instrucoes_string    # $a1 = ENDERECO DA STRING DO ENDERECO DA INSTRUCAO

        #TRADUZ HEXA PRA STRING
        jal converte_hexa_string              # FUNCAO CONVERTE HEXADECIMAL PARA STRING
        
        #ESCREVE NO ARQUIVO
        la $t0, descritor_arquivo_escrita     # $t0 = ENDERECO DO DESCRITOR ARQUIVO ESCRITA
        lw $a0, 0($t0)                        # $a0 = DESCRITOR ARQUIVO ESCRITA
        la $a1, endereco_instrucoes_string    # $a1 = STRING A SER ESCRITA
        li $a2, 11                            # $a2 = TAMANHO DA STRING
        li $v0, ESCREVE_ARQUIVO               # $v0 = SERVICO 15: ESCREVER NO ARQUIVO  
        syscall

        #ADICIONA 4 NO ENDERECO
        la $t0, endereco_instrucoes           # $t0 = ENDERECO DO VALOR DO ENDERECO DA INSTRUCAO
        lw $a0, 0($t0)                        # $a0 = VALOR DO ENDERECO DA INSTRUCAO
        addi $a0, $a0, 4                      # $a0 = $a0 + 4
        sw $a0, 0($t0)                        # endereco_instrucoes = $a0 = endereco_instrucoes + 4

        #RESGATA CODIGO LIDO NO ARQUIVO
        lw $t0, 8($sp)                        # ENDERECO DO BUFFER
        lw $a1, 0($t0)                        # $a1 = CODIGO 4 BYTES LIDO
        la $s5, codigoCompleto                # $s5 = ENDERECO DE "codigoCompleto"     
        sw $a1, 0($s5)                        # SALVA CODIGO LIDO EM "codigoCompleto"

        #ESCREVE CODIGO NO ARQUIVO
        move $a0, $a1                           # $a0 = CODIGO COMPLETO
        la $a1, codigo_hexadecimal_string       # ENDERECO DA STRING

        jal converte_hexa_string                # TRADUZ HEXADECIMAL PARA STRING
        
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA
        la $a1, codigo_hexadecimal_string       # ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #CARREGA CODIGO COMPLETO
        lw $a1, 0($s5)                        # CARREGA CODIGO DE "codigoCompleto"

   	#PEGAR OPCODE
        jal pega_opcode      
        
        la $s0, instruc_parte_1               # $S0 = ENDERECO DE "instruc_parte_1"
        sw $v0, 0($s0)                        # SALVA OPCODE EM "instruc_parte_1"     
        move $t0, $v0                         # $T0 = OPCODE
        
        beqz $t0, tipoR                       # SE OPCODE == 0
        beq $t0, 0x02, tipoJ                  # SE OPCODE == 2
        beq $t0, 0x03, tipoJ                  # SE OPCODE == 3

        bgt $t0, 0x39, naoAchou               # SE OPCODE > 0X39
        j tipoI                               # SE NAO 

pega_opcode:
	li  $t1, 0xFC000000        # $t1 = MASCARA PARA ISOLAR PRIMEIROS 6 BITS
        and $v0, $a1, $t1          # $v0 = PRIMEIROS 6 BITS DO CODIGO
        srl $v0, $v0, 26 	   # $v0 = SHIFT DIREITA 26 BITS
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_rs:
        li  $t1, 0x03E00000        # $t1 = MASCARA PARA ISOLAR 5 BITS DE RS
        and $v0, $a1, $t1          # $v0 = 5 BITS DE RS
        srl $v0, $v0, 21 	   # $v0 = SHIFT DIREITA 21 BITS
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_rt:
        li  $t1, 0x001F0000        # $t1 = MASCARA PARA ISOLAR 5 BITS DE RT
        and $v0, $a1, $t1          # $v0 = 5 BITS DE RT
        srl $v0, $v0, 16	   # $v0 = SHIFT DIREITA 16 BITS
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_rd:
        li  $t1, 0x0000F800        # $t1 = MASCARA PARA ISOLAR 5 BITS DE RS
        and $v0, $a1, $t1          # $v0 = 5 BITS DE RS
        srl $v0, $v0, 11	   # $v0 = SHIFT DIREITA 11 BITS
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_sa:
        li  $t1, 0x000007C0        # $t1 = MASCARA PARA ISOLAR 5 BITS DE SA
        and $v0, $a1, $t1          # $v0 = 5 BITS DE SA
        srl $v0, $v0, 6	   	   # $v0 = SHIFT DIREITA 6 BITS
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_function:
        li  $t1, 0x0000003F        # $t1 = MASCARA PARA ISOLAR ULTIMOS 6 BITS DE FUNCTION
        and $v0, $a1, $t1          # $v0 = 6 BITS DE FUNCTION
        
        jr $ra                     # RETORNA AO PROCEDIMENTO CHAMADOR

pega_constante:
        li  $t1, 0x0000FFFF            # $t1 = MASCARA PARA ISOLAR 16 BITS DA CONSTANTE
        and $v0, $a1, $t1              # $v0 = 16 BITS DA CONSTANTE
	bge $v0, 0x00008000, negativo  # SE CONSTANTE >= 8000 = EXTENSAO DE SINAL
	
        jr $ra                         # RETORNA AO PROCEDIMENTO CHAMADOR
negativo:
	li  $t1, 0xFFFF0000       # $t1 = MASCARA PARA EXTENDER O SINAL DA CONSTANTE
        or $v0, $v0, $t1          # $v0 = EXTENDE O SINAL DA CONSTANTE
        
        jr $ra                    # RETORNA AO PROCEDIMENTO CHAMADOR
pega_target:
        li  $t1, 0x03FFFFFF       # $t1 = MASCARA PARA ISOLAR 26 BITS DE TARGET
        and $v0, $a1, $t1         # $a0 = 26 BITS DE TARGET
        
        sll $v0, $v0, 2           # TARGET = TARGET * 4

        jr $ra                    # RETORNA AO PROCEDIMENTO CHAMADOR

tipoR:
        jal pega_function                # PEGAR FUNCTION
        move $t0, $v0 	                 # $t0 = RETORNO DA FUNCAO
        sw $t0, 0($s0) 	                 # STORE O VALOR DE $t0 NA "instruc_parte_1"

        li $a2, 0                        # $a2 = CONTADOR = 0
        while0:
                bgt $a2, 0x2B, naoAchou  # SE CONTADOR > 0X2B ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoR # SE CONTADOR == FUNCTION
                add $a2, $a2, 1          # CONTADOR++
        j while0 

tipoJ:
        lw $t0, 0($s0)                   # $t0 = OPCODE DE "instruc_parte_1"
        li $a2, 1                        # $a2 = CONTADOR = 1
        while1:
                bgt $a2, 0x39, naoAchou  # SE CONTADOR > 0X39 ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoJ # SE CONTADOR == OPCODE 
                add $a2, $a2, 1          # CONTADOR++
        j while1
		
tipoI:
        lw $t0, 0($s0)                   # $t0 = OPCODE DE "instruc_parte_1"
        li $a2, 1                        # $a2 = CONTADOR = 1
        while2:
                bgt $a2, 0x39, naoAchou  # SE CONTADOR > 0X39 ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoI # SE CONTADOR == OPCODE 
                add $a2, $a2, 1          # CONTADOR++
        j while2

VetorTipoJ:

        la $t0, vetor_instrucoes     # $t0 = ENDERECO BASE DO VETOR DE INSTRUCOES
        sub $a2, $a2, 1              # INDICE = INDICE - 1
        sll $a2, $a2, 2              # INDICE * 4
        add $t0, $a2, $t0            # $t0 = &VETOR[i]
        
        sw $t0, 0($s0)               # GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO EM "instruc_parte_1"
        
        jal pega_target        	    

        move $a0, $v0	            # $t0 RECEBE O RETORNO DA FUNCAO "pega_target"
        la $a1, imediato            # ENDERECO DA STRING "imediato"

        jal converte_hexa_string    # TRADUZ CONSTANTE HEXA PRA STRING                   

        j imprimeResultJ            #IMPRIME RESULTADO TIPO j

VetorTipoI:
        lw $s6, 0($s0)                  # $s6 = VALOR DO OPCODE DE "instruc_parte_1"

        la $t0, vetor_instrucoes        # $t0 = ENDERECO BASE DO VETOR DE INSTRUCOES
        sub $a2, $a2, 1 		# INDICE = INDICE - 1
        sll $a2, $a2, 2			# INDICE * 4
        add $t0, $a2, $t0 		# $t0 = &VETOR[i]
        
        sw $t0, 0($s0)   		# GUARDAMOS O ENDERECO DA STRING NA "instruc_parte_1"
        
        jal pega_rs		        # PEGAR RS
        move $t0, $v0			# $t0 RECEBE O RETORNO DA FUNCAO
        la $s1, instruc_parte_2 	# $s1 = ENDERECO DE "instruc_parte_2"
        sw $t0, 0($s1)			# GUARDA O RS NA "instruc_parte_2"

        jal pega_rt			# PEGAR RT
        move $t0, $v0			# $t0 RECEBE O RETORNO DA FUNCAO
        la $s2, instruc_parte_3 	# $s2 = ENDERECO DE "instruc_parte_3"
        sw $t0, 0($s2)			# GUARDA O RT NA "instruc_parte_3"

        jal pega_constante		# PEGAR CONSTANTE
        move $t0, $v0			# $t0 RECEBE O RETORNO DA FUNCAO
        la $s3, instruc_parte_4 	# $s3 = ENDERECO DE "instruc_parte_4"
        sw $t0, 0($s3)			# GUARDA O CONSTANTE NA "instruc_parte_4"
        
        lw $a0, 0($s1)
        jal traduzRegistrador           # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
        sw $v0, 0($s1)  	        # GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA "instruc_parte_2"

        lw $a0, 0($s2)
        jal traduzRegistrador	        # TRADUZ VALOR DO REGISTRADOR RT PARA STRING
        sw $v0, 0($s2)  	        # GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA "instruc_parte_3"

       
        lw $a0, 0($s3)                  # $a0 = CONSTANTE DE "instruc_parte_4" 
        la $a1, imediato                # ENDERECO DA STRING

        jal converte_hexa_string        #TRADUZ CONSTANTE HEXA PRA STRING
        
        lw $a1, 0($s5)                  # CARREGA CODIGO COMPLETO DE $S5

        beq $s6, 1, imprimeResultI1     # IF($S6 == 1) IMPRIME RESULTADO FORMATO i1

        blt $s6, 6, imprimeResultI2     # IF($S6 < 6) IMPRIME RESULTADO FORMATO i2

        blt $s6, 8, imprimeResultI1     # IF($S6 < 8) IMPRIME RESULTADO FORMATO i1

        blt $s6, 0x0F, imprimeResultI3  # IF($S6 < 0x0F) IMPRIME RESULTADO FORMATO i3

        beq $s6, 0x0F imprimeResultI4   # IF($S6 == 0x0F) IMPRIME RESULTADO FORMATO i4

        blt $s6, 0x3A, imprimeResultI5  # IF($S6 < 0x3A) IMPRIME RESULTADO FORMATO i5

        j naoAchou         # ENCERRA PROGRAMA

VetorTipoR:
        lw $s6, 0($s0)                  # $s6 = VALOR DO OPCODE DE "instruc_parte_1"

        la $t0, vetor_functions 	# $t0 = ENDERECO BASE DO VETOR DE FUNCTIONS
        sll $a2, $a2, 2     		# INDICE * 4
        add $t0, $a2, $t0 		# $t0 = &VETOR[i]
        
        sw $t0, 0($s0)  		# GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA "instruc_parte_1"

        jal pega_rs   	                # PEGAR RS
        move $t0, $v0                   # $t0 RECEBE O RETORNO DA FUNCAO
        la $s1, instruc_parte_2         # $s1 = ENDERECO DE "instruc_parte_2"
        sw $t0, 0($s1) 	                # GUARDA O RS NA "instruc_parte_2"

        jal pega_rt 	                # PEGAR RT
        move $t0, $v0                   # $t0 RECEBE O RETORNO DA FUNCAO
        la $s2, instruc_parte_3         # $s2 = ENDERECO DE "instruc_parte_3"
        sw $t0, 0($s2)                  # GUARDA O RT NA "instruc_parte_3"

        jal pega_rd		        # PEGAR RD
        move $t0, $v0 	                # $t0 RECEBE O RETORNO DA FUNCAO
        la $s3, instruc_parte_4         # $s3 = ENDERECO DE "instruc_parte_4"
        sw $t0, 0($s3)                  # GUARDA O RD NA "instruc_parte_4"
        
        jal pega_sa 	                # PEGAR SA
        move $t0, $v0                   # $t0 RECEBE O RETORNO DA FUNCAO
        la $s4, instruc_parte_5         # $s4 = ENDERECO DE "instruc_parte_5"
        sw $t0, 0($s4)                  # GUARDA O SA NA "instruc_parte_5"

        lw $a0, 0($s1)
        jal traduzRegistrador           # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
        sw $v0, 0($s1)  	        # GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA "instruc_parte_2"

        lw $a0, 0($s2)
        jal traduzRegistrador           # TRADUZ VALOR DO REGISTRADOR RT PARA STRING
        sw $v0, 0($s2)  	        #GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA "instruc_parte_3"

        lw $a0, 0($s3)
        jal traduzRegistrador           # TRADUZ VALOR DO REGISTRADOR RD PARA STRING
        sw $v0, 0($s3)                  # GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA "instruc_parte_4"
        

        lw $a0, 0($s4)                  # $a0 = CONSTANTE DE "instruc_parte_5"
        la $a1, imediato                # ENDERECO DA STRING

        jal converte_hexa_string        # TRADUZ HEXA SA PRA STRING
               
        lw $a1, 0($s5)                  # CARREGA CODIGO COMPLETO DE $S5

        blt $s6, 4, imprimeResultR1     # IF($S6 < 4) IMPRIME RESULTADO FORMATO R1

        blt $s6, 8, imprimeResultR2     #I F($S6 < 8) IMPRIME RESULTADO FORMATO R2

        beq $s6, 8, imprimeResultR3     # IF($S6 == 8) IMPRIME RESULTADO FORMATO R3

        beq $s6, 9, imprimeResultR4     # IF($S6 == 9) IMPRIME RESULTADO FORMATO R4

        blt $s6, 0x10, imprimeResultR5  # IF($S6 < 0x10) IMPRIME RESULTADO FORMATO R5

        beq $s6, 0x10, imprimeResultR6  # IF($S6 == 0x10) IMPRIME RESULTADO FORMATO R6
     
        beq $s6, 0x12, imprimeResultR6  # IF($S6 == 0x12) IMPRIME RESULTADO FORMATO R6

        beq $s6, 0x11, imprimeResultR3  # IF($S6 == 0x11) IMPRIME RESULTADO FORMATO R3

        beq $s6, 0x13, imprimeResultR3  # IF($S6 == 0x13) IMPRIME RESULTADO FORMATO R3

        blt $s6, 0x20, imprimeResultR7  # IF($S6 < 0x20) IMPRIME RESULTADO FORMATO R7
        
        blt $s6, 0x2C, imprimeResultR8  # IF($S6 < 0x2C) IMPRIME RESULTADO FORMATO R8

        j naoAchou         #ENCERRA O PROGRAMA

traduzRegistrador:
        move $t0, $a0                            # $t0 = CODIGO REGISTRADOR DE $a0

        li $a2, 0                                # $a2 = CONTADOR = 0
        while3:
                bgt $a2, 0x1F, naoAchou 	 # SE CONTADOR > 0X1F ENTAO NAO ACHOU
                beq $t0, $a2, retornaRegistrador # SE CONTADOR == REGISTRADOR 
                add $a2, $a2, 1	                 # CONTADOR++
        j while3

retornaRegistrador:
        
        la $t0, vetor_registradores     # $T0 = ENDERECO BASE DO VETOR DE REGISTRADORES
        sll $a2, $a2, 2			# INDICE * 4
        add $t0, $a2, $t0 		# $T0 = &VETOR[I]
        
        move $v0, $t0 

        jr $ra				# RETORNA AO PROCEDIMENTO CHAMADOR

main:

        addiu   $sp, $sp, -8                                        # AJUSTA A PILHA
        sw	    $ra, 4($sp)                                         # ARMAZENA $RA DE INIT NA PILHA
        sw	    $zero, 0($sp)                                       # CODIGO DE RETORNO = 0 = SUCESSO

        # ABRE O ARQUIVO PARA LEITURA
        la	    $a0, nome_do_arquivo                                # $a0 = ENDERECO DA STRING COM NOME DO ARQUIVO
        jal     arquivo_abrir_leitura                               # PROCEDIMENTO ABRE O ARQUIVO PARA LEITURA
        la      $t0, descritor_arquivo_leitura                      # $t0 = ENDERECO DE ONDE ARMAZENAR O DESCRITOR DO ARQUIVO
        sw      $v0, 0($t0)                                         # ARMAZENA O DESCRITOR DO ARQUIVO ACHADO 

        # SE NAO FOI POSSIVEL ABRIR TRATA  O ERRO
        slt     $t0, $v0, $zero                                     # SE DESCRITOR MENOR QUE 0
        bne     $t0, $zero, se_arquivo_nao_pode_ser_aberto     # FUNCAO TRATA ERRO

        #ABRIR ARQUIVO ESCRITA
        la $a0, localArq                                            # $a0 = ENDERECO DA STRING COM LOCAL DO ARQUIVO
        jal arquivo_abrir_escrita                                   # PROCEDIMENTO ABRE O ARQUIVO PARA ESCRITA
        la $t0, descritor_arquivo_escrita                           # $t0 = ENDERECO DE ONDE ARMAZENAR O DESCRITOR DO ARQUIVO
        sw $v0, 0($t0)                                              # ARMAZENA O DESCRITOR DO ARQUIVO ACHADO

        # SE NAO FOI POSSIVEL ABRIR TRATA  O ERRO
        slt     $t0, $v0, $zero                                     # SE DESCRITOR MENOR QUE 0
        bne     $t0, $zero, se_arquivo_nao_pode_ser_aberto     # FUNCAO TRATA ERRO

        #ARQUIVO NAO DEU ERRO
        j       main_while                                          # SEM ERRO DE ABRTURA

se_arquivo_nao_pode_ser_aberto:
        # IMPRIME STRING ERRO

        la      $a0, str_erro_abertura_arquivo      # $a0 = ENDERECO DA STRING ERRO
        li      $v0, 4                              # $v0 = SERVICO IMPRIME STRING
        syscall                
        li      $v0, 1                              # $v0 = 1, VALOR DO RETORNO QUE DIZ QUE DEU ERRO
        bne     $t0, $zero, fim_leitura_codigo   # ENCERRA PROCEDIMENTO MAIN

main_while:   
        #LER UMA PALAVRA DE 4 BYTES
        la      $t0, descritor_arquivo_leitura  # $t0 = ENDERECO ONDE SERA ARMAZENADO DESCRITOR DO ARQUIVO
        lw      $a0, 0($t0)                     # $a0 = DESCRITOR DO ARQUIVO
        la      $a1, buffer_leitura             # $a1 = ENDERECO DO BUFFER DE LEITURA
        jal     arquivo_leia_codigo           # TENTAR LER 4 BYTES, $v0 RETORNA O NUMERO DE BYTES LIDOS
        bne     $v0, $zero, main_while_codigo   # SE NAO CHEGOU NO FIM DO ARQUIVO, ENTAO PROCESSA REGISTRO

        j fim_leitura_codigo                 #SE CHEGOU AO FIM DO ARQUIVO

main_while_codigo:
        # VERIFICA SE O NUMERO DE BYTES LIDOS FOI == 4
        slti    $t0, $v0, 4                 	                # SE UM REGISTRO NAO PODE SER LIDO
        bne     $t0, $zero,se_leitura_codigo_erro        # ENCERRA O PROGRAMA

        #SE NAO DEU ERRO:
        la      $a0, buffer_leitura                              # $a0 = ENDERECO DO BUFFER DE LEITURA
        jal     codigo_processa                                # PROCESSA O REGISTRO LIDO DO ARQUIVO (DECODIFICADOR)
        j       main_while                                       # VAI PARA A PROXIMA LEITURA

se_leitura_codigo_erro:
        la      $a0, str_erro_leitura_registro       # $a0 = ENDERECO DA STRING DE ERRO
        li      $v0, 4                               # $v0 = IMPRIME STRING
        syscall                         
        li      $v0, 1                              # $v0 = 1, VALOR DE RETORNO QUE INDICA QUE DEU ERRO
        bne     $t0, $zero, fim_leitura_codigo   # ENCERRA O PROCEDIMENTO            
                
fim_leitura_codigo:
        # FECHAMOS O ARQUIVO
        jal     arquivo_fechar          # FECHAMOS O ARQUIVO

        lw      $ra, 4($sp)             # RESTAURA ENDERECO DE RETORNO PARA INIT
        lw      $v0, 0($sp)             # $v0 = CODIGO DE RETORNO DO PROCEDIMENTO: 0 = SUCESSO
        addiu   $sp, $sp, 8             # RESTAURA PILHA
        jr	    $ra                 # RETORNAMOS AO PROCEDIMENTO CHAMADOR (INIT)

imprimeResultR1:
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RD 	
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA
        
        # IMPRIME SA	
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	$ra                             # RETORNA AO PROCESSO CHAMADOR

imprimeResultR2: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RD 	
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA

        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR
        
imprimeResultR3: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA	

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR
imprimeResultR4: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RD 	
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultR5: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR


imprimeResultR6: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RD 	
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR
imprimeResultR7: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA

        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR
imprimeResultR8: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RD 	
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s3)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR
	
imprimeResultI1: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME CONSTANTE		
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
	
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultI2:
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA

        #CALCULA ENDERECO DE DESVIO
        la $t0, 0($s3)	                        # $t0 = ENDERECO DA CONSTANTE
        lw $a1, 0($t0)                          # $a1 = CONSTANTE HEXADECIMAL

        jal  calcula_endereco_desvio            # FUNCAO CALCULA ENDERECO DESVIO

        move $a0, $v0                           # $a0 = HEXADECIMAL ENDERECO DESVIO
        la $a1, imediato                        # ENDERECO DA STRING IMEDIATO

        jal converte_hexa_string                #TRADUZ HEXADECIMAL PARA STRING

        #IMPRIME CONSTANTE
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)			        # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultI3: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA	

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)                          
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME CONSTANTE	
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultI4: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA	
        
        #IMPRIME CONSTANTE	
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultI5: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #IMPRIME RT	
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s2
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s2)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall	                                # CHAMADA AO SISTEMA	
        
        #IMPRIME CONSTANTE	
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME (
        la $a1, abre_parenteses                 # $a1 = ENDERECO DA STRING A SER ESCRITA   
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME RS	
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s1)                          # $t0 = ENDERECO DA STRING DE $s3
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)      
        addi $a2, $a2, -1                       # -1 DO TAMANHO, POIS HA UM ESPACO A MAIS NA STRING APOS O REGISTRADOR                     
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA	

        #IMPRIME )
        la $a1, fecha_parenteses                # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR

imprimeResultJ: 
        la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME TARGET	
        la $a1, imediato                        # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 11                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA
        
        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	    $ra                         # RETORNA AO PROCESSO CHAMADOR


strlen:

        addi $v0, $zero, 0      # INICIALIZA $v0 = 0 = TAMANHO STRING

   next:
        lb $t1, 0($a1)          # LER 1 BYTE DA STRING
        beq $t1, $zero, retorna  # SE FOR '\0' RETORNA
        addi $a1, $a1, 1        # SENAO LE PROXIMO BYTE
        
        addi $v0, $v0, 1        # TAMANHO = TAMANHO + 1
        j next                  # LER DE NOVO

  retorna:
        jr $ra                  # RETORNA
      
converte_hexa_string:

        move $t0, $a0                           # RECEBE $a0 = HEXADECIMAL
        move $t3, $a1                           # RECEBE $a1 = ENDERECO STRING RESULTADO

        li $t1, 16                              # DIVISOR = 16  
        addi $t3, $t3, 10                       # $T3 APONTA PARA O FINAL DA STRING
        sb $zero, -2($t3)                       # -2 PRESERVA ESPACO E NULL-TERMINATOR
        li $t5, 0                               # $T5 = CONTADOR = 0

        converte_loop:
                bge $t5, 8, fim_converte        # ACABOU?

                divu $t0, $t1                   # DIVIDE HEXADECIMAL POR 16

                mfhi $t4                        # $t4 = RESTO

                addi $t4, $t4, 48               # SOMA 48 EM ASCII para 48 = '0'

                blt $t4, 58, nao_ajusta_digitos # SE $t4 > 58 AJUSTA PARA 'ABCDEF'
                addi $t4, $t4, 7                # +7 AJUSTA PARA "ABCDEF"

        nao_ajusta_digitos:
                addi $t3, $t3, -1               # RETROCEDE PONTEIRO 
                sb $t4, 0($t3)                  # ARMAZENA CARACTER ASCII

                mflo $t0                        # $t0 = QUOCIENTE RESTANTE
                addi $t5, $t5, 1                # CONTADOR ++

                j converte_loop                 # RETORNA AO LOOP
        fim_converte:
                jr $ra                          # RETORNA AO PROCEDIMENTO CHAMADOR

calcula_endereco_desvio:

        #PEGA PC
        la $t0, endereco_instrucoes # ENDERECO DO ENDERECO ATUAL DE PC = PC + 4 POIS JA FOI ADICIONADO 4
        lw $t0, 0($t0)              # VALOR DE PC + 4

        move $t1, $a1               # IMEDIATO
        sll $t1, $t1, 2             # IMEDIATO << 2

        add $v0, $t0, $t1           # CONSTANTE =  (PC + 4) + IMEDIATO << 2

        jr $ra                      # RETORNA AO PROCEDIMENTO CHAMADOR

naoAchou:	
	la $t0, descritor_arquivo_escrita       # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO ESCRITA
        lw $a0, 0($t0)                          # $a0 = VALOR DESCRITOR DO ARQUIVO ESCRITA

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        jal strlen                              # CALCULA TAMANHO DA STRING
        lw $t0, 0($s0)                          # $t0 = ENDERECO DA STRING DE $s0
        lw $a1, 0($t0)                          # $a1 = ENDERECO DA STRING A SER ESCRITA
        move $a2, $v0                           # $a2 = TAMANHO DA STRING (RETORNO STRLEN)
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA

        #IMPRIME STRING NAO ACHOU
        la $a1, stringNaoAchouInstrucao         # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 28                              # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER 
        syscall                                 # CHAMADA AO SISTEMA
        
        #NOVA LINHA
        la $a1, nova_linha                      # $a1 = ENDERECO DA STRING A SER ESCRITA
        li $a2, 1                               # NUMERO DE BYTES ESCRITOS
        li $v0, ESCREVE_ARQUIVO                 # $v0 = SERVICO 15: ESCREVER
        syscall                                 # CHAMADA AO SISTEMA

        lw      $ra, 4($sp)                     # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12                    # RESTAURA PILHA
        jr	$ra                             # RETORNA AO PROCESSO CHAMADOR
