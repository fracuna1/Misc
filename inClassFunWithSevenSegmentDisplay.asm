





.eqv  RIGHTDISPLAY  0xFFFF0010
.eqv  LEFTdISPLAY   0xFFFF0011

.text 
	.globl main
	
main:

	li $t0, RIGHTDISPLAY
	li $t1, 0x01   #$b 0000 0001
	
	sb $t1, 0($t0) 
	#creating a delay using syscall number 32
	li $v0, 32
	li $a0, 1000	# one second
	syscall
	
	li $t1, 0x02	#$b 0000 0010
	sb $t1, 0($t0) 
	#creating a delay using syscall number 32
	li $v0, 32
	li $a0, 1000	# one second
	syscall
	
	li $t1, 0x03	#$b 0000 0011 -     hgfedcba
	sb $t1, 0($t0)
	sb $t1, 0($t0) 
	#creating a delay using syscall number 32
	li $v0, 32
	li $a0, 1000	# one second
	syscall
	
	li $t1, 0x05	#$b 0000 0101
	sb $t1, 0($t0)
	sb $t1, 0($t0) 
	#creating a delay using syscall number 32
	li $v0, 32
	li $a0, 1000	# one second
	syscall
	
	li $t1, 0xff	#$b 1111 1111
	sb $t1, 0($t0)
	sb $t1, 0($t0) 
	#creating a delay using syscall number 32
	li $v0, 32
	li $a0, 1000	# one second
	syscall
	
	
	
	#exit 
	li $v0, 10
	syscall