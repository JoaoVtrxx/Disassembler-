.data   
        ### ARQUIVOS 

        ## arquivo ler
        descritor_arquivo: .word 0                  # descritor do arquivo: um inteiro nao negativo
        nome_do_arquivo: .asciiz "notas.bin"        # nome do arquivo
        .align 2                                    
                                                    
        buffer_leitura: .space 32                   # buffer para a leitura do arquivo 

        ### arquivo escrever
        conteudoArq: .asciiz "Mensagem para ser escrita\n" #26 caracter
        localArq: .asciiz "C:/Users/jdalp/Downloads/testeAssembly.txt"
        descritor_arquivo_escrita: .word 0                 # descritor do arquivo escrita: um inteiro nao negativo

        str_erro_abertura_arquivo: .asciiz "[ERRO] O arquivo nao pode ser aberto\n"
        str_erro_leitura_registro: .asciiz "[ERRO] Erro de leitura do arquivo"

        ##################################### DECODIFICADOR ##################

        endereco_instrucoes: .word 0x00400000
        stringNaoAchouFuncao: .asciiz "Funcao nao encontrada... "

	instruc1: .word 0	#$s0
	instruc2: .word 0	#$s1
	instruc3: .word 0	#$s2
	instruc4: .word 0	#$s3
	instruc5: .word 0	#$s4
	instruc6: .word 0	#$s5

        ## VETORES
	
	strings:
	str1: .ascii "bltz \0"
	str2: .ascii "j \0"
	str3: .ascii "jal \0"
	str4: .ascii "beq \0"
	str5: .ascii "bne \0"
	str6: .ascii "blez \0"
	str7: .ascii "bgtz \0"
	str8: .ascii "addi \0"
	str9: .ascii "addiu \0"
	str10: .ascii "slti \0"
	str11: .ascii "sltiu \0"
	str12: .ascii "andi \0"
	str13: .ascii "ori \0"
	str14: .ascii "xori \0"
	str15: .ascii "lui \0"
	str16: .ascii "Comando n existe \0"
	str17: .ascii "Comando n existe \0"
	str18: .ascii "Comando n existe \0"
	str19: .ascii "Comando n existe \0"
	str20: .ascii "beql \0"
	str21: .ascii "bnel \0"
	str22: .ascii "blezl \0"
	str23: .ascii "bgtzl \0"
	str24: .ascii "Comando n existe \0"
	str25: .ascii "Comando n existe \0"
	str26: .ascii "Comando n existe \0"
	str27: .ascii "Comando n existe \0"
	str28: .ascii "mul \0"
	str29: .ascii "Comando n existe \0"
	str30: .ascii "Comando n existe \0"
	str31: .ascii "Comando n existe \0"
	str32: .ascii "lb \0"
	str33: .ascii "lh \0"
	str34: .ascii "lwl \0"
	str35: .ascii "lw \0"
	str36: .ascii "lbu \0"
	str37: .ascii "lhu \0"
	str38: .ascii "lwr \0"
	str39: .ascii "Comando n existe \0"
	str40: .ascii "sb \0"
	str41: .ascii "sh \0"
	str42: .ascii "swl \0"
	str43: .ascii "sw \0"

	vetor_ponteiros: .word str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, str14, str15, str16, str17, str18, str19, str20, str21, str22, str23, str24, str25, str26, str27, str28, str29, str30, str31, str32, str33, str34, str35, str36, str37, str38, str39, str40, str41, str42, str43

	function:
	func0: .ascii "sll \0"
	func1: .ascii "Comando n existe\0"
	func2: .ascii "slr \0"
	func3: .ascii "sra \0"
	func4: .ascii "sllv \0"
	func5: .ascii "Comando n existe \0"
	func6: .ascii "srlv \0"
	func7: .ascii "srav \0"
	func8: .ascii "jr \0"
	func9: .ascii "jalr \0"
	func10: .ascii "Comando n existe \0"
	func11: .ascii "Comando n existe \0"
	func12: .ascii "syscall \0"
	func13: .ascii "break \0"
	func14: .ascii "Comando n existe \0"
	func15: .ascii "Comando n existe \0"
	func16: .ascii "mfhi \0"
	func17: .ascii "mfhi \0"
	func18: .ascii "mflo \0"
	func19: .ascii "mtlo \0"
	func20: .ascii "Comando n existe \0"
	func21: .ascii "Comando n existe \0"
	func22: .ascii "Comando n existe \0"
	func23: .ascii "Comando n existe \0"
	func24: .ascii "mulT \0"
	func25: .ascii "multu \0"
	func26: .ascii "div \0"
	func27: .ascii "divu \0"
	func28: .ascii "Comando n existe \0"
	func29: .ascii "Comando n existe \0"
	func30: .ascii "Comando n existe \0"
	func31: .ascii "Comando n existe \0"
	func32: .ascii "add \0"
	func33: .ascii "addu \0"
	func34: .ascii "sub \0"
	func35: .ascii "subu \0"
	func36: .ascii "and \0"
	func37: .ascii "or \0"
	func38: .ascii "xor \0"
	func39: .ascii "nor \0"
	func40: .ascii "Comando n existe \0"
	func41: .ascii "Comando n existe \0"
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
	
	.eqv PRINT_STRING 4
	.eqv PRINT_HEX 34
        

