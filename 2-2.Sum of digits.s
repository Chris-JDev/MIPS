.data
prompt: .asciiz "Enter a integer: "

.text
main:
    # Print prompt
    la $a0, prompt       
    li $v0, 4            
    syscall              

    # Read integer
    li $v0, 5             
    syscall               
    move $t0, $v0         


    li $t1, 0            

calculate_sum:
    beq $t0, $zero, print_sum
    li $t2, 10            
    divu $t3, $t0, $t2   
    mfhi $t4           
    mflo $t0             

    # Add last digit to sum
    add $t1, $t1, $t4    

    # Repeat loop
    j calculate_sum       

print_sum:
    # Print sum
    move $a0, $t1         
    li $v0, 1             
    syscall             

    # Exit program
    li $v0, 10            
    syscall               
