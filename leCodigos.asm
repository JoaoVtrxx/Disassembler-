.data
        descritor_arquivo: .word 0                  # descritor do arquivo: um inteiro n�o negativo
        nome_do_arquivo: .asciiz "notas.bin"        # nome do arquivo
        .align 2                                    # Alinhamos o endere�o de buffer para ser m�ltiplo de 4, sen�o erro:
                                                    # "store address not aligned on word boundary" ou endere�o de armazenamento
                                                    # n�o est� alinhado com os limites da palavra
        buffer_leitura: .space 32                   # buffer para a leitura do arquivo 

        str_erro_abertura_arquivo: .asciiz "[ERRO] O arquivo n�o p�de ser aberto\n"
        str_erro_leitura_registro: .asciiz "[ERRO] Erro de leitura do arquivo"

        campos_ponteiro: .word campo_ID

        campos_nomes:
        campo_ID: .asciiz "Codigo: "                      # 0


.text

init:
            jal     main                    # executa o procedimento principal
finit:
            move	$a0, $v0                # $a0 <- c�digo de retorno do programa
            li      $v0, 17                 # $v0 <- n�mero do servi�o exit2
            syscall                         # executamos o servi�o exit 2



arquivo_abrir_leitura:

            li      $a1, 0                  # $a1 <- flag igual a 0: abre o arquivo para leitura.
            li      $a2, 0                  # $a2 <- modo. N�o � usado
            li      $v0, 13                 # $v0 <- servi�o 13: abre arquivo para leitura ou escrita
            syscall                         # realizamos uma chamada ao sistema, para a abertura do arquivo

            jr	    $ra                     # retorma ao procedimento chamador


arquivo_fechar:

            li      $v0, 16                 # $v0 <- servi�o 16: fechamos o arquivo com o descritor em $a0
            syscall                         # realizamos uma chamada ao sistema, fechando o arquivo com o descritor em $a0

            jr	    $ra                     # retorna ao procedimento chamador


arquivo_leia_registro:

            lw      $a0, 0($t0)             # $a0 <- descritor do arquivo. $t0 cont�m o endere�o do descritor_arquivo
            la	    $a1, buffer_leitura     # $a1 <- endere�o do buffer com os dados que ser�o escritos
            li      $a2, 4                  # $a2 <- n�mero de bytes que ser�o lidos do arquivo para o buffer
            li      $v0, 14                 # $v0 <- servi�o 14: leia um arquivo
            syscall                         # realiza uma chamada ao sistema, lendo 4 bytes para o buffer no arquivo

            jr	    $ra                     # retornamos ao procedimento chamador


campo_imprime_nome:
            # imprimimos o nome do campo
            la	    $t0, campos_ponteiro    # carregamos o endere�o do vetor de ponteiros para as strings com os nomes dos campos

            lw      $a0, 0($t0)             # $a0 <- ponteiro com o endere�o da string que ser�a apresentada
            li      $v0, 4                  # $v0 <- n�mero do servi�o para imprimir uma string
            syscall                         # apresentamos o nome do campo
            
            jr      $ra                     # retorna ao procedimento chamador

registro_processa:
   
            addiu   $sp, $sp, -12           # ajustamos a pilha
            sw      $a0, 8($sp)             # armazenamos na pilha o argumento com o endere�o do buffer de leitura
            sw      $ra, 4($sp)             # armazenamos na pilha o endere�o de retorno

rp_for_codigo:
            # imprimimos o nome do campo
            jal     campo_imprime_nome      # apresenta o nome do campo

            # carregamos o registro
            lw      $t0, 8($sp)             # $t0 <- endere�o do buffer
            lw      $t1, 0($t0)             # $t1 <- registro
          
    
            lw      $t3, 8($sp)             # $t3 <- endere�o do buffer
            lw      $t4, 0($t3)             # $t4 <- registro

            move    $a0, $t4                # $a0 <- campo ID deslocado para a direita
            li      $v0, 34                 # $v0 <- n�mero do servi�o para imprimir um inteiro em hexadecimal
            syscall                         # imprimimos o campo
            # pulamos a linha

            li      $a0, '\n'               # $a0 <- nova linha
            li      $v0, 11                 # $v0 <- servi�o para imprimir um caractere
            syscall                         # imprimimos uma nova linha.

