.data

input1: .asciiz "Enter Fahrenheit temp : "
nextLine: .asciiz "\n"

five: .float 5.0
nine: .float 9.0

thirty_two: .float 32.0

.text

main:
	la $a0, input1
	li $v0, 4
	syscall

	li $v0, 6
	syscall

	lwc1 $f1, five
	lwc1 $f2, nine
	lwc1 $f3, thirty_two 

	div.s $f4, $f1,$f2 #5/9 
	sub.s $f0, $f0, $f3 #input-32
	mul.s $f12, $f4, $f0 # (5/9)* (input-32) answer stored in f12 for printing 

	la $a0, nextLine
	li $v0, 4
	syscall

	li $v0, 2
	syscall

	li $v0, 10
	syscall 
	
