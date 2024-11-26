.data
msg_coefficients: .asciiz "\nEnter coefficients a, b, and c (for ax^2 + bx + c): "
msg_x: .asciiz "\nEnter the value of x: "
msg_result: .asciiz "\nResult of Polynomial: "

.text
.globl main

main:
    # Prompt user to enter coefficients a, b, and c
    li $v0, 4                   # Print string syscall
    la $a0, msg_coefficients    # Load address of the prompt
    syscall

    # Read a, b, and c (floats)
    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f0, $f12             # Store coefficient a in $f0

    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f2, $f12             # Store coefficient b in $f2

    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f4, $f12             # Store coefficient c in $f4

    # Prompt user to enter the value of x
    li $v0, 4                   # Print string syscall
    la $a0, msg_x               # Load address of the prompt
    syscall

    # Read x (float)
    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f6, $f12             # Store x value in $f6

    # Calculate ax^2
    mul.s $f8, $f0, $f6         # $f8 = a * x
    mul.s $f8, $f8, $f6         # $f8 = a * x^2

    # Calculate bx
    mul.s $f10, $f2, $f6        # $f10 = b * x

    # Calculate the polynomial ax^2 + bx + c
    add.s $f12, $f8, $f10       # $f12 = ax^2 + bx
    add.s $f12, $f12, $f4       # $f12 = ax^2 + bx + c

    # Print the result of the polynomial
    la $a0, msg_result          # Load address of the message
    li $v0, 4                   # Print string syscall
    syscall

    move.s $f12, $f12           # Move result to $f12 for printing
    li $v0, 2                   # Print float syscall
    syscall

    li $v0, 10                  # Exit syscall
    syscall
