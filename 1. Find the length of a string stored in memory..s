.data

inputString: .space 100 
msg1: .asciiz "Enter String : "
msg2: .asciiz "Length = "
nextLine: .asciiz "\n"

.text

main:	
	
	la $a0, msg1
	li $v0, 4
	syscall

	la $a0, inputString
	li $a1, 100
	li $v0, 8
	syscall

	la $a0, nextLine
	li $v0, 4
	syscall

	li $s0, 0
	la $t0, inputString
	loop1:
		lb $t1, 0($t0)
		beq $t1, $zero, exit1
		addi $s0, $s0, 1
		addi $t0, $t0, 1
		j loop1
	
	exit1:
	
	la $a0, msg2
	li $v0, 4
	syscall

	addi $a0, $s0 , 0
	li $v0, 1
	syscall

	li $v0, 10
	syscall