.text

        .macro imprime_string (%string_value)
	la $a0, %string_value
	li $v0, PRINT_STRING
	syscall
	.end_macro

init:
            jal     main                    # executa o procedimento principal
finit:
            move	$a0, $v0                # $a0 = CODIGO DE RETORNO DO PROGRAMA
            li      $v0, 17                 # $v0 = SERVICO EXIT 2
            syscall                        

arquivo_abrir_leitura:

            li      $a1, 0                  # $a1 = FLAG = 0: ABRIR ARQUIVO PARA LEITURA
            li      $a2, 0                  # $a2 <- MODO (NAO USADO)
            li      $v0, 13                 # $v0 <- SERVICO 13: ABRIR ARQUIVO PARA LEITURA OU ESCRUTA
            syscall                 

            jr	    $ra                     

arquivo_abrir_escrita:

           li $v0, 13
           la $a1, 1
           syscall

           jr	    $ra    

arquivo_fechar:

            la      $t0, descritor_arquivo  # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO
            lw      $a0, 0($t0)             # $a0 = DESCRITOR DO ARQUIVO
            li      $v0, 16                 # $v0 = SERVICO 16: FECHA O ARQUIVO COM DESCRITOR EM $a0
            syscall            

            la $t0, descritor_arquivo_escrita #FEHCANDO ARQUIVO DE ESCRITA
            lw $a0, 0($t0)
            li $v0, 16
            syscall

            jr	    $ra                     

arquivo_leia_registro:

            lw      $a0, 0($t0)             # $a0 = ENDERECO DESCRITOR DO ARQUIVO 
            la	    $a1, buffer_leitura     # $a1 = ENDERECO DO BUFFER COM OS DADOS A SEREM ESCRITOS
            li      $a2, 4                  # $a2 = NUMERO DE BYTES QUE DEVEM SER LIDOS
            li      $v0, 14                 # $v0 = SERVICO PARA LER ARQUIVO
            syscall                         

            jr	    $ra                   

registro_processa:
   
        addiu   $sp, $sp, -12           # AJUSTAR A PILHA
        sw $ra, 4($sp)

        move $t0, $a0             # $t0 = ENDERECO DO BUFFER

        #PASSANDO CODIGO PARA REGISTRADOR $a1
        lw  $a1, 0($t0) # $a1 = CODIGO

        #IMPRIME ENDERECO
        la $t0, endereco_instrucoes	
        lw $a0, 0($t0)
        li $v0, 34
        syscall

        #ADICIONA 4 NO ENDERECO
        addi $a0, $a0, 4
        sw $a0, 0($t0)

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

   	#PEGAR OPCODE
        jal pega_opcode

        la $s0, instruc1 #$S0 = ENDERECO DA INSTRUC1
        sw $v0, 0($s0) #SALVANDO OPCODE EM INSTRUC1     
        move $t0, $v0  #PASSANDO OPCODE PARA REGISTRADOR $T0
        
        beqz $t0, tipoR  # SE OPCODE == 0
        beq $t0, 0x02, tipoJ # SE OPCODE == 2
        beq $t0, 0x03, tipoJ # SE OPCODE == 3

        j tipoI # SE NAO EH TIPO i

