.import utils.s

.text
main:
    # This program will fill an array of size 10 with 0's

    # Allocate an array of size 10
    li a0 40   # 10 ints, 4 bytes each
    jal malloc # malloc is defined in utils.s
    # 为什么被翻译成jal x1 52? x1是默认函数结束后返回的地方，这句的意思是把下一条指令的地址存在x1, 然后pc去pc+52的地方把malloc的代码运行完，然后去x1的位置看pc+4是什么，去那里执行原来在malloc后面的那条指令
    # x1默认是ra return address
    # ra=return address, by default x1; jal=jump and link
    mv t0 a0   # the pointer is returned in a0 是默认的
    mv s0 a0

    # Fill the array with 0's
    li t1 0  # t1 is the index
    li t2 9 # t2 is the size of the array

loop:
    # Store 0 at the current index
    sw x0 0(t0)
    # Increment the index
    addi t1 t1 1
    # Increment the pointer
    addi t0 t0 4
    # Check if we are done
    # If not, loop
    bge t2 t1 loop

    # Exit the program
    mv a0 s0
    jal free
    li a0 0
    jal exit
    
    # 开不开memcheck给我malloc的ptr的位置是不一样的，不开的话给我的是0x10008030，开的话给我0x10008058，此时0x10008030(rawptr)-8058(ptr)之间的地方存放一些metadata，要free的话free ptr but not rawptr
    # if Chinese cannot be display, check in your vscode
