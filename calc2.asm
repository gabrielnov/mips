
.data
	msg: .asciiz "\nDigite um numero: "
	soma: .asciiz "\nSoma de N1 + N2 = "
	subt: .asciiz "\nSubtracao de N1 - N2 = "
	multi: .asciiz "\nMultiplicacao de N1 * N2 = "
	divi: .asciiz "\nDivisao de N1 / N2 = "
	
.text
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s1, $v0	

	li $v0, 4
	syscall
	
	#le o segundo numero
	li $v0, 5
	syscall
	
	move $s2, $v0
	add $s3, $s1, $s2
		
	la $a0, soma
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall
	
	sub $s3, $s1, $s2
		
	la $a0, subt
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall
	
	mul $s3, $s1, $s2
	
	la $a0, multi
	li $v0, 4
	syscall
	
	la  $a0, ($s3)
	li $v0, 1
	syscall

	div $s1, $s2
		
	mflo $s3
	mfhi $s4
	
	li $s5, 10
	mul $s4, $s5, $s4
	div $s4, $s2
	
	mflo $s4

	la $a0, divi
	li $v0, 4
	syscall
	
	move $a0, $s3
	li $v0, 1
	syscall
	
	li $a0, '.'
	li $v0, 11
	syscall

	move $a0, $s4
	li $v0, 1
	syscall
	
	
	
