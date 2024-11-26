.data
msg_power: .asciiz "\nResult of Power: "

.text
.globl main

main:
    # a = 2, n = 5
    li $a0, 2            # Load base value (a)
    li $a1, 5            # Load exponent value (n)
    jal power            # Call power function

    # Print result
    la $a0, msg_power    # Load address of the message
    li $v0, 4            # Print string syscall
    syscall

    move $a0, $v0        # Move result (return value of power) to $a0
    li $v0, 1            # Print integer syscall
    syscall

    li $v0, 10           # Exit syscall
    syscall

# Power function (recursive)
power:
    # Function: int power(int a, int n)
    # $a0 = a (base), $a1 = n (exponent)
    beq $a1, 1, base_case    # If n == 1, return a
    addi $a1, $a1, -1        # Decrement n by 1
    jal power                # Recursive call
    mul $v0, $a0, $v0        # Multiply a * result of power(a, n-1)
    jr $ra                   # Return from function

base_case:
    move $v0, $a0            # Return a when n == 1
    jr $ra                   # Return from function
