.data

input1: .space 100
message1: .asciiz "Enter input string : "
message2: .asciiz "Inputed String : "
nextLine: .asciiz "\n"

.text
	
main:
	la $a0, message1
	li $v0, 4
	syscall
	
	li $a1, 100
	la $a0, input1
	li $v0, 8
	syscall
	
	la $a0, nextLine
	li $v0, 4
	syscall

	la $a0, message2
	li $v0, 4
	syscall

	la $a0, input1
	li $v0, 4
	syscall

	li $v0, 10
	syscall
