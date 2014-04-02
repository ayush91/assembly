	.data
H: .word 4			# Variable n value

.text

Main:  
	lw $a0, H		# load n value into arguements
	jal Hanoi		# call Hanoi function
	j Exit			# exit program
	
Hanoi:
	addi $sp, $sp, -8	# reserve stack for 2 items
	sw $ra, 4($sp)		# save return address
	sw $a0, 0($sp)		# save n value
	
	beq $a0, 1, ReturnOne	# check if n value is 1
				# (if yes return 1 if not perform recursion)
				
	sub $a0, $a0, 1		# set n to n-1
	jal Hanoi		# call recursion
	
	mul $v0, $v0, 2		# on return multiply result by 2
	add $v0, $v0, 1		# add 1 to result
	
	lw $ra, 4($sp)		# restore return address
	lw $a0, 0($sp)		# restore n value
	addi $sp, $sp, 8	# release stack 
	jr $ra			# return value

ReturnOne: 
	addi $v0, $0, 1		# set return value to 1
	lw $ra, 4($sp)		# restore return address
	lw $a0, 0($sp)		# restore n value
	addi $sp, $sp, 8	# release stack 	
	jr $ra			# return value 1
	
Exit:				# exit program
