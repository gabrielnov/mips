# Gabriel de Carvalho Novaes - 31897282
# Alex Se Yoon Koo - 32129319

.data
	msg: .asciiz "\nDigite um numero: "
	soma: .asciiz "\nSoma de N1 + N2 = "
	subt: .asciiz "\nSubtracao de N1 - N2 = "
	multi: .asciiz "\nMultiplicacao de N1 * N2 = "
	divi: .asciiz "\nDivisao de N1 / N2 = "
	
.text
	#imprime mensagem solicitando um numero
	la $a0, msg
	li $v0, 4
	syscall
	
	#le o primeiro numero	
	li $v0, 5
	syscall
	
	move $s1, $v0	
	
	#imprime mensagem solicitando um numero
	li $v0, 4
	syscall
	
	#le o segundo numero
	li $v0, 5
	syscall
	
	move $s2, $v0
	
	#realiza soma e imprime mensagem padrao e resultado
	add $s3, $s1, $s2
		
	la $a0, soma
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall
	
	sub $s3, $s1, $s2
		
	#realiza subtracao e imprime mensagem padrao e resultado
	la $a0, subt
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall
	
	mul $s3, $s1, $s2
	
	#realiza multiplicacao e imprime mensagem padrao e resultado	
	la $a0, multi
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall
	
	
	#realiza divisao
	div $s1, $s2
		
	#move o quociente	
	mflo $s3
	#move o resto
	mfhi $s4
	
	li $s5, 10
	mul $s4, $s5, $s4
	div $s4, $s2
	
	#move o quociente
	mflo $s4
	
	#imprime mensagem padrão
	la $a0, divi
	li $v0, 4
	syscall
	
	#imprime valor inteiro
	move $a0, $s3
	li $v0, 1
	syscall
	
	#imprime ponto entre o valor inteiro e decimal
	li $a0, '.'
	li $v0, 11
	syscall
	
	#imprime valor decimal
	move $a0, $s4
	li $v0, 1
	syscall
	
	
	
