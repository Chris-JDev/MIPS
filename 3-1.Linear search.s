.data
array: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length: .word 10
msgNotFound: .asciiz "Item is not in the array\n"
msgFound: .asciiz "Index at which item is found in the array: "
prompt: .asciiz "Enter an integer:"

.text
main:
    la $a0, prompt
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    la $a0, array
    lw $a2, length
    li $t0, 0

loop:
    bge $t0, $a2, NotFound
    lw $t3, 0($a0)
    beq $t3, $t1, Found
    addi $a0, $a0, 4
    addi $t0, $t0, 1
    j loop

Found:
    la $a0, msgFound
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    j exit

NotFound:
    la $a0, msgNotFound
    li $v0, 4
    syscall

exit:
    li $v0, 10
    syscall
