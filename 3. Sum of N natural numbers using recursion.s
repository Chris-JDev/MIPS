.data

input1: .asciiz "Enter n : "
nextLine: .asciiz "\n"




.text

sumOfN:

	if1:
	bne $a0, $zero, else1
	li $v0, 0
	jr $ra

	else1:
	
	addi $sp, $sp, -8
	sw $ra , 0($sp)
	sw $a0, 4($sp)
	
	addi $a0, $a0, -1
	jal sumOfN
	
	lw $a0, 4($sp)
	add $v0, $v0, $a0
	
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
main:

	la $a0, input1
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	
	addi $a0, $v0, 0
	li $v0, 0

	jal sumOfN
	
	addi $s0, $v0, 0
	la $a0, nextLine
	li $v0, 4
	syscall
	
	addi $a0, $s0, 0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
