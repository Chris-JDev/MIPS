        .data
prompt: .asciiz "Enter the number of Fibonacci terms: "
newline: .asciiz "\n"

        .text
        .globl main

main:
        # Prompt user for input
        li      $v0, 4                # syscall for printing string
        la      $a0, prompt           # address of prompt message
        syscall

        # Read integer input (n)
        li      $v0, 5                # syscall for reading an integer
        syscall
        move    $t0, $v0              # store n in $t0

        # Initial values for Fibonacci sequence
        li      $t1, 0                # $t1 = a = 0 (first Fibonacci number)
        li      $t2, 1                # $t2 = b = 1 (second Fibonacci number)
        li      $t3, 1                # $t3 = counter i = 1

        # Print the first Fibonacci number (0)
        li      $v0, 1                # syscall for printing integer
        move    $a0, $t1              # load 0 into $a0 for printing
        syscall

        # Print newline
        li      $v0, 4                # syscall for printing string
        la      $a0, newline          # load address of newline string
        syscall

        # Print the second Fibonacci number (1)
        li      $v0, 1                # syscall for printing integer
        move    $a0, $t2              # load 1 into $a0 for printing
        syscall

        # Print newline
        li      $v0, 4                # syscall for printing string
        la      $a0, newline          # load address of newline string
        syscall

fibonacci_loop:
        # Check if we have printed enough Fibonacci numbers
        bge     $t3, $t0, done       # if i >= n, exit the loop

        # Calculate next Fibonacci number (c = a + b)
        add     $t4, $t1, $t2         # $t4 = $t1 + $t2 (next Fibonacci number)

        # Print the Fibonacci number
        li      $v0, 1                # syscall for printing integer
        move    $a0, $t4              # move result to $a0 for printing
        syscall

        # Print newline
        li      $v0, 4                # syscall for printing string
        la      $a0, newline          # load address of newline string
        syscall

        # Update variables for next iteration
        move    $t1, $t2              # a = b
        move    $t2, $t4              # b = c (new Fibonacci number)
        addi    $t3, $t3, 1           # increment counter i

        j       fibonacci_loop        # repeat the loop

done:
        # Exit program
        li      $v0, 10               # syscall for program exit
        syscall
