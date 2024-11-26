.data
msg_temp: .asciiz "\nEnter temperature in Fahrenheit: "
msg_result: .asciiz "\nTemperature in Celsius: "

.text
.globl main

main:
    # Prompt user to enter temperature in Fahrenheit
    li $v0, 4                   # Print string syscall
    la $a0, msg_temp            # Load address of the prompt
    syscall

    # Read Fahrenheit value (float)
    li $v0, 6                   # Read float syscall
    syscall
    mov.s $f0, $f12             # Store Fahrenheit in $f0

    # Convert Fahrenheit to Celsius: (5.0 / 9.0)
    li.s $f2, 5.0               # Load 5.0 into $f2
    li.s $f3, 9.0               # Load 9.0 into $f3
    div.s $f4, $f2, $f3         # $f4 = 5.0 / 9.0

    # Subtract 32 from Fahrenheit: (fahr - 32.0)
    li.s $f6, 32.0              # Load 32.0 into $f6
    sub.s $f0, $f0, $f6         # $f0 = fahr - 32.0

    # Multiply the result by (5.0 / 9.0)
    mul.s $f0, $f0, $f4         # $f0 = (fahr - 32) * (5 / 9)

    # Print the result (Celsius)
    la $a0, msg_result          # Load address of the message
    li $v0, 4                   # Print string syscall
    syscall

    move.s $f12, $f0            # Move result to $f12 for printing
    li $v0, 2                   # Print float syscall
    syscall

    li $v0, 10                  # Exit syscall
    syscall
