.data
msg_bin_search: .asciiz "\nIndex of Element: "

.text
.globl main

main:
    # Example: Searching for element 4 in the array
    li $a1, 4              # Element to search for (data)
    li $a2, 0              # Lower bound (lo)
    li $a3, 9              # Upper bound (hi)
    la $a0, ArrayA         # Load address of the array
    jal bin_search         # Call binary search function

    # Print result
    la $a0, msg_bin_search # Load address of the message
    li $v0, 4              # Print string syscall
    syscall

    move $a0, $v0          # Move index result to $a0
    li $v0, 1              # Print integer syscall
    syscall

    li $v0, 10             # Exit syscall
    syscall

# Binary Search function (recursive)
bin_search:
    # Function: int bin_search(int A[], int data, int lo, int hi)
    # $a0 = A (array address), $a1 = data (value to search), $a2 = lo (lower bound), $a3 = hi (upper bound)

    bgt $a2, $a3, not_found    # If lo > hi, return -1 (not found)

    # mid = (lo + hi) / 2
    add $t0, $a2, $a3          # lo + hi
    sra $t0, $t0, 1             # mid = (lo + hi) / 2

    sll $t1, $t0, 2            # index = mid * 4 (element size = 4 bytes)
    add $t1, $t1, $a0          # Address of A[mid]
    lw $t2, 0($t1)             # Load A[mid] into $t2

    beq $t2, $a1, found        # If A[mid] == data, return mid

    blt $a1, $t2, search_left  # If data < A[mid], search left half
    j search_right             # Otherwise, search right half

search_left:
    move $a3, $t0              # hi = mid - 1
    sub $a3, $a3, 1
    jal bin_search             # Recursive call for left half
    jr $ra                     # Return from function

search_right:
    move $a2, $t0              # lo = mid + 1
    add $a2, $a2, 1
    jal bin_search             # Recursive call for right half
    jr $ra                     # Return from function

not_found:
    li $v0, -1                 # Return -1 (not found)
    jr $ra                     # Return from function

found:
    move $v0, $t0              # Return index of found element
    jr $ra                     # Return from function

.data
ArrayA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10   # Sample sorted array