pega_opcode:
	li  $t1, 0xFC000000        # $t1 <- MASCARA PARA ISOLAR PRIMEIROS 6 BITS
        and $v0, $a1, $t1       # $v0 <- PRIMEIROS 6 BITS DO CODIGO
        srl $v0, $v0, 26 	   # $v0 <- SHIFTADO DIREITA 26 BITS
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_rs:
        li  $t1, 0x03E00000       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RS
        and $v0, $a1, $t1       # $v0 <- 5 BITS DE RS
        srl $v0, $v0, 21 	   # $v0 <- SHIFTADO DIREITA 21 BITS
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_rt:
        li  $t1, 0x001F0000       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RT
        and $v0, $a1, $t1       # $v0 <- 5 BITS DE RT
        srl $v0, $v0, 16	   # $v0 <- SHIFTADO DIREITA 16 BITS
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_rd:
        li  $t1, 0x0000F800       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RS
        and $v0, $a1, $t1       # $v0 <- 5 BITS DE RS
        srl $v0, $v0, 11	   # $v0 <- SHIFTADO DIREITA 11 BITS
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_sa:
        li  $t1, 0x000007C0       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE SA
        and $v0, $a1, $t1       # $v0 <- 5 BITS DE SA
        srl $v0, $v0, 6	   	# $v0 <- SHIFTADO DIREITA 6 BITS
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_function:
        li  $t1, 0x0000003F       # $t1 <- MASCARA PARA ISOLAR ULTIMOS 6 BITS DE FUNCTION
        and $v0, $a1, $t1       # $v0 <- 6 BITS DE FUNCTION
        
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

pega_constante:
        li  $t1, 0x0000FFFF       # $t1 <- MASCARA PARA ISOLAR 16 BITS DA CONSTANTE
        and $v0, $a1, $t1       # $v0 <- 16 BITS DA CONSTANTE
	bge $v0, 0x00008000, negativo
	
        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO
negativo:
	li  $t1, 0xFFFF0000       # $t1 <- MASCARA PARA ISOLAR 16 BITS DA CONSTANTE
        or $v0, $v0, $t1       # $v0 <- 16 BITS DA CONSTANTE
        
        jr $ra
pega_target:
        li  $t1, 0x03FFFFFF       # $t1 <- MASCARA PARA ISOLAR 26 BITS DE TARGET
        and $v0, $a1, $t1       # $a0 <- 26 BITS DE TARGET
        
        sll $v0, $v0, 2

        jr $ra #RETORNA PARA A CHAMADA DA FUNCAO


tipoR:
        jal pega_function  # PEGAR FUNCTION
        move $t0, $v0 	   # $T0 = RETORNO DA FUNCAO
        sw $t0, 0($s0) 	   # STORE O VALOR DE T0 NA INSTRUC1

        li $a2, 0 # CONTADOR = 0
        while0:
                bgt $a2, 0x2B, naoAchou # SE CONTADOR > 0X2B ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoR # SE CONTADOR == FUNCTION
                add $a2, $a2, 1 # CONTADOR++
        j while0 

tipoJ:
        lw $t0, 0($s0) # $T0 = OPCODE DA INSTRUC1
        li $a2, 1 # CONTADOR = 1
        while1:
                bgt $a2, 0x39, naoAchou  # SE CONTADOR > 0X39 ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoJ # SE CONTADOR == OPCODE 
                add $a2, $a2, 1 # CONTADOR++
        j while1
		
tipoI:
        lw $t0, 0($s0) # $T0 = OPCODE DA INSTRUC1
        li $a2, 1 # CONTADOR = 1
        while2:
                bgt $a2, 0x39, naoAchou # SE CONTADOR > 0X39 ENTAO NAO ACHOU
                beq $t0, $a2, VetorTipoI # SE CONTADOR == OPCODE 
                add $a2, $a2, 1 # CONTADOR++
        j while2

