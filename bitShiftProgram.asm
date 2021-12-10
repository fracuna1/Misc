#Felicia Acuna
#Felicia Acuna
#bitshift program
#09/20/2020


.text
		.globl main
main:
   # prompt to the user
   li $v0,4
   la $a0,prompt
   syscall
   
   # Read an integer from the user
   li $v0,5
   syscall
   move $t1,$v0           # store the number into $t1
   li $t0,0           		# Accumulator initialized to zero
   
   srl  $t1,$t1,1
   andi $t2,$t1,1           # Mask the bit zero of the number
   addi $t0,$t0,1           # If equal to 1, inecrement by 1
   
   li $v0,4           # Displays the prompt
   la $a0,output1
   syscall
   
    li $v0,1           # Displays the result stored
   move $a0,$t0
   syscall
   
  #exits cleanly
	ori $v0, $zero, 10
	syscall
   
 .data
   prompt: .asciiz "Enter a number between 50 and 100: "
   output1: .asciiz "Number of 1's = "
   output2: .asciiz "Number of 1's = "
   output3: .asciiz "Number of 1's = "
   output4: .asciiz "Number of 1's = "
   output5: .asciiz "Number of 1's = "
   output6: .asciiz "Number of 1's = "
   output7: .asciiz "Number of 1's = "
   output8: .asciiz "Number of 1's = "
