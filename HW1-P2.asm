	.data
	
ArrayA: .word 1, 2, 3, 4, 5  	# Variable Array A
ArrayB: .word 3, 7, 5, 9, 2	# Variable Array B
nVal: 	.word 5			# Variable n Value
	
	.text
	
Main:
	la $a0, ArrayA		# load Array A pointer
	la $a1, ArrayB		# load Array B pointer
	lw $a2, nVal		# load n value arguement
	jal DotProduct		# call DotProduct function
	j Exit			# goto Exit of program


DotProduct:
	li $t0, 0		# create counter

	
loop:
	slt $t1, $t0, $a2	# check if counter is less than n-1
	beq $t1, $0, returnDP	# goto returnDP if check is false
	lw $t2, ($a0)		# load value at ArrayA current position
	lw $t3, ($a1)		# load value at ArrayB current position
	mul $t4, $t2, $t3	# multiply two values
	add $v0, $v0, $t4	# add result of multiply to v0 running total
	addi $t0, $t0, 1	# increment counter
	addi $a0, $a0, 4	# increment ArrayA pointer
	addi $a1, $a1, 4	# increment ArrayB pointer
	j loop			# repeat loop
	
returnDP:
	jr $ra			# end function

Exit:				# end program