VetorTipoJ:

        la $t0, vetor_ponteiros # $T0 = ENDERECO BASE DO VETOR DE INSTRUCOES
        sub $a2, $a2, 1         # INDICE = INDICE - 1
        sll $a2, $a2, 2         # INDICE * 4
        add $t0, $a2, $t0       # $T0 = &VETOR[I]
        
        sw $t0, 0($s0)          #GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA PILHA
        
        jal pega_target        	#PEGAR TARGET
        move $t0, $v0			#$T0 RECEBE O RETORNO DA FUNCAO
        la $s1, instruc2 		# $S1 = ENDERECO DE INSTRUC2
        sw $v0, 0($s1)			#GUARDA O TARGET NA INSTRUC2

        j imprimeResultJ       #IMPRIME RESULTADO TIPO j

VetorTipoI:
        lw $s6, 0($s0)      # $S1 = VALOR DO OPCODE DA INSTRUC1

        la $t0, vetor_ponteiros # $T0 = ENDERECO BASE DO VETOR DE INSTRUCOES
        sub $a2, $a2, 1 		# INDICE = INDICE - 1
        sll $a2, $a2, 2			# INDICE * 4
        add $t0, $a2, $t0 		# $T0 = &VETOR[I]
        
        sw $t0, 0($s0)   		# GUARDAMOS O ENDERECO DA STRING NA INSTRUC1
        
        jal pega_rs				# PEGAR RS
        move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
        la $s1, instruc2 		# $S1 = ENDERECO DE INSTRUC2
        sw $t0, 0($s1)			# GUARDA O RS NA INSTRUC2

        jal pega_rt				# PEGAR RT
        move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
        la $s2, instruc3 		# $S2 = ENDERECO DE INSTRUC3
        sw $t0, 0($s2)			# GUARDA O RT NA INSTRUC3

        jal pega_constante		# PEGAR CONSTANTE
        move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
        la $s3, instruc4 		# $S3 = ENDERECO DE INSTRUC4
        sw $t0, 0($s3)			# GUARDA O CONSTANTE NA INSTRUC4
        
        jal traduzRegistradorRS  # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
        sw $v0, 0($s1)  	#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA INSTRUCT2
        jal traduzRegistradorRT	 # TRADUZ VALOR DO REGISTRADOR RT PARA STRING
        sw $v0, 0($s2)  	#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA INSTRUCT3

        addi $s7, $zero, 1 # $S7 = 1
        beq $s6, $s7, imprimeResultI1 # IF($S6 == 1) IMPRIME RESULTADO FORMATO i1

        addi $s7, $zero, 6 # $S7 = 6
        blt $s6, $s7, imprimeResultI2 # IF($S6 < 6) IMPRIME RESULTADO FORMATO i2

        addi $s7, $zero, 8 # $S7 = 8
        blt $s6, $s7, imprimeResultI1 # IF($S6 < 8) IMPRIME RESULTADO FORMATO i1

        addi $s7, $zero, 0x0F # $S7 = 0x0F
        blt $s6, $s7, imprimeResultI3 # IF($S6 < 0x0F) IMPRIME RESULTADO FORMATO i3

        beq $s6, $s7 imprimeResultI4 # IF($S6 == 0x0F) IMPRIME RESULTADO FORMATO i4

        addi $s7, $zero, 0x3A # $S7 = 0x3A
        blt $s6, $s0, imprimeResultI5 # IF($S6 < 0x3A) IMPRIME RESULTADO FORMATO i5

        j fim_leitura_registros # ENCERRA PROGRAMA

