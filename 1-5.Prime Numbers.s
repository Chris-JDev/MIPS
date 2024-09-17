.data
mgs:        .asciiz "Enter value for 'n':"
primemsg:   .asciiz "The number is prime.\n"
notprimemsg: .asciiz "The number is not prime.\n"

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

    # Check if the number is less than 2
    li $t1, 2
    blt $t0, $t1, not_prime

    # Initialize divisor to 2
    li $t2, 2

    # Check divisibility from 2 to n-1
    li $t3, 1                # Flag to determine if prime (1 = prime, 0 = not prime)
    div_loop:
        bge $t2, $t0, prime  # If divisor >= n, number is prime
        divu $t4, $t0, $t2   # $t4 = n / divisor
        mfhi $t5             # $t5 = remainder
        beq $t5, $zero, not_prime  # If remainder is 0, number is not prime
        addi $t2, $t2, 1     # Increment divisor
        j div_loop

    # Print the result if prime
    prime:
        la $a0, primemsg
        li $v0, 4
        syscall
        j exit

    # Print the result if not prime
    not_prime:
        la $a0, notprimemsg
        li $v0, 4
        syscall

    # Exit program
    exit:
        li $v0, 10
        syscall
