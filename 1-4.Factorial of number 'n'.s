.data
mgs:    .asciiz "Enter value for 'n':"
factr:   .asciiz "Result:"
fact:    .word 0       

.text
main:
    # Print the prompt message
    la $a0, mgs
    li $v0, 4
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0            # Store the input value in $t0 (n)

    # Initialize sum and counter
    li $t1, 1                # Counter (starting from 1)
    li $t2, 1                # fact(initially 1)

next:
    bgt $t1, $t0, over       # If counter > n, exit the loop
    mul $t2, $t2, $t1        # Multiply result by counter
    addi $t1, $t1, 1         
    j next        

over:
    # Store result in memory
    sw $t2, fact

    # Print the result message
    la $a0, factr
    li $v0, 4
    syscall

    # Print the result value
    lw $a0, fact
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall
