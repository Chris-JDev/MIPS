.data
data1: .word 10
data2: .word 2
msg1: .asciiz "The sum is:"
msg2: .asciiz "The difference is:"
msg3: .asciiz "The product is:"
msg4: .asciiz "The quotient is:"
msg5: .asciiz "\n"

.text
main:
############ sum ##########
lw $a0, data1
lw $a1, data2

jal sum

move $t0, $v0
li $v0, 4
la $a0, msg1
syscall

li $v0, 1
move $a0, $t0
syscall

move $t0, $v0
li $v0, 4
la $a0, msg5
syscall

############ difference ##########
lw $a0, data1
lw $a1, data2

jal difference

move $t0, $v0
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t0
syscall


move $t0, $v0
li $v0, 4
la $a0, msg5
syscall

####### product ########
lw $a0, data1
lw $a1, data2

jal product

move $t0, $v0
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t0
syscall

move $t0, $v0
li $v0, 4
la $a0, msg5
syscall

########## quotient #######
lw $a0, data1
lw $a1, data2

jal quotient

move $t0, $v0
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t0
syscall


move $t0, $v0
li $v0, 4
la $a0, msg5
syscall

################
li $v0, 10
syscall

sum:
add $v0, $a0, $a1
jr $ra

difference:
sub $v0, $a0, $a1
jr $ra

product:
mul $v0, $a0, $a1
jr $ra

quotient:
div $v0, $a0, $a1
jr $ra