.data # data segment
	#asciiz;
	iptmsg1:.asciiz "This is a square procedure,please input the number you want to square."
	iptmsg2:.asciiz "Please input accuracy."
	endl:.asciiz "\n"
	float_2:.float 2
.text 
main:
	li $t0,0x10011000 #store base addr of data segment
	
	#input n
	li $v0,52 #nputDialogFloat,get the number you want to square
	la $a0,iptmsg1
	syscall
	s.s $f0,0($t0) #store the number you want to square in segment 0-3
	#output n
	sub $sp,$sp,8
	sw $t0,4($sp)#save t0
	sw $v0,0($sp)#save v0
	l.s $f12, 0($t0)#pass n
	jal print_float#call
	lw $t0,4($sp)#recover t0
	lw $v0,0($sp)#recover v0
	addi $sp,$sp,8
	
	#input k
	la $a0,iptmsg2
	syscall
	s.s $f0,4($t0) #store k in segment 0-3
	sub $sp,$sp,8
	sw $t0,4($sp) #save t0
	sw $v0,0($sp) #save v0
	l.s $f12,4($t0)
	jal print_float
	lw $t0,4($sp) #recover t0
	lw $v0,0($sp) #recover v0
	addi $sp,$sp,8

	l.s $f0,0($t0) #load n to f0, x0 = n
	jal newton_sqrt
exit:
	li $v0,10
	syscall

newton_sqrt:
	mul.s $f1,$f0,$f0 #caculate xn^2
	l.s $f2, 0($t0) #retrieve n
	sub.s $f1,$f1,$f2 #caculate f(x)
	l.s $f2, 4($t0) #retrieve k
	c.lt.s $f1,$f2 #f(x) < k
	bc1t return
	l.s $f2,float_2 #get 2.0
	mul.s $f2,$f2,$f0 #cacultae f'(x)
	div.s $f3,$f1,$f2 #cacultae f(x)/f'(x)
	sub.s $f0,$f0,$f3 #xn+1 = xn-1 - f(x)/f'(x)
	j newton_sqrt
return:
	mov.s $f12,$f0
	jal print_float
	jr $ra
	
	
print_float:
	#print float(n or k)
	li $v0,2
	syscall
	#print endl
	sub $sp,$sp,4
	sw $ra,0($sp)#save ra
	la $a0,endl #pass endl
	jal print_string
	
	lw $ra,0($sp)
	addi $sp,$sp,4#recover ra
	jr $ra #return


print_string:
	li $v0,4 #pass server code
	syscall
	jr $ra #return


