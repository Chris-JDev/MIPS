.data
pi: .float 3.1415926535897924    # Pi value
msg_area: .asciiz "\nArea of Circle: "
radius_prompt: .asciiz "\nEnter radius: "

.text
.globl main

main:
    # Prompt user to enter radius
    li $v0, 4                   # Print string syscall
    la $a0, radius_prompt       # Load address of the prompt
    syscall

    # Read radius (float)
    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f0, $f12             # Store radius in $f0

    # Load Pi value into $f2
    l.s $f2, pi

    # Square the radius (r^2)
    mul.s $f4, $f0, $f0         # $f4 = r * r

    # Multiply Pi with radius^2
    mul.s $f6, $f2, $f4         # $f6 = pi * r^2

    # Print the result (Area)
    la $a0, msg_area            # Load address of the message
    li $v0, 4                   # Print string syscall
    syscall

    move.s $f12, $f6            # Move area result to $f12 for printing
    li $v0, 2                   # Print float syscall
    syscall

    li $v0, 10                  # Exit syscall
    syscall
