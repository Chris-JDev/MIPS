.data
input1: .asciiz "Enter number : "
input2: .asciiz "Enter power : "
nextLine: .asciiz"\n"

.text

power:
	if1:
	bne $a1, $zero,  else1
	li $v0, 1
	jr $ra
	
	else1:


	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	addi $s0, $a0, 0
	addi $a1, $a1, -1
	
	
	jal power	
	lw $ra, 0($sp)
	addi $sp, $sp, 4

	mul $v0, $v0, $s0
	jr $ra
main:	

	la $a0, input1
	li $v0, 4
	syscall
	li $v0, 5
	syscall

	addi $a0, $v0, 0
	
	addi $s0, $a0, 0

	la $a0, input2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	addi $a0, $s0, 0
	addi $a1, $v0, 0
	jal power
	
	addi $s0, $v0, 0

	la $a0, nextLine
	li $v0, 4
	syscall
	
	addi $a0, $s0, 0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
