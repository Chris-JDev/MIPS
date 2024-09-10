.data
prompt: .asciiz "Enter an integer:"
even_msg: .asciiz "The number is even."
odd_msg: .asciiz "The number is odd."

.text
main:

    la $a0, prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0            # Store the input value in $t0 (n)

    # Check if the number is even or odd
    andi $t1, $t0, 1         # $t1 = $t0 & 1 (check if least significant bit is 1)
    beq $t1, $zero, even    # If $t1 == 0, number is even
    li $v0, 4              
    la $a0, odd_msg
    syscall
    j exit                 

even:
    li $v0, 4               
    la $a0, even_msg
    syscall

exit:
    # Exit program
    li $v0, 10
    syscall
