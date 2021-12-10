# Program File: simple grade calculator
# Program to caluculates the correct letter grade based on the users input of grade precentage
# Author: Felicia Acuna
# Date: 10/10/2020
.text
.globl main
main:
#prints the string prompt:
   li $v0,4      
   la $a0,prompt       
   syscall           
 #reads the number inputed by the user 
   li $v0,5       
   syscall
   #moves the value of the input from $v0 and stores it in $t0           
   move $t0,$v0       
  #the register $t0= the percent stored in $t0 and divides it by 10
   div $t0,$t0,10       

   seq $t2,$t0,10       			#sets $t2 to 1 or true if $t0=10
   bne $t2,1,grade_A            	#braches to grade_A if $t2 is 1
   b end_if							#braches to end_if
             
grade_A:   
   seq $t2,$t0,9      				#sets $t2 to 1 or true if $t0=9
   bne $t2,1,grade_B      			#braches to grade_B if $t2 is 1
   li $t1,65       					#sets $t1 to A using ascii
   b end_if							#braches to end_if
             
grade_B:   
   seq $t2,$t0,8       				#sets $t2 to 1 or true if $t0=8
   bne $t2,1,grade_C      			#braches to grade_C if $t2 is 1
   li $t1,66       					#sets $t1 to B using ascii
   b end_if							#braches to end_if
            
grade_C:   
   seq $t2,$t0,7       				#sets $t2 to 1 or true if $t0=7
   bne $t2,1,grade_D       			#braches to grade_D if $t2 is 1
   li $t1,67       					#sets $t1 to C using ascii
   b end_if 						#braches to end_if
           
grade_D:   
   seq $t2,$t0,6       				#sets $t2 to 1 or true if $t0=6
   bne $t2,1,else       			#braches to else if $t2 is 1
   li $t1,68       					#sets $t1 to D using ascii
   b end_if    						#braches to end_if
          
else:   
li $t1,70   						#sets $t1 to F using ascii
b end_if    						#braches to end_if

end_if:
#prints the string output:  
   li $v0,4       
   la $a0,output       
   syscall 
   
 #prints the char from ascii             
   li $v0,11       
   move $a0,$t1       
   syscall           
  
  #exits the program cleanly
   li $v0,10       
   syscall    
   
.data
   prompt: .asciiz "Enter your final percent>: "
   output: .asciiz "Your final grade is:"     