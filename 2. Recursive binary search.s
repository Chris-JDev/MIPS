.data

space: .asciiz " "
nums: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
input1: .asciiz "Enter size : "
input2: .asciiz "Enter element : "
input3: .asciiz "Enter element to be searched : "
nextLine: .asciiz "\n"

.text
binarySearch:

    ifB: #base cases 
    ble $a2, $a3, elseB
    li $v0, 0
    jr $ra

    elseB:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    add $t0, $a2, $a3  
    srl $t0, $t0, 1 # mid = (start+end)/2

    sll $t2, $t0, 2
    add $t2, $a0, $t2
    lw $t2, 0($t2) # element = array[mid]

    if1:
    bne $t2, $a1, else1 #if array[mid] == $a1
    li $v0, 1
    addi $v1, $t0, 0  #return [found, index]
    jr $ra

    else1:
    bgt $t2, $a1, else2 #if array[mid] < $a1
    addi $a2, $t0, 1
    j functionCall

    else2:
    addi $a3, $t0, -1
    j functionCall

    functionCall:

    jal binarySearch
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra


main:

    #Taking size from user
    la $a0, input1
    li $v0, 4
    syscall
    li $v0, 5
    syscall

    addi $s0, $v0, 0
    li $t0, 0
    
    #Take input from user
    loop1:
        beq $t0, $s0, exit1
        sll $t1, $t0, 2
        la $t2, nums
        add $t2, $t2, $t1
        
        la $a0, input2
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        
        sw $v0, 0($t2)
        addi $t0, $t0, 1
        j loop1
        
    
    exit1:

    #Take which element to be searched from user
    la $a0, input3
    li $v0, 4
    syscall
    li $v0, 5
    syscall

    la $a0, nums # array 
    addi $a1, $v0, 0 # element to find
    li $a2, 0 # start
    addi $a3, $s0, -1 # end    

    jal binarySearch

    if:
    bne $v0 , $zero, else #if answer == 0
    addi $a0, $v0, 0
    li $v0, 1
    syscall
    j exit


    else: #if answer == [1, index]
    addi $a0,  $v0, 0     
    li $v0, 1
    syscall
    la $a0, space
    li $v0, 4
    syscall
    addi $a0, $v1, 0
    li $v0, 1
    syscall

    j exit

    exit:

    li $v0, 10
    syscall
