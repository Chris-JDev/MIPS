.data

msg1: .asciiz "Enter String : "
msg2: .asciiz "Reversed String : "
inputString: .space 100
reverseString: .space 100
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
		addi $s0, $s0,1
		addi $t0, $t0, 1
		j loop1
	exit1:

	addi $t0, $s0, 0
	
	loop2:
		beq $t0, $zero, exit2
		
		addi $t0, $t0, -1
		la $t1, inputString
		add $t1, $t1, $t0
		lb $t1, 0($t1)
		
		la $t2, reverseString
		sub $t3, $s0, $t0
		addi $t3, $t3, -1
		add $t2, $t2, $t3
		sb $t1, 0($t2)

		j loop2
	exit2:

	la $a0, msg2
	li $v0, 4
	syscall

	la $a0, reverseString
	syscall

	li $v0, 10
	syscall
		
		
