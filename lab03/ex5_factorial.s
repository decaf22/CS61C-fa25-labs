.globl factorial

.data
n: .word 8

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE
    mv t0 a0 # t0=a0
    addi a0,x0,1 # a0=1, and 0!=1
    addi t1,x0,1 # t1=1
    beq t0, x0, a0_is_zero # how amazing, you can also define things like loop and a0_is_zero here
    # if t0/a0==0 then run a0_is_zero, after that you meet jr ra and code stops
    # if t0/a0!=0 then goto loop
  
    loop:
    mul a0,a0,t0 # a0*=t0
    addi t0,t0,-1 #t0--
    bgt t0,t1,loop # if t0>1 loop (that means goto line 37); if t0<=1 end
    jr ra
    a0_is_zero:
    li a0,1
    
    
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
