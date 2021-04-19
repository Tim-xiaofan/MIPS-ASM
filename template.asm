.data # 数据段 
	#数据声明格式 - 数据标签∶数据类型 数据值
	aWord: .word 32
	aHalf: .half 16
	aByte: .byte 8
	aString: .asciiz "i'm a string."
	endl: .asciiz "\n"
	aFloat: .float 3.1415926
	aDouble: .double 64.0
	aSpace:.space 3 #声明1个三字节空间
	intArray:.word 0:10#声明10个连续word并都初始化为0
	charArray:.byte'a','b','c'#连续声明三个字符类型的数据

.text #代码段
main: #程序入口
	add $t1,$t0,100
	add $t2,$t0,50
	beq $t1,$t2,exit #分支结构
loop:
	move $a0,$t2 #按值传递参数
	jal print_int
	la $a0,endl#按地址传入参数
	jal print_string  
	add $t2,$t2,10
	bne $t1,$t2,loop#循环结构
exit:#程序结束
	li $v0,10
	syscall
notReach:
	nop
	nop
	nop
print_int:
	li $v0,1 #传入服务编码
	syscall
	jr $ra
print_string:
	li $v0,4 #传入服务编码
	syscall 
	jr $ra #return
