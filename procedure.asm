.data 
	message: .asciiz "Hello World"
.text
main:
	la $a0,message #传参
	jal print_string #call a procedure, jump and link
exit:
	li $v0,10
	syscall
print_string:
	li $v0,4 #传入服务编码
	syscall 
	jr $ra #return