VetorTipoR:
        lw $s6, 0($s0)      # $S1 = VALOR DE FUNCTION

        la $t0, vetor_functions 	# $T0 = ENDERECO BASE DO VETOR DE FUNCTIONS
        sll $a2, $a2, 2     		# INDICE * 4
        add $t0, $a2, $t0 		# $T0 = &VETOR[I]
        
        sw $t0, 0($s0)  		# GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA PILHA

        jal pega_rs   	# PEGAR RS
        move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
        la $s1, instruc2 # $S1 = ENDERECO DE INSTRUC2
        sw $t0, 0($s1) 	# GUARDA O RS NA INSTRUC2

        jal pega_rt 	# PEGAR RT
        move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
        la $s2, instruc3 # $S2 = ENDERECO DE INSTRUC3
        sw $t0, 0($s2)  # GUARDA O RT NA INSTRUC3

        jal pega_rd		# PEGAR RD
        move $t0, $v0 	# $T0 RECEBE O RETORNO DA FUNCAO
        la $s3, instruc4 # $S3 = ENDERECO DE INSTRUC4
        sw $t0, 0($s3) # GUARDA O RD NA INSTRUC4
        
        jal pega_sa 	# PEGAR SA
        move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
        la $s4, instruc5 # $S4 = ENDERECO DE INSTRUC5
        sw $t0, 0($s4) # GUARDA O SA NA PILHA

        jal traduzRegistradorRS # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
        sw $v0, 0($s1)  	#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA INSTRUCT2  		
        jal traduzRegistradorRT # TRADUZ VALOR DO REGISTRADOR RT PARA STRING
        sw $v0, 0($s2)  	#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA INSTRUCT3
        jal traduzRegistradorRD # TRADUZ VALOR DO REGISTRADOR RD PARA STRING
        sw $v0, 0($s3)          #GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA INSTRUCT4

        addi $s7, $zero, 4 # $S7 = 4
        blt $s6, $s7, imprimeResultR1 # IF($S6 < 4) IMPRIME RESULTADO FORMATO R1

        addi $s7, $zero, 8 # $S7 = 8
        blt $s6, $s7, imprimeResultR2 #I F($S6 < 8) IMPRIME RESULTADO FORMATO R2

        beq $s6, $s7, imprimeResultR3 # IF($S6 == 8) IMPRIME RESULTADO FORMATO R3

        addi $s7, $zero, 9 # $S7 = 9
        beq $s6, $s7, imprimeResultR4 # IF($S6 == 9) IMPRIME RESULTADO FORMATO R4

        addi $s7, $zero, 0x10 # $S7 = 0x10
        blt $s6, $s7, imprimeResultR5 # IF($S6 < 0x10) IMPRIME RESULTADO FORMATO R5

        addi $s7, $zero, 0x10 # $S7 = 0x10
        beq $s6, $s7, imprimeResultR6 # IF($S6 == 0x10) IMPRIME RESULTADO FORMATO R6
        addi $s7, $zero, 0x12 # $S7 = 0x12
        beq $s6, $s7, imprimeResultR6 # IF($S6 == 0x12) IMPRIME RESULTADO FORMATO R6

        addi $s7, $zero, 0x11 # $S7 = 0x11
        beq $s6, $s7, imprimeResultR3 # IF($S6 == 0x11) IMPRIME RESULTADO FORMATO R3
        addi $s7, $zero, 0x13 # $S7 = 0x13
        beq $s6, $s7, imprimeResultR3 # IF($S6 == 0x13) IMPRIME RESULTADO FORMATO R3

        addi $s7, $zero, 0x20 # $S7 = 0x20
        blt $s6, $s7, imprimeResultR7 # IF($S6 < 0x20) IMPRIME RESULTADO FORMATO R7
        
        addi $s7, $zero, 0x2C # $S7 = 0x2C
        blt $s6, $s7, imprimeResultR8 # IF($S6 < 0x2C) IMPRIME RESULTADO FORMATO R8

        j fim_leitura_registros #ENCERRA O PROGRAMA

traduzRegistradorRS:
        lw $t0, 0($s1) # $T0 = RS DA INSTRUC2

        li $a2, 0 # CONTADOR = 0
        while3:
                bgt $a2, 0x1F, naoAchou 	# SE CONTADOR > 0X1F ENTAO NAO ACHOU
                beq $t0, $a2, retornaRegistrador # SE CONTADOR == REGISTRADOR 
                add $a2, $a2, 1	# CONTADOR++
        j while3

traduzRegistradorRT:
        lw $t0, 0($s2) # $T0 = Rt DA INSTRUC3

        li $a2, 0 # CONTADOR = 0
        while4:
                bgt $a2, 0x1F, naoAchou		# SE CONTADOR > 0X1F ENTAO NAO ACHOU
                beq $t0, $a2, retornaRegistrador # SE CONTADOR == REGISTRADOR 
                add $a2, $a2, 1 # CONTADOR++
        j while4

traduzRegistradorRD:
        lw $t0, 0($s3) # $T0 = Rt DA INSTRUCT3

        li $a2, 0 # CONTADOR = 0
        while5:
                bgt $a2, 0x1F, naoAchou 	# SE CONTADOR > 0X1F ENTAO NAO ACHOU
                beq $t0, $a2, retornaRegistrador	# SE CONTADOR == REGISTRADOR
                add $a2, $a2, 1				# CONTADOR++
        j while5

