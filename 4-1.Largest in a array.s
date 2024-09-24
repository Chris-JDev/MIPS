.data
ArrayA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length:  .word 10  # Number of elements
msg:     .asciiz "\nLargest Element: "

.text
.globl main

main:
    li $t0, 0                # i = 0
    lw $t1, length           # $t1 = n (length of the array)
    lw $t2, ArrayA(0)       # $t2 = max = A[0]

next_i:
    bge $t0, $t1, print      # if i >= n then print the result
    sll $t3, $t0, 2          # each element is 4 bytes (i * 4)
    lw  $t4, ArrayA($t3)     # $t4 = A[i]

    # Compare A[i] with max
    bgt $t4, $t2, update_max # if A[i] > max then update max
    j increment_i             # Otherwise, just increment i

update_max:
    move $t2, $t4            # max = A[i]

increment_i:
    addi $t0, $t0, 1          # i++
    j next_i

print:
    # Print the largest element
    la $a0, msg               # Load address of message
    li $v0, 4                 # Print string syscall
    syscall

    move $a0, $t2             # Move the largest value to $a0
    li $v0, 1                 # Print integer syscall
    syscall

    li $v0, 10                # Exit
    syscall
