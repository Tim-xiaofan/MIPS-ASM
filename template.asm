.data # ���ݶ� 
	#����������ʽ - ���ݱ�ǩ���������� ����ֵ
	aWord: .word 32
	aHalf: .half 16
	aByte: .byte 8
	aString: .asciiz "i'm a string."
	endl: .asciiz "\n"
	aFloat: .float 3.1415926
	aDouble: .double 64.0
	aSpace:.space 3 #����1�����ֽڿռ�
	intArray:.word 0:10#����10������word������ʼ��Ϊ0
	charArray:.byte'a','b','c'#�������������ַ����͵�����

.text #�����
main: #�������
	add $t1,$t0,100
	add $t2,$t0,50
	beq $t1,$t2,exit #��֧�ṹ
loop:
	move $a0,$t2 #��ֵ���ݲ���
	jal print_int
	la $a0,endl#����ַ�������
	jal print_string  
	add $t2,$t2,10
	bne $t1,$t2,loop#ѭ���ṹ
exit:#�������
	li $v0,10
	syscall
notReach:
	nop
	nop
	nop
print_int:
	li $v0,1 #����������
	syscall
	jr $ra
print_string:
	li $v0,4 #����������
	syscall 
	jr $ra #return
