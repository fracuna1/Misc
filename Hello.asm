# Author:Felicia Acuna
#Date:08/31/2020
#Purpose: This program displays the string "Hello World"

.text
  li $v0, 0x04
  la $a0, greetings 
  syscall
  
  li $v0, 0x04
  la $a0, test
  syscall
  
  li $v0, 10  # Clean way to exit the program
  syscall
  
 .data
	greetings: .asciiz "Hello World\n"  # This is the string to print
	test: .asciiz "this is a test"
	aWord: .word 0x22
	theWord: .word 
	
	