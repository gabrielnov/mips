.data
	Array: .space 80 #aloca 80 bytes da memoria, ou seja, 20 inteiros(4 bytes para cada inteiro)
	Msg: .asciiz "Informe um numero inteiro:  "
	ChaveAbre: .asciiz "\n [ "
	ChaveFecha: .asciiz "] \n"
	Espaco: .asciiz " "

.text
	li $t0, 20,    	    # contador do loop (tamanho do vetor)
	li $s0, 0             # endereço base da memoria	
	la $a0, Msg 	    # carrega mensagem para ser impressa	
	
loop:
	beq $t0,$zero,preOutput  # verifica se o contador é zero
	li $v0, 4 	    # imprime mensagem
	syscall
	
	li $v0, 5 	    # lê um número inteiro e salva em $v0
	syscall
	
	sw $v0, Array($s0)    # salva conteudo de $v0 na posição do array
	addi $s0, $s0, 4      # somando 4 bytes para pegar o endereco do proximo elemento do vetor	
	
	subi $t0, $t0, 1      # -1 no contador
	j loop                # volta pro loop	
	
preOutput:
	li $s0, 0 	    # reseta endereço base da memoria	
	li $t0, 20,    	    # reseta contador do loop (tamanho do vetor)
	
	la $a0, ChaveAbre     # carrega mensagem para ser impressa	
	li $v0, 4 	    # imprime mensagem
	syscall
	
output:  	 	    # imprime valores do array	
	beq $t0,$zero, end    # verifica se o contador é zero
	
 	lw $a0, Array($s0)    # imprime valor do array
 	li $v0, 1
 	syscall
 	
 	la $a0, Espaco         # carrega mensagem para ser impressa	
	li $v0, 4 	    # imprime mensagem
	syscall
 	
 	addi $s0, $s0, 4      # somando 4 bytes para pegar o endereco do proximo elemento do vetor
 	
 	subi $t0, $t0, 1      # -1 no contador
	j output                # volta pro loop	
 	
end: 
	la $a0, ChaveFecha    # carrega mensagem para ser impressa	
	li $v0, 4 	    # imprime mensagem
	syscall
	
 
