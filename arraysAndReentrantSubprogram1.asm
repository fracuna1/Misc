#Felicia Acuna
#arrays and reentrant subprograms
#11/03/2020





.data
	randNums: .space 80
	randCount: .word 20
    space: .asciiz " "
    leftPar: .asciiz "("
    rightPar: .asciiz ")"
   
    
.text 
	.globl main
main:
	la $a0, randNums
	lw $a1, randCount
	jal genAndPrintRandNums
	jal Exit
# End Of Main--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Start of genAndPrintRandNums----------------------------------------------------------------------------------------------------------------------------------------------------------------

#subprogram: genAndPrintRandNums
# author: Felicia Acuna
# purpose: prints random number from array
# input:$a0=RandNums,$a1=RendCount 
# output: $t0,$t1
# side effects: an array of random numbers will be printed to user's console  

.text
genAndPrintRandNums:
	 addi $sp, $sp, -12

     sw $ra,0($sp)                                # save $ra on stack
     sw $a0,4($sp)                                # save $a0 on stack
     sw $a1,8($sp)                                # save $a1 on stack

     move $t0,$a0
     move $t1,$a1

Loop0:         
	beqz $t1,endLoop0                             # if i=0, exit the loop

    li $a0,50                                     # pseudo random number
    li $a1,99                                     # maximum number
    li $v0,42
    syscall                                       # generate a random number in the range [0,98]

    sub $a0,$a0,49                                # adjust the number to the range -49 to 49
    sw $a0,0($t0)                                 # save random number
    add $t0,$t0,4                                 # numArray++
    sub $t1,$t1,1                                 # i--
    b Loop0

endLoop0:
	lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal printAll                                      # call printAll
    jal PrintNewLine

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal PrintReverseOddsIntArray                  # call printReverseOddsIntArray
    jal PrintNewLine

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    jal printPositiveIntArray 					  # call printPositiveIntArray
    jal PrintNewLine

    lw $ra, 0($sp)                                # restore the return address
    addi $sp, $sp, 12
    jr $ra                                        # return to main function
#end of genAndPrintRandNums------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Star of PrintAll----------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

#subprogram: printAll
# author: Felicia Acuna
# purpose: prints all of the elements of the array
# input: a0=RandNums,$a1=RendCount
# output: $t0,$t1
# side effects: prints all of the numbers to the users console
.text
printAll:
	  addi $sp, $sp, -12

      sw $ra,0($sp)                                # save $ra on stack
      sw $a0,4($sp)                                # save $a0 on stack
      sw $a1,8($sp)                                # save $a1 on stack

      move $t0,$a0
      move $t1,$a1

      la $a0,leftPar                              # print left paranthesis
      li $v0,4
      syscall                                                          

Loop1:         
	beqz $t1,endLoop1                            # if i=0, exit the loop

    la $a0,space                                 # print space
    li $v0,4
    syscall

    lw $a0,0($t0)                                # $a0=numArray [i]                                                       
    li $v0,1                                     # print numArray [i]
    syscall  

    add $t0,$t0,4                                # numArray++  
    sub $t1,$t1,1                                # i--
    b Loop1

endLoop1:
	la $a0,rightPar                              # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                                 # pass the address of the numArray
    lw $a1,8($sp)                                 # pass size of the numArray
    lw $ra, 0($sp)                                # restore the return address

    addi $sp, $sp, 12
    jr $ra                                        # return to caller                                                   
#End of PrintAll---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#start of PrintReverseOddsIntArray---------------------------------------------------------------------------------------------------------------------------------------------------------

#subprogram: PrintReverseOddsIntArray
# author: Felicia Acuna
# purpose: outputs the numbers of the array in reverse order
# input: a0=RandNums,$a1=RendCount
# output: $t0,$t1
# side effects: A new line character is printed to the# user's console  	           
.text
PrintReverseOddsIntArray:
	addi $sp, $sp, -12

    sw $ra,0($sp)                  			     # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1                                                           

    sub $t1,$t1,1  
                                                 # $t1=n-1
    la $a0,leftPar                               # print left paranthesis
    li $v0,4
    syscall

Loop2:         
	blt $t1,$zero,endLoop2                       # if i<0, exit the loop

    mul $t2,$t1,4
    add $t2,$t2,$t0

    la $a0,space                                # print space
    li $v0,4
    syscall                                                                        

    lw $a0,0($t2)                               # $a0=numArray [i]                                                                                   
    li $v0,1                                    # print numArray [i]
    syscall

    sub $t1,$t1,2                               # i=i-2
    b Loop2

endLoop2:
	la $a0,rightPar                             # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                              # pass the address of the numArray
    lw $a1,8($sp)                              # pass size of the numArray
    lw $ra, 0($sp)                             # restore the return address

     addi $sp, $sp, 12
     jr $ra                                    # return to caller
#End of PrintReverseOddsIntArray----------------------------------------------------------------------------------------------------------------------------------------------------------


#Start of PrintPositiveIntArray-----------------------------------------------------------------------------------------------------------------------------------------------------------

#subprogram: PrintPositiveIntArray
# author: Felicia Acuna
# purpose: prints all positive numbers
# input: a0=RandNums,$a1=RendCount
# output: $t0,$t1
# side effects: all positive numbers are printed to the# user's console  
.text	
printPositiveIntArray:
	addi $sp, $sp, -12

    sw $ra,0($sp)                                # save $ra on stack
    sw $a0,4($sp)                                # save $a0 on stack
    sw $a1,8($sp)                                # save $a1 on stack

    move $t0,$a0
    move $t1,$a1

    la $a0,leftPar                              # print left paranthesis
    li $v0,4
    syscall

Loop3:         
	beqz $t1,endLoop3                          # if i=0, exit the loop

    lw $a0,0($t0)
    blt $a0,$zero,incre                        # if numArray [i]>=0
              
    la $a0,space                               # print space
    li $v0,4
    syscall  

    lw $a0,0($t0)                              # print numArray [i]                                         
    li $v0,1
    syscall  

incre:
	add $t0,$t0,4                             # numArray++
    sub $t1,$t1,1                             # i--
    b Loop3

endLoop3:
	la $a0,rightPar                          # print right paranthesis
    li $v0,4
    syscall

    lw $a0,4($sp)                            # pass the address of the numArray
    lw $a1,8($sp)                            # pass size of the numArray
    lw $ra, 0($sp)                           # restore the return address

    addi $sp, $sp, 12
     jr $ra                                  # return to main function

             
	
#End of PrintPositiveIntArray-------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	
	
	
	
	
	
.include "utils.asm"