retornaRegistrador:
        
        la $t0, vetor_registradores     # $T0 = ENDERECO BASE DO VETOR DE REGISTRADORES
        sll $a2, $a2, 2			# INDICE * 4
        add $t0, $a2, $t0 		# $T0 = &VETOR[I]
        
        move $v0, $t0 

        jr $ra				#RETORNA PARA A CHAMADA DA FUNCAO


	
naoAchou:
		
		imprime_string(stringNaoAchouFuncao) #IMPRIME STRING NAO ACHOU
		j fim_leitura_registros  #ENCERRA O PROGRAMA
main:

            addiu   $sp, $sp, -8            # AJUSTA A PILHA
            sw	    $ra, 4($sp)             # ARMAZENA $RA DE INIT NA PILHA
            sw	    $zero, 0($sp)           # CODIGO DE RETORNO = 0 = SUCESSO

            # ABRE O ARQUIVO PARA LEITURA
            la	    $a0, nome_do_arquivo    # $a0 = ENDERECO DA STRING COM NOME DO ARQUIVO
            jal     arquivo_abrir_leitura   # PROCEDIMENTO ABRE O ARQUIVO PARA LEITURA
            la      $t0, descritor_arquivo  # $t0 = ENDERECO DE ONDE ARMAZENAR O DESCRITOR DO ARQUIVO
            sw      $v0, 0($t0)             # ARMAZENA O DESCRITOR DO ARQUIVO ACHADO 

            # SE NAO FOI POSSIVEL ABRIR TRATA  O ERRO
            slt     $t0, $v0, $zero         # SE DESCRITOR MENOR QUE 0
            bne     $t0, $zero, main_if_arquivo_nao_pode_ser_aberto 

            #ABRIR ARQUIVO ESCRITA
            
            la $a0, localArq
            jal arquivo_abrir_escrita
            la $t0, descritor_arquivo_escrita
            sw $v0, 0($t0)

            #ARQUIVO NAO DEU ERRO
            j       main_while     # sem erro de abertura: continua com o programa

main_if_arquivo_nao_pode_ser_aberto:
            # IMPRIME STRING ERRO
            la      $a0, str_erro_abertura_arquivo  # $a0 = ENDERECO DA STRING ERRO
            li      $v0, 4                  # $v0 = SERVICO IMPRIME STRING
            syscall                
            li      $v0, 1                  # $v0 = 1, VALOR DO RETORNO QUE DIZ QUE DEU ERRO
            bne     $t0, $zero, fim_leitura_registros # ENCERRA PROCEDIMENTO MAIN

main_while:   
        #LER UMA PALAVRA DE 4 BYTES
        la      $t0, descritor_arquivo  # $t0 = ENDERECO ONDE SERA ARMAZENADO DESCRITOR DO ARQUIVO
        lw      $a0, 0($t0)             # $a0 = DESCRITOR DO ARQUIVO
        la      $a1, buffer_leitura     # $a1 = ENDERECO DO BUFFER DE LEITURA
        jal     arquivo_leia_registro   # TENTAR LER 4 BYTES, $v0 RETORNA O NUMERO DE BYTES LIDOS
        bne     $v0, $zero, main_while_codigo # SE NAO CHEGOU NO FIM DO ARQUIVO, ENTAO PROCESSA REGISTRO

        j fim_leitura_registros #SE CHEGOU AO FIM DO ARQUIVO

main_while_codigo:
        # VERIFICA SE O NUMERO DE BYTES LIDOS FOI = 4
        slti    $t0, $v0, 4                 	        # SE UM REGISTRO NAO PODE SER LIDO
        bne     $t0, $zero,main_if_leitura_registro_erro    # ENCERRA O PROGRAMA

        #SE NAO DEU ERRO:
        la      $a0, buffer_leitura     # $a0 = ENDERECO DO BUFFER DE LEITURA
        jal     registro_processa       # PROCESSA O REGISTRO LIDO DO ARQUIVO (PRINT CODIGO)
        j       main_while # VAI PRO PROXIMO REGISTRO

