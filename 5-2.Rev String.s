.data
inp_str: .asciiz "Computer Architecture"
backwards: .asciiz "That reversed string is:\n"
rev_str: .space 50
.text
main:
	la $t0, inp_str      	# base address of inp_str in $a0
	la $a1, rev_str 	# base address of rev_str in $a1
	li $s0, 0	  	# i = 0

Loop1:	add $t1,$s0,$t0		# address of inp_str[i] in $t1
	lbu $t2, 0($t1) 	# $t2 = inp_str[i]
	beq $t2,$zero,out	# if inp_str[i] != 0, go to out
	addi $s0, $s0,1 	# i = i + 1 
	j Loop1			# go to Loop1

out:	li $v0, 4		#print string
	la $a0, backwards
	syscall
	
Loop2:	addi $s0, $s0, -1	# i = i -1 points to last char
	add $t1,$s0,$t0		# address of inp_str[i] in $t1
	lbu $a0, 0($t1)		# $a0 = inp_str[i]
	sb $a0, 0($a1)		# store in rev_str[i]
	addi $a1,$a1,1

	li $v0, 11		#print char
	syscall

	beq $s0, $zero, exit	# if i = 0 then exit
	j Loop2			# go to Loop2

exit:	li $v0, 10              #terminating
    	syscall 