.data

A: .float 1.0
B: .float 1.5
C: .float 1.25

input1: .asciiz "Enter x : "
nextLine: .asciiz "\n"

.text

main:

	la $a0, input1
	li $v0, 4
	syscall

	li $v0, 6
	syscall

	mul.s $f1, $f0, $f0 #x^2
	
	lwc1 $f2, A 
	lwc1 $f3, B
	lwc1 $f4, C

	mul.s $f2, $f2, $f1 #a * x^2
	mul.s $f3, $f3, $f0 # b * x
	
	add.s $f2, $f2, $f3 
	add.s $f12, $f2, $f4
	
	la $a0, nextLine
	li $v0, 4
	syscall
	
	li $v0, 2
	syscall

	li $v0, 10
	syscall
