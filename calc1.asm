	.data
input1: .asciiz "Informe o primeiro numero: "
input2: .asciiz "Informe o segundo numero: "   # TODO otimizar os campos salvos 
input3: .asciiz "0) Soma   1) Subtração  2) Divisão  3) Multiplicação  \nInforme a operação desejada: "
result: .asciiz "Resultado: "


	.text

main:
	li $v0, 4
	la $a0, input1
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 4
	la $a0, input2
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	li $v0, 4
	la $a0, input3
	syscall

	li $v0, 5
	syscall
	
	li $v0, 4
	la $a0, result
	syscall
	
	# TODO: validar input
	beq $v0, 0, sum
	beq $v0, 1, subtr
	beq $v0, 2, divide
	beq $v0, 3, multiply
	
sum:
	add $s2, $s0, $s1
	j output
	
subtr:
	sub $s2, $s0, $s1
	j output
		
divide:
	div $s0, $s1
	mflo $s2
	j output
		
multiply:
	mult $s0, $s1
	mflo $s2
	j output
	
output:
	la $a0, ($s2)
	li $v0, 1	
	syscall



