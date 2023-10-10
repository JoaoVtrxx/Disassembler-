.data 
	codigo: .word 0x000216CD
	stringNaoAchouFuncao: .asciiz "Funcao nao encontrada... "
	
	string1: .asciiz "Opcode: "
	string3: .asciiz "\nRS: "
	string4: .asciiz "\nRT: "
	string5: .asciiz "\nRD: "
	string6: .asciiz "\nSA: "
	string7: .asciiz "\nFunction: "
	string8: .asciiz "\nConstante: "
	string9: .asciiz "\nTarget: "

	.eqv PRINT_STRING 4
	.eqv PRINT_HEX 34
	
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
	vetor_ponteiros: .word str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13

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
	vetor_functions: .word func0, func1, func2, func3, func4, func5, func6, func7, func8, func9, func10, func11, func12, func13
	

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
	vetor_registradores: .word reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17
	
	
.text 
	.macro imprime_string (%string_value)
	la $a0, %string_value
	li $v0, PRINT_STRING

	syscall
	.end_macro
	
	init:
		j main
	
	finit:
		li $v0, 17 #ENCERRA O PROGRAMA
		syscall

	main:
		addi $sp, $sp, -4
		#PASSANDO CODIGO PARA REGISTRADOR $a1
		lw  $a1, codigo

		#PEGAR OPCODE
		jal pega_opcode
	
		#PASSANDO OPCODE PARA REGISTRADOR $T0
		sw $v0, 0($sp)
		move $t0, $v0
		
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
        	
        	jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

	pega_target:
        	li  $t1, 0x03FFFFFF       # $t1 <- MASCARA PARA ISOLAR 26 BITS DE TARGET
        	and $v0, $a1, $t1       # $a0 <- 26 BITS DE TARGET
        	
        	jr $ra #RETORNA PARA A CHAMADA DA FUNCAO

	tipoR:
		jal pega_function  # PEGAR FUNCTION
		move $t0, $v0 	   # $T0 = RETORNO DA FUNCAO
		sw $t0, 0($sp) 	   # STORE O VALOR DE T0 NA PILHA

		li $a2, 0 # CONTADOR = 0
		while0:
			bgt $a2, 0x2B, naoAchou # SE CONTADOR > 0X2B ENTAO NAO ACHOU
			beq $t0, $a2, VetorTipoR # SE CONTADOR == FUNCTION
			add $a2, $a2, 1 # CONTADOR++
		j while0 

	tipoJ:
		lw $t0, 0($sp) # $T0 = OPCODE DA PILHA
		li $a2, 1 # CONTADOR = 1
		while1:
			bgt $a2, 0x39, naoAchou  # SE CONTADOR > 0X39 ENTAO NAO ACHOU
			beq $t0, $a2, VetorTipoJ # SE CONTADOR == OPCODE 
			add $a2, $a2, 1 # CONTADOR++
		j while1
		
	tipoI:
		lw $t0, 0($sp) # $T0 = OPCODE DA PILHA
		li $a2, 1 # CONTADOR = 1
		while2:
			bgt $a2, 0x39, naoAchou # SE CONTADOR > 0X39 ENTAO NAO ACHOU
			beq $t0, $a2, VetorTipoI # SE CONTADOR == OPCODE 
			add $a2, $a2, 1 # CONTADOR++
		j while2

	VetorTipoJ:
		addi $sp, $sp, -4       #AJUSTA PILHA

		la $t0, vetor_ponteiros # $T0 = ENDERECO BASE DO VETOR DE INSTRUCOES
		sub $a2, $a2, 1         # INDICE = INDICE - 1
		sll $a2, $a2, 2         # INDICE * 4
		add $t0, $a2, $t0       # $T0 = &VETOR[I]
		
		sw $t0, 0($sp)          #GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA PILHA
		
		jal pega_target        	#PEGAR TARGET
		move $t0, $v0			#$T0 RECEBE O RETORNO DA FUNCAO
		sw $v0, 4($sp)			#GUARDA O TARGET NA PILHA

		j imprimeResultJ       #IMPRIME RESULTADO TIPO j

	VetorTipoI:
		lw $s1, 0($sp)      # $S1 = VALOR DO OPCODE DA PILHA
		addi $sp, $sp, -12	# AJUSTA PILHA

		la $t0, vetor_ponteiros # $T0 = ENDERECO BASE DO VETOR DE INSTRUCOES
		sub $a2, $a2, 1 		# INDICE = INDICE - 1
		sll $a2, $a2, 2			# INDICE * 4
		add $t0, $a2, $t0 		# $T0 = &VETOR[I]
		
		sw $t0, 0($sp)   		# GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA PILHA
		
		jal pega_rs				# PEGAR RS
		move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 4($sp)			# GUARDA O RS NA PILHA
       
		jal pega_rt				# PEGAR RT
		move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 8($sp)			# GUARDA O RT NA PILHA

		jal pega_constante		# PEGAR CONSTANTE
		move $t0, $v0			# $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 12($sp)			# GUARDA O RT NA PILHA
		
		jal traduzRegistradorRS  # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
		jal traduzRegistradorRT	 # TRADUZ VALOR DO REGISTRADOR RT PARA STRING

		addi $s0, $zero, 1 # $S0 = 1
		beq $s1, $s0, imprimeResultI1 # IF($S1 == 1) IMPRIME RESULTADO FORMATO i1

		addi $s0, $zero, 6 # $S0 = 6
		blt $s1, $s0, imprimeResultI2 # IF($S1 < 6) IMPRIME RESULTADO FORMATO i2

		addi $s0, $zero, 8 # $S0 = 8
		blt $s1, $s0, imprimeResultI1 # IF($S1 < 8) IMPRIME RESULTADO FORMATO i1

		addi $s0, $zero, 0x0F # $S0 = 0x0F
		blt $s1, $s0, imprimeResultI3 # IF($S1 < 0x0F) IMPRIME RESULTADO FORMATO i3

		addi $s0, $zero, 0x3A # $S0 = 0x3A
		blt $s1, $s0, imprimeResultR4 # IF($S1 < 0x3A) IMPRIME RESULTADO FORMATO i4

		j finit # ENCERRA PROGRAMA

	VetorTipoR:
		lw $s1, 0($sp)      # $S1 = VALOR DE FUNCTION
		addi $sp, $sp, -16  # AJUSTA A PILHA

		la $t0, vetor_functions 	# $T0 = ENDERECO BASE DO VETOR DE FUNCTIONS
		sll $a2, $a2, 2     		# INDICE * 4
		add $t0, $a2, $t0 			# $T0 = &VETOR[I]
		
		sw $t0, 0($sp)  			# GUARDAMOS O ENDERECO DA STRING DA INSTRUCAO NA PILHA

		
		jal pega_rs   	# PEGAR RS
		move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 4($sp) 	# GUARDA O RS NA PILHA
    
		jal pega_rt 	# PEGAR RT
		move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 8($sp)  # GUARDA O RT NA PILHA
	
        jal pega_rd		# PEGAR RD
		move $t0, $v0 	# $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 12($sp) # GUARDA O RD NA PILHA
		
		jal pega_sa 	# PEGAR SA
		move $t0, $v0   # $T0 RECEBE O RETORNO DA FUNCAO
		sw $t0, 16($sp) # GUARDA O SA NA PILHA
        
		jal traduzRegistradorRS # TRADUZ VALOR DO REGISTRADOR RS PARA STRING
		jal traduzRegistradorRT # TRADUZ VALOR DO REGISTRADOR RT PARA STRING
		jal traduzRegistradorRD # TRADUZ VALOR DO REGISTRADOR RD PARA STRING

		addi $s0, $zero, 4 # $S0 = 4
		blt $s1, $s0, imprimeResultR1 # IF($S1 < 4) IMPRIME RESULTADO FORMATO R1

		addi $s0, $zero, 8 # $S0 = 8
		blt $s1, $s0, imprimeResultR2 #I F($S1 < 8) IMPRIME RESULTADO FORMATO R2

		beq $s1, $s0, imprimeResultR3 # IF($S1 == 8) IMPRIME RESULTADO FORMATO R3

		addi $s0, $zero, 9 # $S0 = 9
		beq $s1, $s0, imprimeResultR4 # IF($S1 == 9) IMPRIME RESULTADO FORMATO R4

		addi $s0, $zero, 0x10 # $S0 = 0x10
		blt $s1, $s0, imprimeResultR5 # IF($S1 < 0x10) IMPRIME RESULTADO FORMATO R5

		addi $s0, $zero, 0x10 # $S0 = 0x10
		beq $s1, $s0, imprimeResultR6 # IF($S1 == 0x10) IMPRIME RESULTADO FORMATO R6
		addi $s0, $zero, 0x12 # $S0 = 0x12
		beq $s1, $s0, imprimeResultR6 # IF($S1 == 0x12) IMPRIME RESULTADO FORMATO R6

		addi $s0, $zero, 0x11 # $S0 = 0x11
		beq $s1, $s0, imprimeResultR3 # IF($S1 == 0x11) IMPRIME RESULTADO FORMATO R3
		addi $s0, $zero, 0x13 # $S0 = 0x13
		beq $s1, $s0, imprimeResultR3 # IF($S1 == 0x13) IMPRIME RESULTADO FORMATO R3

		addi $s0, $zero, 0x20 # $S0 = 0x20
		blt $s1, $s0, imprimeResultR7 # IF($S1 < 0x20) IMPRIME RESULTADO FORMATO R7
		
		addi $s0, $zero, 0x2C # $S0 = 0x2C
		blt $s1, $s0, imprimeResultR8 # IF($S1 < 0x2C) IMPRIME RESULTADO FORMATO R8

		j finit #ENCERRA O PROGRAMA
	traduzRegistradorRS:
		lw $t0, 4($sp) # $T0 = RS DA PILHA

		li $a2, 0 # CONTADOR = 0
		while3:
			bgt $a2, 0x1F, naoAchou 	# SE CONTADOR > 0X1F ENTAO NAO ACHOU
			beq $t0, $a2, registradorRS # SE CONTADOR == REGISTRADOR 
			add $a2, $a2, 1	# CONTADOR++
		j while3
	
	traduzRegistradorRT:
		lw $t0, 8($sp) # $T0 = Rt DA PILHA

		li $a2, 0 # CONTADOR = 0
		while4:
			bgt $a2, 0x1F, naoAchou		# SE CONTADOR > 0X1F ENTAO NAO ACHOU
			beq $t0, $a2, registradorRT # SE CONTADOR == REGISTRADOR 
			add $a2, $a2, 1 # CONTADOR++
		j while4
	
	traduzRegistradorRD:
		lw $t0, 12($sp) # $T0 = Rt DA PILHA

		li $a2, 0 # CONTADOR = 0
		while5:
			bgt $a2, 0x1F, naoAchou 	# SE CONTADOR > 0X1F ENTAO NAO ACHOU
			beq $t0, $a2, registradorRD	# SE CONTADOR == REGISTRADOR
			add $a2, $a2, 1				# CONTADOR++
		j while5

	registradorRS:
		
		la $t0, vetor_registradores # $T0 = ENDERECO BASE DO VETOR DE REGISTRADORES
		sll $a2, $a2, 2				# INDICE * 4
		add $t0, $a2, $t0 			# $T0 = &VETOR[I]
		
		sw $t0, 4($sp)  			#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA PILHA
	
		jr $ra						#RETORNA PARA A CHAMADA DA FUNCAO
	
	registradorRT:
		
		la $t0, vetor_registradores # $T0 = ENDERECO BASE DO VETOR DE REGISTRADORES
		sll $a2, $a2, 2				# INDICE * 4
		add $t0, $a2, $t0 			# $T0 = &VETOR[I]
		
		sw $t0, 8($sp)  			#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA PILHA
	
		jr $ra						#RETORNA PARA A CHAMADA DA FUNCAO
	
	registradorRD:
		
		la $t0, vetor_registradores # $T0 = ENDERECO BASE DO VETOR DE REGISTRADORES
		sll $a2, $a2, 2				# INDICE * 4
		add $t0, $a2, $t0 			# $T0 = &VETOR[I]
		
		sw $t0, 12($sp)  			#GUARDAMOS O ENDERECO DA STRING DO REGISTRADOR NA PILHA
	
		jr $ra						#RETORNA PARA A CHAMADA DA FUNCAO

	naoAchou:
		
		imprime_string(stringNaoAchouFuncao) #IMPRIME STRING NAO ACHOU
		j finit  #ENCERRA O PROGRAMA
	
	

	imprimeResultR1: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RD 	
		lw $t0, 12($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME SA	
		lw $a0, 16($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 20
		j finit

	imprimeResultR2: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RD 	
		lw $t0, 12($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	

		j finit
		
	imprimeResultR3: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)
		li $v0, PRINT_STRING
		syscall	

		j finit
	imprimeResultR4: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RD 	
		lw $t0, 12($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)
		li $v0, PRINT_STRING
		syscall	
		j finit

	imprimeResultR5: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall

		j finit


	imprimeResultR6: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RD 	
		lw $t0, 12($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall

		j finit
	imprimeResultR7: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	

		j finit
	imprimeResultR8: 	
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RD 	
		lw $t0, 12($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	

		j finit
	imprimeResultI1: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME CONSTANTE	
		lw $a0, 12($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 16
		j finit
	
	imprimeResultI2: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME CONSTANTE	
		lw $a0, 12($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 16
		j finit

	imprimeResultI3: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall	

		#IMPRIME RS	
		lw $t0, 4($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME CONSTANTE	
		lw $a0, 12($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 16
		j finit

	imprimeResultI4: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall
		
		#IMPRIME RT	
		lw $t0, 8($sp)
		lw $a0, ($t0) 
		li $v0, PRINT_STRING
		syscall	
		
		#IMPRIME CONSTANTE	
		lw $a0, 12($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 16
		j finit


	imprimeResultJ: 
	
		#IMPRIME INSTRUCAO
		lw $t0, 0($sp)
		lw $a0, ($t0)  
		li $v0, PRINT_STRING
		syscall

		#IMPRIME TARGET	
		lw $a0, 4($sp)  
		li $v0, 34
		syscall
		
		addi $sp, $sp, 8
		j finit
	


