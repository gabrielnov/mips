.data
	input1: .asciiz "Informe o primeiro numero: "
	input2: .asciiz "Informe o segundo numero: "   # TODO otimizar os campos salvos 
	input3: .asciiz "0) Soma   1) Subtração  2) Divisão  3) Multiplicação  \nInforme a operação desejada: "
	result: .asciiz "Resultado: "

.text
	li $v0, 4
	la $a0, input1
	syscall

	li $v0, 7# salva primeiro numero em $f0
	syscall
	mov.d $f2, $f0 # move $f0 para $f1

	li $v0, 4
	la $a0, input2
	syscall

	li $v0, 7 # salva primeiro numero em $f0
	syscall

	li $v0, 4
	la $a0, input3
	syscall

	li $v0, 5
	syscall
	
	beq $v0, 0, sum
	beq $v0, 1, subtr
	beq $v0, 2, divide
	beq $v0, 3, multiply

sum:
	add.d $f12, $f0, $f2
	j output
	
subtr:
	sub.d $f12, $f2, $f0
	j output
		
divide:
	div.d $f12, $f2, $f0
	j output
		
multiply:
	mul.d $f12, $f2, $f0
	j output
	
output:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 3	
	syscall
	