main_if_leitura_registro_erro:
            la      $a0, str_erro_leitura_registro  # $a0 = ENDERECO DA STRING DE ERRO
            li      $v0, 4                  # $v0 = IMPRIME STRING
            syscall                         
            li      $v0, 1                  # $v0 = 1, VALOR DE RETORNO QUE INDICA QUE DEU ERRO
            bne     $t0, $zero, fim_leitura_registros # ENCERRA O PROCEDIMENTO            
                
fim_leitura_registros:
            # FECHAMOS O ARQUIVO
            jal     arquivo_fechar          # FECHAMOS O ARQUIVO

            lw      $ra, 4($sp)             # RESTAURA ENDERECO DE RETORNO PARA INIT
            lw      $v0, 0($sp)             # $v0 = CODIGO DE RETORNO DO PROCEDIMENTO: 0 = SUCESSO
            addiu   $sp, $sp, 8             # RESTAURA PILHA
            jr	    $ra                     # RETORNAMOS AO PROCEDIMENTO CHAMADOR (INIT)

imprimeResultR1:

	#IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall
        
        li     $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RD 	
        lw $t0, 0($s3)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME SA	
        lw $a0, 0($s4)  
        li $v0, PRINT_HEX
        syscall

        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR

imprimeResultR2: 
        #IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RD 	
        lw $t0, 0($s3)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	

        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR
        
imprimeResultR3: 
        #IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)
        li $v0, PRINT_STRING
        syscall
        
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall	

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR
imprimeResultR4: 
        #IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RD 	
        lw $t0, 0($s3)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)
        li $v0, PRINT_STRING
        syscall	
        
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR

imprimeResultR5: 
        #IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR


imprimeResultR6: 
        #IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RD 	
        lw $t0, 0($s3)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall

        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall


        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR
imprimeResultR7: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	

        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR
imprimeResultR8: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RD 	
        lw $t0, 0($s3)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	
        
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR
	
imprimeResultI1: 
	#IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME CONSTANTE	
        lw $a0, 0($s3) 
        li $v0, 1
        syscall

        #IMPRIME PULA LINHA
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR

imprimeResultI2: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall	

        
        #IMPRIME CONSTANTE	
        lw $a0, 0($s3) 
        li $v0, 34
        syscall
        
        #IMPRIME PULA LINHA
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR

imprimeResultI3: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall	

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME CONSTANTE	
        lw $a0, 0($s3) 
        li $v0, 1
        syscall
        
        #IMPRIME PULA LINHA
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR

imprimeResultI4: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME CONSTANTE	
        lw $a0, 0($s3)  
        li $v0, 1
        syscall
        
        #IMPRIME PULA LINHA
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR

imprimeResultI5: 
        #IMPRIME CODIGO	
        move  $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall
        
        #IMPRIME RT	
        lw $t0, 0($s2)
        lw $a0, 0($t0) 
        li $v0, PRINT_STRING
        syscall	
        
        #IMPRIME CONSTANTE	
        lw $a0, 0($s3)  
        li $v0, 1
        syscall

        #IMPRIME (
        li      $a0, '('               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME RS	
        lw $t0, 0($s1)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall	

        #IMPRIME )
        li      $a0, ')'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        #IMPRIME PULA LINHA
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR

imprimeResultJ: 
	#IMPRIME CODIGO	
        move $a0, $a1 
        li $v0, PRINT_HEX
        syscall

        #IMPRIME ESPACO
        li      $a0, ' '               # $a0 = ESPACO
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall

        #IMPRIME INSTRUCAO
        lw $t0, 0($s0)
        lw $a0, 0($t0)  
        li $v0, PRINT_STRING
        syscall

        #IMPRIME TARGET	
        lw $a0, 0($s1)  
        li $v0, PRINT_HEX
        syscall
        
        li      $a0, '\n'               # $a0 = NOVA LINHA
        li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
        syscall
        
        li $v0, 15
        la $t0, descritor_arquivo_escrita
        lw $a0, 0($t0)
        la $a1, conteudoArq
        li $a2, 26
        syscall

        lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
        addiu   $sp, $sp, 12            # RESTAURA PILhA
        jr	    $ra                 # RETORNA AO PROCESSO CHAMADOR


      
