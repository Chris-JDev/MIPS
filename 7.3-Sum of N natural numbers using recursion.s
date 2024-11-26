.data
msg_sum: .asciiz "\nSum of Natural Numbers: "

.text
.globl main

main:
    li $a0, 5            # Load N (number of natural numbers)
    jal RSum             # Call RSum function

    # Print result
    la $a0, msg_sum      # Load address of the message
    li $v0, 4            # Print string syscall
    syscall

    move $a0, $v0        # Move result (sum) to $a0
    li $v0, 1            # Print integer syscall
    syscall

    li $v0, 10           # Exit syscall
    syscall

# Sum of N natural numbers (recursive)
RSum:
    # Function: int RSum(int n)
    # $a0 = n (natural number)
    beq $a0, 1, base_case  # If n == 1, return 1
    addi $a0, $a0, -1      # Decrement n by 1
    jal RSum               # Recursive call
    add $v0, $v0, $a0      # Add n to the result of RSum(n-1)
    jr $ra                 # Return from function

base_case:
    li $v0, 1              # Return 1 when n == 1
    jr $ra                 # Return from function
