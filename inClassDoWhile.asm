# File: doWhile Loop
# Purpose: Implementing a Do While Loop
# Author: Felicia Acuna
# Date: 10/12/2020




.text

	    li $t0, 0 
								#int sum = 0, 
	START_LOOP:
		la $a0, prompt
		jal PromptInt
		add $t0, $t0, $v0
	
		sne $t1, $v0, 0
		beqz $t1, End
		b START_LOOP
	
	END_LOOP:
		la $a0, sum
		li $v0, 4
		syscall
	
		move $a0, $t0
		li $v0, 1
		syscall
	
		jal Exit
	End:
	jal Exit
	
.text 
PromptInt:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall

Exit:
li $v0,10
syscall

.data
	sum: .asciiz "The sum of the numbers is: "
	prompt: .asciiz "Enter an number, or 0 to exit: "
