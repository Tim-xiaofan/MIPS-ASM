.data 
	message: .asciiz "Hello World"
.text
main:
	li $v0,4 #αָ���߿ɴ�32���������Ĵ�������ʵָ�����ֻ�ܴ�16λ��������
	la $a0,message #αָ���߿ɴ�32��ֵַ���Ĵ�������ʵָ�����ֻ�ܴ�16λ��������
	syscall
exit:
	li $v0,10
	syscall  
