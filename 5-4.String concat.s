.data
str1: .asciiz "Hello, "
str2: .asciiz "World!"
result: .space 100      # Space to store the concatenated result

.text
main:
    # Load first string
    la $t0, str1         # Load address of str1
    la $t1, result       # Load address of result

copy_str1:
    lb $t2, 0($t0)       # Load byte from str1
    beqz $t2, copy_str2  # If null byte, jump to copy_str2
    sb $t2, 0($t1)       # Store byte in result
    addi $t0, $t0, 1     # Move to next char in str1
    addi $t1, $t1, 1     # Move to next char in result
    j copy_str1          # Repeat

copy_str2:
    la $t0, str2         # Load address of str2

copy_str2_loop:
    lb $t2, 0($t0)       # Load byte from str2
    beqz $t2, print_result # If null byte, jump to print
    sb $t2, 0($t1)       # Store byte in result
    addi $t0, $t0, 1     # Move to next char in str2
    addi $t1, $t1, 1     # Move to next char in result
    j copy_str2_loop     # Repeat

print_result:
    li $v0, 4            # Print string syscall
    la $a0, result       # Load address of result
    syscall

exit:
    li $v0, 10           # Exit program
    syscall
