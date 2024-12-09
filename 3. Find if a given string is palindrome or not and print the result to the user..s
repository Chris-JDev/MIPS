.data

isPalindrome: .asciiz "It is palindrome"
isNotPalindrome: .asciiz "It is not palindrome"

message1: .asciiz "Enter String : "
string: .space 100

nextLine: .asciiz "\n"

.text

main:

	la $a0, message1
	li $v0, 4
	syscall

	la $a0, string
	li $a1, 100
	li $v0, 8
	syscall

	la $s0, string
	li $s1, 0
	
	lb $s2, nextLine
	loop1:
		add $t0, $s1, $s0
		lb $t0, 0($t0)
		beq $t0, $s2, exit1
		addi $s1, $s1, 1
		j loop1
	
	exit1:
		li $t0, 0
		addi $t1, $s1,-1
		la $a0, isPalindrome
	loop2:
		bge $t0, $t1, exit2
		add $t2, $t0, $s0
		lb $t2, 0($t2)
		add $t3, $t1,$s0
		lb $t3, 0($t3)
		bne $t2, $t3, false
		
		addi $t0, $t0, 1
		addi $t1, $t1, -1
		j loop2
	
	false:
		la $a0, isNotPalindrome
	exit2:
		li $v0 , 4
		syscall
		li $v0, 10
		syscall
