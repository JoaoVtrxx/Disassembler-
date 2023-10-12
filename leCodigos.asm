.data
        descritor_arquivo: .word 0                  # descritor do arquivo: um inteiro nao negativo
        nome_do_arquivo: .asciiz "notas.bin"        # nome do arquivo
        .align 2                                    # Alinhamos o endereco de buffer para ser multiplo de 4, sendo erro:
                                                    # "store address not aligned on word boundary" ou enderedo de armazenamento
                                                    # nao esta alinhado com os limites da palavra
        buffer_leitura: .space 32                   # buffer para a leitura do arquivo 

        str_erro_abertura_arquivo: .asciiz "[ERRO] O arquivo nao pode ser aberto\n"
        str_erro_leitura_registro: .asciiz "[ERRO] Erro de leitura do arquivo"



.text

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

arquivo_fechar:

            li      $v0, 16                 # $v0 = SERVICO 16: FECHA O ARQUIVO COM DESCRITOR EM $a0
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
            sw      $a0, 8($sp)             # ARMAZENA NA PILHA ARGUMENTO COM ENDERECO DO BUFFER 
            sw      $ra, 4($sp)             # ARMAZENA NA PILHA ENDERECO DE RETORNO

            # IMPRIME REGISTRO
            lw      $t0, 8($sp)             # $t0 = ENDERECO DO BUFFER
            lw      $t1, 0($t0)             # $t1 = CODIGO

            move    $a0, $t1                # $a0 = CODIGO 
            li      $v0, 34                 # $v0 = IMPRIMIR HEXADECIMAL
            syscall                         


            li      $a0, '\n'               # $a0 = NOVA LINHA
            li      $v0, 11                 # $v0 = IMPRIMIR CARACTER
            syscall                        

            lw      $ra, 4($sp)             # RESTAURA O ENDERECO DE RETORNO
            addiu   $sp, $sp, 12            # RESTAURA PILA
            jr	    $ra                     # RETORNA AO PROCESSO CHAMADOR

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
            la      $t0, descritor_arquivo  # $t0 = ENDERECO DO DESCRITOR DO ARQUIVO
            lw      $a0, 0($t0)             # $a0 = DESCRITOR DO ARQUIVO
            jal     arquivo_fechar          # FECHAMOS O ARQUIVO

            lw      $ra, 4($sp)             # RESTAURA ENDERECO DE RETORNO PARA INIT
            lw      $v0, 0($sp)             # $v0 = CODIGO DE RETORNO DO PROCEDIMENTO: 0 = SUCESSO
            addiu   $sp, $sp, 8             # RESTAURA PILHA
            jr	    $ra                     # RETORNAMOS AO PROCEDIMENTO CHAMADOR (INIT)




      
