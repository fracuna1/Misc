#Program File:in class demo
#Notes:Takes the numbers 12,13,14 adds them together and puts them in the same register, then prints out the result to the user.
#Author: Felicia Acuna
#Date: 9/2/2020



.text

	.globl main
	
main:
	ori $t0, $zero, 0xc  # load 12 in $t0
	ori $t1, $zero, 0xd  #load 13 in $t1
	ori $t2, $zero, 0xe  #load 14 in $t2
	
	
	# do the math	
	add $t3, $t0, $t1  # $t3= $t0+$t1
	add $t3, $t2, $t3  # $t3= $t2+$t3
	
	#display the result
	la $a0, result
	ori $v0, $zero, 4
	syscall
	
	#print the sum on the screen
	or $a0, $zero, $t3   #R format
	ori $v0, $zero, 1
	syscall
	
	#exit cleanly
	ori $v0, $zero, 10
	syscall
	
	
	.data
		result: .asciiz "The sum is " 
		
		
		
		
