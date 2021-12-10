# Title: First MIPS Program
# Desc: writing and examining a first program written in MIPS using MARS
# Author: Felicia Acuna
# Date: 8-31-2020

.text
    .globl main
main:
  ori $t0, $zero, 0x02   #$t0= 0x02
  ori $t1, $zero, 0x03   #$t1= 0x03
  add $t2, $t0,$t1    #St2= $t0 + $t1
  
  #Code below will be explained later
  ori $v0,$zero, 0x0A  # Load up an exit code
  syscall              # Use a system call to exit the program.