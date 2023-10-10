.data 
	codigo: .word 0x040216CD
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
		li $v0, 10
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
		
		beqz $t0, tipoR
		beq $t0, 0x02, tipoJ
		beq $t0, 0x03, tipoJ
	
		j tipoI
		
    pega_opcode:
		li  $t1, 0xFC000000        # $t1 <- MASCARA PARA ISOLAR PRIMEIROS 6 BITS
        	and $v0, $a1, $t1       # $v0 <- PRIMEIROS 6 BITS DO CODIGO
        	srl $v0, $v0, 26 	   # $v0 <- SHIFTADO DIREITA 26 BITS
        	
        	jr $ra

    pega_rs:
       		li  $t1, 0x03E00000       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RS
        	and $v0, $a1, $t1       # $v0 <- 5 BITS DE RS
        	srl $v0, $v0, 21 	   # $v0 <- SHIFTADO DIREITA 21 BITS
        	
        	jr $ra

    pega_rt:
        	li  $t1, 0x001F0000       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RT
        	and $v0, $a1, $t1       # $v0 <- 5 BITS DE RT
        	srl $v0, $v0, 16	   # $v0 <- SHIFTADO DIREITA 16 BITS
        	
        	jr $ra

    pega_rd:
        	li  $t1, 0x0000F800       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE RS
        	and $v0, $a1, $t1       # $v0 <- 5 BITS DE RS
        	srl $v0, $v0, 11	   # $v0 <- SHIFTADO DIREITA 11 BITS
        	
        	jr $ra

    pega_sa:
        	li  $t1, 0x000007C0       # $t1 <- MASCARA PARA ISOLAR 5 BITS DE SA
        	and $v0, $a1, $t1       # $v0 <- 5 BITS DE SA
        	srl $v0, $v0, 6	   	# $v0 <- SHIFTADO DIREITA 6 BITS
        	
        	jr $ra

    pega_function:
        	li  $t1, 0x0000003F       # $t1 <- MASCARA PARA ISOLAR ULTIMOS 6 BITS DE FUNCTION
        	and $v0, $a1, $t1       # $v0 <- 6 BITS DE FUNCTION
        	
        	jr $ra

    pega_constante:
        	li  $t1, 0x0000FFFF       # $t1 <- MASCARA PARA ISOLAR 16 BITS DA CONSTANTE
        	and $v0, $a1, $t1       # $v0 <- 16 BITS DA CONSTANTE
        	
        	jr $ra

	pega_target:
        	li  $t1, 0x03FFFFFF       # $t1 <- MASCARA PARA ISOLAR 26 BITS DE TARGET
        	and $v0, $a1, $t1       # $a0 <- 26 BITS DE TARGET
        	
        	jr $ra

	tipoR:
		#PEGAR FUNCTION
		jal pega_function
		move $t0, $v0
		sw $t0, 0($sp)

		li $a2, 0 # contador <- 0
		while0:
			bgt $a2, 0x2B, naoAchou
			beq $t0, $a2, VetorTipoR
			add $a2, $a2, 1
		j while0

	tipoJ:
		lw $t0, 0($sp)
		li $a2, 1 # contador <- 1
		while1:
			bgt $a2, 0x39, naoAchou
			beq $t0, $a2, VetorTipoJ
			add $a2, $a2, 1
		j while1
		
	tipoI:
		lw $t0, 0($sp)
		li $a2, 1 # contador <- 1
		while2:
			bgt $a2, 0x39, naoAchou
			beq $t0, $a2, VetorTipoI
			add $a2, $a2, 1
		j while2

	VetorTipoJ:
		addi $sp, $sp, -4

		la $t0, vetor_ponteiros # $t0 <- endere?o base do vetor de ponteiros para strings
		sub $a2, $a2, 1
		sll $a2, $a2, 2
		add $t0, $a2, $t0 # t0 <- &array[i]
		
		sw $t0, 0($sp)  
		
		#PEGAR TARGET
		jal pega_target
		move $t0, $v0
		sw $v0, 4($sp)

		j imprimeResultJ

	VetorTipoI:
		lw $s1, 0($sp)      #$S1 = VALOR DO OPCODE
		addi $sp, $sp, -12

		la $t0, vetor_ponteiros # $t0 <- endere?o base do vetor de ponteiros para strings
		sub $a2, $a2, 1
		sll $a2, $a2, 2
		add $t0, $a2, $t0 # t0 <- &array[i]
		
		sw $t0, 0($sp)  
		
		#PEGAR RS
		jal pega_rs
		move $t0, $v0
		sw $t0, 4($sp)
       
		#PEGAR RT
		jal pega_rt
		move $t0, $v0
		sw $t0, 8($sp)

		#PEGAR CONSTANTE
		jal pega_constante
		move $t0, $v0
		sw $t0, 12($sp)
		
		jal traduzRegistradorRS
		jal traduzRegistradorRT

		addi $s0, $zero, 1 # $S0 = 1
		beq $s1, $s0, imprimeResultI1 #IF($S1 == 1){}

		addi $s0, $zero, 6 # $S0 = 6
		blt $s1, $s0, imprimeResultI2 #IF($S1 < 6){}

		addi $s0, $zero, 8 # $S0 = 8
		blt $s1, $s0, imprimeResultI1 #IF($S1 < 8){}

		addi $s0, $zero, 0x0F # $S0 = 0x0F
		blt $s1, $s0, imprimeResultI3 #IF($S1 < 0x0F){}

		addi $s0, $zero, 0x3A # $S0 = 0x3A
		blt $s1, $s0, imprimeResultR4 #IF($S1 < 0x3A){}

		j finit

	VetorTipoR:
		lw $s1, 0($sp)      #$S1 = VALOR DE FUNCTION
		addi $sp, $sp, -16 # AJUSTA A PILHA

		la $t0, vetor_functions # $t0 <- ENDERECO BASE DO VETOR FUNCTIONS
		sll $a2, $a2, 2     # MULTIPLICA INDICE DO VETOR POR 4
		add $t0, $a2, $t0 # $T0 <- &VETOR[i]
		
		sw $t0, 0($sp)  # guarda a string de function

		#PEGAR RS
		jal pega_rs   
		move $t0, $v0  # RECEBE O VALOR DE RS
		sw $t0, 4($sp) # GUARDA RS NA PILHA
    
		#PEGAR RT
		jal pega_rt
		move $t0, $v0 # RECEBE O VALOR DE RT
		sw $t0, 8($sp)  # GUARDA RT NA PILHA
	
		#PEGAR RD
        jal pega_rd
		move $t0, $v0 # RECEBE O VALOR DE RD
		sw $t0, 12($sp)  # GUARDA RD NA PILHA
	
		#PEGAR SA
		jal pega_sa 
		move $t0, $v0  # RECEBE O VALOR DE SA
		sw $t0, 16($sp)  # GUARDA SA NA PILHA
        
		jal traduzRegistradorRS
		jal traduzRegistradorRT
		jal traduzRegistradorRD

		addi $s0, $zero, 4 # $S0 = 4
		blt $s1, $s0, imprimeResultR1 #IF($S1 < 4){}

		addi $s0, $zero, 8 # $S0 = 8
		blt $s1, $s0, imprimeResultR2 #IF($S1 < 8){}

		beq $s1, $s0, imprimeResultR3 #IF($S1 == 8){}

		addi $s0, $zero, 9 # $S0 = 9
		beq $s1, $s0, imprimeResultR4 #IF($S1 == 9){}

		addi $s0, $zero, 0x10 # $S0 = 0x10
		blt $s1, $s0, imprimeResultR5 #IF($S1 < 0x10){}

		addi $s0, $zero, 0x10 # $S0 = 0x10
		beq $s1, $s0, imprimeResultR6 #IF($S1 == 0x10){}
		addi $s0, $zero, 0x12 # $S0 = 0x12
		beq $s1, $s0, imprimeResultR6 #IF($S1 == 0x12){}

		addi $s0, $zero, 0x11 # $S0 = 0x11
		beq $s1, $s0, imprimeResultR3 #IF($S1 == 0x11){}
		addi $s0, $zero, 0x13 # $S0 = 0x13
		beq $s1, $s0, imprimeResultR3 #IF($S1 == 0x13){}

		addi $s0, $zero, 0x20 # $S0 = 0x20
		blt $s1, $s0, imprimeResultR7 #IF($S1 < 0x20){}
		
		addi $s0, $zero, 0x2C # $S0 = 0x2C
		blt $s1, $s0, imprimeResultR8 #IF($S1 < 0x2C){}

		j finit
	traduzRegistradorRS:
		lw $t0, 4($sp) 

		li $a2, 0 # contador <- 0
		while3:
			bgt $a2, 0x1F, naoAchou
			beq $t0, $a2, registradorRS
			add $a2, $a2, 1
		j while3
	
	traduzRegistradorRT:
		lw $t0, 8($sp)

		li $a2, 0 # contador <- 0
		while4:
			bgt $a2, 0x1F, naoAchou
			beq $t0, $a2, registradorRT
			add $a2, $a2, 1
		j while4
	
	traduzRegistradorRD:
		lw $t0, 12($sp)

		li $a2, 0 # contador <- 0
		while5:
			bgt $a2, 0x1F, naoAchou
			beq $t0, $a2, registradorRD
			add $a2, $a2, 1
		j while5

	registradorRS:
		
		la $t0, vetor_registradores # $t0 <- endereco base do vetor de ponteiros para strings
		sll $a2, $a2, 2
		add $t0, $a2, $t0 # t0 <- &array[i]
		
		sw $t0, 4($sp)  
	
		jr $ra
	
	registradorRT:
		
		la $t0, vetor_registradores # $t0 <- endereco base do vetor de ponteiros para strings
		sll $a2, $a2, 2
		add $t0, $a2, $t0 # t0 <- &array[i]
		
		sw $t0, 8($sp)  
	
		jr $ra
	
	registradorRD:
		
		la $t0, vetor_registradores # $t0 <- endereco base do vetor de ponteiros para strings
		sll $a2, $a2, 2
		add $t0, $a2, $t0 # t0 <- &array[i]
		
		sw $t0, 12($sp)  
	
		jr $ra

	naoAchou:
		
		imprime_string(stringNaoAchouFuncao)
		j finit 
	
	

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
	


