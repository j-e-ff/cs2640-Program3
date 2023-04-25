#	Name:	Jeffrey Rodas,  Andrew John Valdez, Youssef Mikhail
#	Class:	CS 2640.02
#	Date: 	04/25/2023
#	Objectives:
#		Write an program that will return a letter grade given a decimal int from the user. Include the following:
#		A main label, loop label, and an exit label
#		Loop through array while assigning grades
#		Extra credit for 100 and above
.macro aString($strings)
	li $v0, 4

.data
programerString: .asciiz $strings
.text
	la $a0, programerString
	syscall
.end_macro
.macro Exit
#print exit message
aString("The program will now exit")
#exit
li $v0, 10
syscall
.end_macro
.data
array: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82


.text
main: 
	#load address of array into $s0
	la $s0, array
	
	#initalize loop counter $t7
	move $t7, $zero
	
	
	
loop:
	#break out of loop when counter matches the number of elements
	beq $t7, 10, exit
	
	#get to current element of the array
	lw $t0, 0($s0)
		
	#print the element to the user
	aString("The grade for ")
	li $v0, 1
	move $a0, $t0
	syscall
	
	#increment base address to next element
	addi $s0, $s0, 4
	
	#increment loop counter
	addi $t7, $t7, 1
		
	
	j grade	
	
grade:
	
	#checking if grade is an F
	ble $t0, 59, F
	
	#checking if grade is D
	ble $t0, 69, D
	
	#checking if grade is C
	ble $t0, 79, C
	
	#checking if grade is B
	ble $t0, 89, B
	
	#checking if grade is A 
	ble $t0, 100,A
	
	#checking if grade is A 
	bge  $t0, 101,A1
	
A1:
	#printing out the grade and newline
	aString(" is: A with Exta Credit\n")
	
	j loop
A:
	#printing out the grade and newline
	aString(" is: A\n")
	
	j loop

B:
	#printing out the grade and newline
	aString(" is: B\n")

	j loop

C:
	#printing out the grade and newline
	aString(" is: C\n")
	
	j loop

D:
	#printing out the grade and newline
	aString(" is: D\n")
	
	j loop

F:
	#printing out the grade and newline
	aString(" is: F\n")
	
	j loop
	
exit:
	#exit
	Exit
