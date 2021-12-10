











.data
	prompt: .asciiz  "enter an integer"
	goodResult: .asciiz  "Good Rabbit"
	badResult:  .asciiz  "Bad Result"
	
	
	
	
	
	
.text
	.globl main
	
main:

#try
	la $a0, prompt
	li $v0,4
	syscall
	
	#read the integer
	li $v0, 5
	syscall
	#test that k1 register if it is 1 or not
	beqz $k0, goodResult
	#
	la $a0, badResult
	li $v0,4
	syscall
	b tryCatchExit
goodResult:
	
	
	
	
#catch block
.kdata
	sysCallException: .asciiz "Syscall Exception"
	msg: .asciiz "Generic Exception"
	
.ktext  0x80000180
  # we 
	#prolog
	move $t0, $a0
	move $t1, $v0   
	
	# Get value in cause register and copy it to $k0.
	
	mfc0 $k0, $13   	#$13 has the cause
	
# Mask all but the exception code (bits 2 - 6) to zero.
	
	andi $k1, $k0, 0x00007c  
	
# Shift two bits to the right to get the exception code in a comparable form
	
	srl  $k1, $k1, 2
	
# Now $k0 = value of cause register
#     $k1 = exception code
	li $t3,8
	seq $t4, $k1, $t3
	beqz $t4, genericException
	
	la $a0, syscallException
	li $v0, 4
	syscall
	
	b epilog
	
genericException:
	la $a0, msg
	li $v0, 4
	syscall
	
	
epilog:
	mfc0 $k0, $14 		# not needed for eret
	addi $k0, $k0, 4
	mtc0 $k0, $14
	li $k0, 1   #use it as a flag to test 
	#use the $k1
	move $a0, $t0
	move $v0, $t1
	eret
	
	
	