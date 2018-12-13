.data 
val : .asciiz "Enter the number of disks:\t "
output: .asciiz "Number of moves: \t"
error : .asciiz "Plaese enter valid number of disks\n" 
.text 
main: 
#taking input from user for the number of disks in game#
la $a0, val
li  $v0, 4
syscall
li $v0 ,5
syscall
#moving input value from user to another register to use as counter#
move $a1 , $v0
#register $a3 holds the value 2 to calculate 2^n#
#n is the number of disks that the user will input#
li $a3,2
#checking if value that the user has given is greater than or equals to 2#
#if value is greater than or equal to 2 then it will go to the label "loop" to calculate no. of moves#
bge $a1,2,loop
#if value is equal to 1 then it will be printed# 
beq $a1 ,1, print 
#if the value given by user is less than 1 then an error message will be printes#
#and the user will be directed again to input a valid value#
la , $a0 , error
li, $v0, 4
syscall
jal main
li $v0, 10
syscall
