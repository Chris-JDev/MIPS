.data
inp_str: .asciiz "Computer Architecture"
msg: .asciiz "The length of the string is :"
.text
main:
	la $a0, inp_str      	# base address of inp_str in $a0
	li $s0, 0	  	# i = 0
Loop:	add $t1,$s0,$a0		# address of inp_str[i] in $t1
	lbu $t2, 0($t1) 	# $t2 = inp_str[i]
	beq $t2,$zero,exit	# if inp_str[i] is null, go to exit
	addi $s0, $s0,1 	# i = i + 1
	j Loop			# go to Loop

exit:	li $v0, 4		#print string
	la $a0, msg
	syscall

	li $v0, 1		#print number
	move $a0, $s0
	syscall

	li $v0, 10              #terminating
    	syscall 