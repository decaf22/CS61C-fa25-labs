.globl f # this allows other files to find the function f

# f takes in two arguments:
# a0 is the value we want to evaluate f at
# a1 is the address of the "output" array (read the lab spec for more information).
# The return value should be stored in a0
f:
    # Your code here
    addi t1,a0,3 #-3 to 3, change to 0 to 6
    slli t2,t1,2 #<<2, t2=t1*4
    add t2, t2, a1 # get the place
    lw a0, 0(t2)   # save the value into a0
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
