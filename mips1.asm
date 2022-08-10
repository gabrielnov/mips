	.data
input1: .asciiz "Informe o primeiro numero: "
input2: .asciiz "Informe o segundo numero: "   # TODO otimizar os campos salvos 
input3: .asciiz "0) Soma   1) Subtração  2) Multiplicação  3) Divisão\nInforme a operação desejada: "
result: .asciiz "O resultadoeh "


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
	
	bne $v0, 0, exit

	add $s2, $s0, $s1
	la $a0, ($s2)
	li $v0, 1	
	syscall

exit:


