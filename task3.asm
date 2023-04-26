#	Name:	Jeffrey Rodas,  Andrew John Valdez, Youssef Mikhail
#	Class:	CS 2640.02
#	Date: 	05/07/2023
#	Objectives:
#		Write an program in Assembly that takes practiceFile.txt file and appends to it.
#		Answer the following prompt with your file append: "What have you enjoyed most about the class so far?"

.data
userFile: .space 64 
userInput: .space 64
fileName: .asciiz "practiceFile.txt"
question: .asciiz "What have you enjoyed most about the class so far?: "
.text
main:
#getting file name from user
	li $v0, 8
	la $a0, userFile
	li $a1, 63
	syscall
	
	#save to register
	move $t1,$a0
#prompt the question
	li $v0, 4
	la $a0, question 
	syscall
	
#getting uese input for what to write
	li $v0, 8
	la $a0, userInput
	li $a1, 63
	syscall
	
	#save to register
	move $t2,$a0

#opening the 'practiceFile.txt' file
	li $v0, 13 
	la $a0, fileName #loading file address
	li $a1, 9 #writing to this file
	li $a2, 0 #mode gets ignored for opening file
	syscall
	move $s1, $v0 #save file descriptor to $s1
	
#write items to practiceFile.txt
	li $v0, 15
	move $a0, $s1
	la $a1, userInput
	li $a2, 63 #how many characters we are writing to the file
	syscall
	
#close the practiceFile.txt file
	li $v0, 16
	move $a0, $s1
	syscall
	j exit
	
#exit
exit:
	li $v0, 10
	syscall