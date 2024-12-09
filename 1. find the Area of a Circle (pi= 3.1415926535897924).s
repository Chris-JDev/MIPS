.data

pi: .double 3.1415926535897924
input1: .asciiz "Enter radius : "
nextLine: .asciiz "\n"

.text

main:

	la $a0, input1
	li $v0, 4
	syscall
	
	li $v0, 7 #double read in $f0
	syscall

	la $a0, pi
	ldc1 $f2, 0($a0)
	
	mul.d $f0, $f0, $f0 # r^2
	mul.d $f12, $f0, $f2 #store the answer in f12 for printing double
	
	la $a0, nextLine
	li $v0, 4
	syscall
	
	li $v0, 3
	syscall

	li $v0, 10
	syscall

	
	
	
