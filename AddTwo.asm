# Program File: AddTwo
# Program to read multiple integer numbers from a user, and
# print that number back to the console.
# Author: Felicia Acuna
# Date: 9/5/2020
.text
main:
    	      	 
    	# Prompting for the first integer to enter
    	li $v0, 4
    	la $a0, prompt1
    	syscall
    	
    	# Read the first integer and save it in $s0
    	li $v0, 5
    	syscall
    	move $s0, $v0
    	
    	# Promting for the second integer to enter 	
        li $v0, 4
    	la $a0, prompt2
    	syscall
        
    	# Read the second integer and save it  in $s1
    	li $v0, 5
    	syscall
    	move  $s1,$v0
    	
    	add $s2 , $s0, $s1  #$s2= $s0+$s1
    	      	 
    	# Prints the output1 text
        li $v0, 4
        la $a0, output1
        syscall 
    
    	# Output the number
    	li $v0, 1
    	move $a0, $s2
    	syscall
    
      
    	# Exit the program
	    li $v0, 10
        syscall
    
.data
	prompt1: .asciiz "Please enter the first number:"
	prompt2: .asciiz "Please enter the second number:"
	output1: .asciiz "The sum of your numbers is:"
