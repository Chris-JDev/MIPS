.data 
msg1: .asciiz "number 1:"
msg2: .asciiz "number 2:"
msg3: .asciiz "result:"

.text

main:

la $a0,msg1
li $v0,4
syscall

li $v0,5
syscall
move $t0,$v0


 li $v0, 11       # Print character syscall
    li $a0, 10       # ASCII code for newline
    syscall

la $a0,msg2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0


 li $v0, 11       # Print character syscall
    li $a0, 10       # ASCII code for newline
    syscall

add $t2,$t0,$t1

la $a0,msg3
li $v0,4
syscall


li $v0,1
move $a0,$t2
syscall
li $v0, 10      
    syscall        