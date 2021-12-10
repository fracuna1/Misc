.data
    LIST:         .word 12, 22, 31, 14, 55
    LIST2:		   .word 1, 2, 3, 4, 5
    LISTSize:     .word 5
.text
main:
    # init
    la     $t0, LIST            # array
    lw    $t1, LISTSize        # size
    li     $t2, 0            # I – index conter
clearLoop:
    beq     $t1, $t2, endLoop      #test
    sw    $zero, 0($t0)        #clear
    addi     $t0, $t0, 4        #update by 4 each word is 4 bytes
    addi     $t2, $t2, 1        #update
    j     clearLoop
endLoop:
	#have to set up argument registers $a0,$a1
	la  $a0, LIST2
	lw $a1, LISTSize
	#call the subprogram
	jal clear2
	jal Exit
	
#subprogram:clear2
#purpose:to clear an array using pointers
#inputs:
#outputs: None

clear2:
	move $t0,$a0   	#$t0=p= & arrray[0]=base address
	sll $t1, $a1, 2  #$t1 now has the address of the last element
	add $t2, $a0, $t1  #$t2=&array[size] is the address of the last element of the array
	
loop:
	sw $zero, 0($t0)
	addi $t0, $t0, 4    #p=p+4
	slt $t3, $t0, $t2  #$t3= p<&array[size]
	bne $t3, $zero, loop
	jr $ra
	

.include  "utils.asm"