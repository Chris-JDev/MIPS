    .data
ARRAY:      .word 30, 20, 30, 40, 50     # Define the array of integers
SEARCH:     .word 30                     # Define the search element (30)
N:          .word 5                      # Total number of elements in the array (N = 5)
not_found_msg: .asciiz "Element not found\n"  # Message when element is not found

    .text
    .globl main

main:
    # Load input arguments to registers
    # $a0 = Base address of the array (ARRAY)
    # $a1 = Search element (30)
    # $a2 = Total number of elements (N)
    
    la $a0, ARRAY           # Load address of ARRAY into $a0 (base address)
    lw $a1, SEARCH          # Load the search element (30) into $a1
    lw $a2, N               # Load the total number of elements (5) into $a2
    li $t0, 0               # Initialize the loop counter (index) to 0, store in $t0
    li $v0, 0               # Set $v0 to 0 (default value - element not found)

LINEAR_SEARCH_LOOP:
    bge $t0, $a2, NOT_FOUND  # If index ($t0) >= N ($a2), jump to NOT_FOUND (element not found)

    # Load the element at index $t0 from the array into $t1
    sll $t2, $t0, 2         # Multiply index $t0 by 4 to get the byte offset (word size = 4 bytes)
    add $t3, $a0, $t2       # Add the base address of ARRAY to the byte offset
    lw $t1, 0($t3)          # Load the element at ARRAY[$t0] into $t1

    # Compare the element with the search value
    beq $t1, $a1, FOUND     # If the element matches the search value, jump to FOUND

    # Increment the index ($t0)
    addi $t0, $t0, 1        # Increment the index
    j LINEAR_SEARCH_LOOP    # Repeat the loop

NOT_FOUND:
    # Element was not found, print "Element not found"
    li $v0, 4               # Print string syscall
    la $a0, not_found_msg   # Load address of "Not Found" message
    syscall                 # Make the syscall to print the message

    # Exit program
    li $v0, 10              # Exit syscall
    syscall

FOUND:
    # Element was found, print the index of the found element
    li $v0, 1               # Print integer syscall
    move $a0, $t0           # Move the index of the found element to $a0 for printing
    syscall                 # Make the syscall to print the index

    # Exit program
    li $v0, 10              # Exit syscall
    syscall
