.data
inp_str: .asciiz "banab"
result:  .asciiz "The string is a palindrome.\n"
not_palindrome: .asciiz "The string is not a palindrome.\n"

.text
main:
    la $t0, inp_str       # Load base address of inp_str into $t0
    li $s0, 0             # Initialize i = 0

# Loop to find the length of the string
length_loop:
    lb $t1, 0($t0)        # Load byte at inp_str[i]
    beq $t1, $zero, check_palindrome  # If end of string, go to check
    addi $s0, $s0, 1      # Increment length
    addi $t0, $t0, 1      # Move to the next character
    j length_loop         # Repeat

check_palindrome:
    la $t0, inp_str       # Reset pointer to the beginning
    add $t1, $t0, $s0     # t1 points to the end of the string
    addi $t1, $t1, -1     # Point to the last character

palindrome_loop:
    lb $t2, 0($t0)        # Load character from the front
    lb $t3, 0($t1)        # Load character from the back
    beqz $t2, finish      # If we've reached the end, finish
    beq $t2, $t3, next_char # If chars match, check next
    j not_palindrome_msg   # If chars don't match, it's not a palindrome

next_char:
    addi $t0, $t0, 1      # Move front pointer forward
    addi $t1, $t1, -1     # Move back pointer backward
    j palindrome_loop      # Repeat

not_palindrome_msg:
    li $v0, 4
    la $a0, not_palindrome
    syscall
    j exit

finish:
    li $v0, 4
    la $a0, result
    syscall

exit:
    li $v0, 10            # Exit program
    syscall
