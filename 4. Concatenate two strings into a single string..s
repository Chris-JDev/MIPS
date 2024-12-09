.data

message1: .asciiz "Enter string 1 :"
message2: .asciiz "Enter string 2 :"
nextLine: .asciiz "\n"

string1: .space 100
string2: .space 100

answer: .space 100


.text

main:

	la $a0, message1
	li $v0, 4
	syscall

	la $a0, string1
	li $a1, 100
	li $v0, 8
	syscall

	la $a0, nextLine
	li $v0, 4
	syscall


	la $a0, message2
	li $v0, 4
	syscall

	la $a0, string2
	li $a1, 100
	li $v0, 8
	syscall

	la $s0, string1
	la $s1, string2
	
	la $s2, answer
	lb $s3, nextLine

	loop1:
		lb $t0, 0($s0)
		beq $t0, $s3, loop2
		sb $t0, 0($s2)
		addi $s0, $s0, 1
		addi $s2, $s2,1
		j loop1
	loop2:
		lb $t0, 0($s1)
		beq $t0, $s3, exit
		sb $t0, 0($s2)
		addi $s1, $s1, 1
		addi $s2, $s2,1
		j loop2
	exit:
		la $a0, answer
		li $v0, 4
		syscall
		li $v0, 10
		syscall
	