rp_for_condicao:
            # pulamos a linha
            li      $a0, '\n'               # $a0 <- nova linha
            li      $v0, 11                 # $v0 <- servi�o para imprimir um caractere
            syscall                         # imprimimos uma nova linha.

            lw	    $s0, 0($sp)             # restauramos $s0
            lw      $ra, 4($sp)             # restauramos o endere�o de retorno
            addiu   $sp, $sp, 12            # restauramos a pilha
            jr	    $ra                     # retorna ao processo chamador

main:

            addiu   $sp, $sp, -8            # ajustamos a pilha
            sw	    $ra, 4($sp)             # armazenamos $ra na pilha

            sw	    $zero, 0($sp)           # c�digo de retorno = 0 = SUCESSO

            # abrimos o arquivo para leitura
            la	    $a0, nome_do_arquivo    # $a0 <- endere�o da string com o nome do arquivo
            jal     arquivo_abrir_leitura   # abre o arquivo para a leitura
            la      $t0, descritor_arquivo  # $t0 <- endere�o onde ser� armazenado o descritor do arquivo
            sw      $v0, 0($t0)             # armazenamos em descritor_arquivo o descritor encontrado na abertura do arquivo

            # se o arquivo n�o pode ser aberto, tratamos o erro
            slt     $t0, $v0, $zero         # se o descritor for menor que 0
            bne     $t0, $zero, main_if_arquivo_nao_pode_ser_aberto

main_if_arquivo_aberto:
            j       main_if_arquivo_fim     # sem erro de abertura: continua com o programa

main_if_arquivo_nao_pode_ser_aberto:
            # imprimimos uma string 
            la      $a0, str_erro_abertura_arquivo  # $a0 <- endere�o da string com a mensagem de erro
            li      $v0, 4                  # $v0 <- servi�o 4: imprime uma string
            syscall                         # imprimimos a mensagem de erro
            li      $v0, 1                  # $v0 <- 1, valor de retorno indicando erro no programa
            bne     $t0, $zero, fim_leitura_registros # encerra o procedimento mais

main_if_arquivo_fim:
            # lemos um registro do arquivo (uma palavra, 4 bytes)
main_while:
            j       main_while_verifica_condicao

main_while_codigo:
            # verificamos se o n�mero de bytes lido � 4
            slti    $t0, $v0, 4             # se um registro n�o p�de ser lida do arquivo de entrada
            bne     $t0, $zero,main_if_leitura_registro_erro # termina o programa

main_if_leitura_registro_ok:
            la      $a0, buffer_leitura     # $a0 <- endere�o do buffer de leitura
            jal     registro_processa       # processa o registro lido do arquivo de entrada
            j       main_if_leitura_registro_fim # termina o processamento do registro

main_if_leitura_registro_erro:
            # imprimimos uma string 
            la      $a0, str_erro_leitura_registro  # $a0 <- endere�o da string com a mensagem de erro
            li      $v0, 4                  # $v0 <- servi�o 4: imprime uma string
            syscall                         # imprimimos a mensagem de erro
            li      $v0, 1                  # $v0 <- 1, valor de retorno indicando erro no programa
            bne     $t0, $zero, fim_leitura_registros # encerra o procedimento mais            

main_if_leitura_registro_fim:
main_while_verifica_condicao:
                la      $t0, descritor_arquivo  # $t0 <- endere�o onde ser� armazenado o descritor do arquivo
                lw      $a0, 0($t0)             # $a0 <- descritor do arquivo
                la      $a1, buffer_leitura     # $a1 <- endere�o do buffer de leitura
                jal     arquivo_leia_registro   # tentamos ler um registro (4 bytes), $v0 retorna o n�mero de bytes lidos
                bne     $v0, $zero, main_while_codigo # se n�o chegamos ao final do arquivo, processamos o registro


fim_leitura_registros:
            # fechamos o arquivo
            la      $t0, descritor_arquivo  # $t0 <- endere�o do descritor do arquivo
            lw      $a0, 0($t0)             # $a0 <- descritor do arquivo
            jal     arquivo_fechar          # fechamos o arquivo

            lw      $ra, 4($sp)             # restauramos o endere�o de retorno
            lw      $v0, 0($sp)             # $v0 <- c�digo de retorno do procedimento: 0 = SUCESSO
            addiu   $sp, $sp, 8             # restauramos a pilha
            jr	    $ra                     # retornamos ao procedimento chamador




      