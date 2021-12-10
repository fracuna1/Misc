#Author; Felicia Acuna
#program: FunWithBitMapDisplay
#Date: 11/9

.eqv BITMAPDISPLAY  0xFFFF0000

.text
	.globl main
main:
	li $s0, BITMAPDISPLAY
	li $s1, 0x00FF0000       # full on red   00 RR GG BB   0x00FF0000
	li $s2, 0x0000FF00
	
	#$ store the pixel color at the BITMAPDISPLAY address
	
	sw $s1, 0($s0)   
	sw $s1, 4($s0)
	sw $s2, 8($s0)
	
	li $v0, 10
	syscall