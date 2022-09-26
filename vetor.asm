#ALEX SE YOON KOO 32129319
#GABRIEL DE CARVALHO NOVAES 31897282
.data
	c: .word 3, 33, 1, 2, 6, 2, 4, 3, 7, 8, 10, 9, 15, 20, 87  # definindo vetor
	printMedia: .asciiz "\nMedia = "
	printMenor: .asciiz "\nMenor = "
	printMaior: .asciiz "\nMaior = "
	
.text
	li $t0,0    # resultado da soma
			
	li $t3, 15, # contador do loop (tamanho do vetor)
	la $s0, c   #coloca o endereco de c[0] em s0 	
	
	lw $t1, 0($s0)  # guarda o menor valor, inicializa com o primeiro valor do vetor
	lw $t2, 0($s0)  # guarda o maior valor, inicializa com o primeiro valor do vetor
	
loop:
	beq $t3,$zero,output  # verifica se o contador é zero
	
	lw $s1, 0($s0)      # coloca o elemento do end que esta em s0 no s1, s1=c[0]
	add $t0, $t0, $s1   # soma = soma + s1

	slt $s2, $t1, $s1 # verifica se o valor $s1 do vetor é maior que o valor salvo em $t1
	bne $s2, $zero, setMaior # caso true, vai para a função 
	move $t1, $s1 # caso false, seta o menor valor
	
contLoop:
	addi $s0, $s0, 4    # somando 4 bytes para pegar o endereco do proximo elemento do vetor	
	subi $t3, $t3, 1    # -1 no contador
	j loop              # volta pro loop	

setMaior:
	move $t2, $s1 # seta o maior valor
	j contLoop

output:
	div $t4, $t0, 15 # calcula media e salva em $t4
		
	# Imprime "Media = "		
	li $v0,4
	la $a0,printMedia
	syscall 

	# Imprime o resultado guardado em $t0		
	li $v0, 1
	move $a0, $t4
	syscall 
	
	# Imprime "Menor = "		
	li $v0,4
	la $a0,printMenor
	syscall 

	# Imprime o resultado guardado em $t1		
	li $v0, 1
	move $a0, $t1
	syscall 
	
	# Imprime "Maior = "		
	li $v0,4
	la $a0,printMaior
	syscall 

	# Imprime o resultado guardado em $t2		
	li $v0, 1
	move $a0, $t2
	syscall 
	
	
	