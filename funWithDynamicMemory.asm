


#include <stdio.h>
#include <stdlib.h>
#int main() {
#int *x = (int*)malloc(sizeof(int));
#char *aString = (char*)malloc(sizeof(char)*30);
#int *mults = (int*)malloc(sizeof(int)*10);
#printf("Enter x ");
#scanf("%d",x);
#printf("Enter the name of your data");
#scanf("%29s",aString);
#int multiple = *x;
#int base = *x;
#for (int i = 0; i < 10; i++) {
#mults[i] = multiple;
#multiple += base;
#}
#printf("%s\n",aString);
#for (int i = 0; i < 10; i++)
#printf("%d ",mults[i]);
#printf("\n");
#}

#part1 

#int main() {
#int *x = (int*)malloc(sizeof(int));
#char *aString = (char*)malloc(sizeof(char)*30);
#int *mults = (int*)malloc(sizeof(int)*10);




.text 
	.globl main
	
main:
	#part 1A
	li $v0, 9
	li $a0, 4		#bytes for the integer
	syscall
	
	#$v0 register contains the address of the integer
	move $s0, $v0		#*x = save the pointer in the $s register
	# lets save an int (x) on the heap
	
	#promt th euser for the int
	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	#the int will be in $v0
	sw $v0, 0($s0)
	
	#li $t0, 55
	#sw $t0, 0($s0)
	#part 1B
	
	li $v0, 9
	li $a0, 30
	syscall
	move $s1, $v0  #save *aString pointer in $s1
	#prompt for thr string
	la $a0, prompt2
	li $v0, 4
	syscall
	#certain number of char then we can use the service call 8
	move $a0, $s1   # address of the aString
	li $v0, 8
	li $a1, 30
	syscall
	
	#allocate memory for an array of 10 ints
	
	li $v0, 9
	li $a0, 40		#bytes for the integer
	syscall
	move $s2, $v0   #sav the base address of the array in $s2
	
	
	#for (int i = 0; i < 10; i++)
	#mults[i]=multiple);
	#multiple += base
	#}
	# load x into any t register
	lw $t0, 0($s0)
	#set up the count variable
	li $t1, 0
	li $t2, 10
	
	
	
arrayloop:
	



.text
	Exit:
	#exit
	li $v0, 10
	syscall
	
	
	
.data
	prompt1: .asciiz "Enter an integer: "
	prompt2: .asciiz "Enter the name of your data: "
	