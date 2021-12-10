#funwithkeypad
# The mips program have to scan, one by one, each row (send 1,2,4,8...) and then observe if a key is pressed
 #(that mean byte value at adresse 0xFFFF0014 is different from zero). 
 # This byte value is composed of row number (4 left bits) and column number (4 right bits)
 #  Here you'll find the code for each key : 0x11,0x21,0x41,0x81,0x12,0x22,0x42,0x82,0x14,0x24,0x44,0x84,
 #  0x18,0x28,0x48,0x88. 
# For exemple key number 2 return 0x41, that mean the key is on column 3 and row 1. 





.eqv KEYCONFIG 0xFFFF0012	# command to poll the row
.eqv KEYPRESSED 0xFFFF0014	# recieved the row and col number
.eqv TWO 0x41
.eqv BASEADDRESS 0xFFFF0000
.text
	.globl main
main:

#polling row 1

CheckKeyPad:
	li $t0, KEYCONFIG
	li $t1, KEYPRESSED
	
	#
	li $t3, 0x01  	# this corresponds to row 1
	sb $t3, 0($t0)	# 
	
	# once the key is pressed
	lb $t4, 0($t1)
	
	beqz $t4, CheckKeyPad   # if $t4 is zero then none of the keys were pressed
	li $t5, TWO
	seq $t6, $t5, $t4
	beqz $t6, exit
	
	li $a0, 2	# loading key 2
	li $v0, 1
	syscall
	
exit:
	li $v0, 10
	syscall


















