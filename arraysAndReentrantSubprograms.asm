############################# ranarray.asm ###############################

.data

              lpar: .asciiz " [ "
              rpar: .asciiz "]\n"
              space: .asciiz " "
              RandNums : .space 80                   # create space for 20 integers
              RandCount: .word 20

.text

main:
	la $a0,RandNums                                         # pass pointer to numArray
    lw $a1,RandCount                         # pass randCount
    jal genAndPrintRandNums          # call genAndPrintRandNums
    jal Exit

########################## genAndPrintRandNums ###########################

genAndPrintRandNums:
	addi $sp, $sp, -12

    sw $ra,0($sp)                  # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1

Loop0:         
	beqz $t1,endLoop0                               # if i=0, exit the loop

    li $a0,50                                                       # pseudo random number
    li $a1,99                                                       # maximum number
    li $v0,42
    syscall                                             # generate a random number in the range [0,98]

    sub $a0,$a0,49                              # adjust the number to the range -49 to 49
    sw $a0,0($t0)                                # save random number
    add $t0,$t0,4                                # numArray++
    sub $t1,$t1,1                                 # i--
    b Loop0

endLoop0:
	lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal printAll                                      # call printAll
    jal PrintNewLine

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal printReverseOddsIntArray # call printReverseOddsIntArray
    jal PrintNewLine

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal printPositiveIntArray # call printPositiveIntArray
    jal PrintNewLine

    lw $ra, 0($sp)                                # restore the return address
    addi $sp, $sp, 12
    jr $ra                                               # return to main function

############################# printAll #################################

printAll:
	addi $sp, $sp, -12

    sw $ra,0($sp)                  # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1

    la $a0,lpar                                      # print left paranthesis
    li $v0,4
    syscall                                                          

Loop1:         
	beqz $t1,endLoop1                                # if i=0, exit the loop

    la $a0,space                                   # print space
    li $v0,4
    syscall

    lw $a0,0($t0)                                 # $a0=numArray [i]                                                       
    li $v0,1                                           # print numArray [i]
    syscall  

    add $t0,$t0,4                                # numArray++  
    sub $t1,$t1,1                                 # i--
    b Loop1

endLoop1:
	la $a0,rpar                                     # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    lw $ra, 0($sp)                                # restore the return address

    addi $sp, $sp, 12
    jr $ra                                               # return to caller

######################### printReverseOddsIntArray #######################

printReverseOddsIntArray:
	addi $sp, $sp, -12

    sw $ra,0($sp)                  # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1                                                           

    sub $t1,$t1,1                                 # $t1=n-1
    
    la $a0,lpar                                      # print left paranthesis
    li $v0,4
    syscall

Loop2:         
	blt $t1,$zero,endLoop2                         # if i<0, exit the loop
    mul $t2,$t1,4
    add $t2,$t2,$t0

    la $a0,space                                   # print space
    li $v0,4
    syscall                                                                        

    lw $a0,0($t2)                                 # $a0=numArray [i]                                                                                   
    li $v0,1                                           # print numArray [i]
    syscall

    sub $t1,$t1,2                                 # i=i-2
    b Loop2

endLoop2:
	la $a0,rpar                                     # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    lw $ra, 0($sp)                                # restore the return address

    addi $sp, $sp, 12
    jr $ra                                               # return to caller

########################## printPositiveIntArray #########################

printPositiveIntArray:
	addi $sp, $sp, -12

    sw $ra,0($sp)                  # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1

    la $a0,lpar                                      # print left paranthesis
    li $v0,4
    syscall

Loop3:         
	beqz $t1,endLoop3                                # if i=0, exit the loop
    lw $a0,0($t0)
    blt $a0,$zero,increment                      # if numArray [i]>=0

    la $a0,space                                   # print space
    li $v0,4
    syscall  

    lw $a0,0($t0)                                 # print numArray [i]                                         
    li $v0,1
    syscall  

increment:
	add $t0,$t0,4                                # numArray++
    sub $t1,$t1,1                                 # i--
    b Loop3

endLoop3:
	la $a0,rpar                                     # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    lw $ra, 0($sp)                                # restore the return address

    addi $sp, $sp, 12
    jr $ra                                               # return to main function

             
.include "utils.asm"
##########################################################################
