.data 
	message: .asciiz "Hello World"
.text
main:
	li $v0,4 #伪指令，最高可传32立即数给寄存器（真实指令最多只能传16位立即数）
	la $a0,message #伪指令，最高可传32地址值给寄存器（真实指令最多只能传16位立即数）
	syscall
exit:
	li $v0,10
	syscall  
