.data
ArrayA: .word 1, 2, 3, 4, 5  # Array with 5 elements
length:  .word 5              # Number of elements
msg:     .asciiz "\nSum of elements: "

.text
.globl main

main:
    li $t0, 0                # i = 0
    lw $t1, length           # $t1 = n (length of the array)
    li $t2, 0                # $t2 = sum = 0

next_i:
    bge $t0, $t1, print      # if i >= n then print the result
    sll $t3, $t0, 2          # each element is 4 bytes (i * 4)
    lw  $t4, ArrayA($t3)     # $t4 = A[i]

    add $t2, $t2, $t4        # sum += A[i]

    addi $t0, $t0, 1          # i++
    j next_i

print:
    # Print the message
    la $a0, msg               # Load address of message
    li $v0, 4                 # Print string syscall
    syscall

    # Print the sum
    move $a0, $t2             # Move the sum to $a0
    li $v0, 1                 # Print integer syscall
    syscall

    li $v0, 10                # Exit
    syscall
