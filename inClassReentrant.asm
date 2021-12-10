








.data
	randNums: .space 80
	randCount: .word 20
	
	




.text 
	.globl main
main:
	la $a0, randNums
	lw $a1, randCount
	jal genAndPrintRandNums
	
	jal Exit
	
.data
	num: .asciiz "Random number: "
	
.text

genAndPrintRandNums:
	#prolog
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	move $s0, $a0
	move $s1, $a1
	
	move $t0, $s0
	move $t1, $s1
	
	sll $t1, $t1, 2
	add $t1, $t1, $t0
	
	
	li $a1, 55		##seed
	li $v0, 40
	syscall
	
	
	#set up the counters
	li $t2, 0
#start the loop
loop:
	li $v0, 42
	li $a1, 99
	syscall
	#randNum= rand.nextInt( 99 )  -49
	addi  $a0, $a0, -49
	
	sw $a0, ($t0)			#store it in the array
	add $t0, $t0, 4
	#caal the print in subprogram
	move $a1, $a0
	la $a0, num
	jal PrintInt      #leaf
	jal PrintNewLine	#leaf
	
	
	slt $t3, $t0, $t1
	beqz $t3, endLoop
	b loop
	
	move $a0,$s0
	move $a1, $s1
	#jal PrintPositiveIntArray
	
endLoop:
	
	#epilog
	#restore all the registers by popping from the stack
	lw $ra, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 12
	jr $ra

	
	
	
	
	
	
	
.include "utils.asm"
