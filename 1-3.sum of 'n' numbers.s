.data
mgs:    .asciiz "Enter value for 'n':"
sumr:   .asciiz "Result:"
sum:    .word 0               # Reserve space for the result

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
    li $t2, 0                # Sum (initially 0)

next:
    bgt $t1, $t0, over       # If counter > n, exit the loop
    add $t2, $t2, $t1        
    addi $t1, $t1, 1         # Increment counter
    j next               # Repeat the loop

over:
    # Store result in memory
    sw $t2, sum             

    # Print the result message
    la $a0, sumr
    li $v0, 4
    syscall

    # Print the result value
    lw $a0, sum
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall
