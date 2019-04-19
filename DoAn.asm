.data
Day: .asciiz"Nhap ngay Day(du 2so): "
Month: .asciiz"Nhap thang Month(du 2 so): "
Year: .asciiz"Nhap nam Year(du 4 so): "
Opt1: .asciiz"\n1. Xuat chuoi Time theo dinh dang DD/MM/YYYY\n"
Opt2: .asciiz"2. Chuyen doi chuoi Time thanh mot trong cac dang sau:\n"
Opt2A: .asciiz "\tA.MM/DD/YYYY\n"
Opt2B: .asciiz "\tB.Month DD,YYYY\n"
Opt2C: .asciiz "\tC.DD Month,YYYY\n"
Opt3: .asciiz"3. Kiem tra co phai nam nhuan khong\n"
Opt4: .asciiz"4. Ngay vua nhap la ngay thu may trong tuan\n"
Opt5: .asciiz"5. Ngay vua nhap la ngay thu may ke tu ngay 1/1/1\n"
Opt6: .asciiz"6. Can chi ngay vua nhap\n"
Opt7: .asciiz"7. Khoang cach giua hai thoi gian\n"
Opt8: .asciiz"8. Hai nam nhuan gan nhat\n"
Opt9: .asciiz"9. Nhan du lieu tu input.txt va xuat ra output.txt\n"
Opt10: .asciiz"Else. Thoat"
Note: .asciiz"Nhap ngay lon hon\n"
Opt2.1.2.3: .asciiz"\n\t1\t\2\t3\t"
Error2: .asciiz"Loi!!!"
Opt: .asciiz"\n\n----------------------------------------------------\n\n"
Chose: .asciiz"\nLua chon: "
Result: .asciiz"\nKet qua:  "
Error: .asciiz"\nNhap ngay bi loi\n"
LineDown:.asciiz"\n\n"
NamNhuan: .asciiz"La nam nhuan !"
KhongNhuan: .asciiz"Khong phai nam nhuan!"
Time: .space 12
n1:.word 0
Focus: .space 20
n2:.word 0
Format: .space 20
n3:.word 0
kq4: .space 20
n4:.word 0
kq6: .space 20
n5:.word 0
kq2A: .space 20
n6:.word 0
kq2B: .space 20
n7:.word 0
kq2C: .space 20
n8:.word 0
Focus1: .space 20
n9:.word 0
Time1: .space 20
.text
#truyen tham so cho ham NHAPTIME
Main:
	KHOITAO:
		la $a0,Time
 		jal NHAPTIME
 		la $a0,Time
 		la $a1,Focus
		jal KhoiTaoFOCUS
	CHUCNANG:
		jal MENU
		li $v0,5 # nhap lua chon
		syscall 
		move $s0,$v0
		addi $t1,$s0,-1
		bne $t1,$0,CHUCNANG.MENU2
		la $a0,Time
		jal XULI1
		j CHUCNANG
		CHUCNANG.MENU2:
			addi $t1,$s0,-2
			bne $t1,$0,CHUCNANG.MENU3
			la $a0,Opt2.1.2.3
			li $v0,4
			syscall
			la $a0,Chose
			li $v0,4
			syscall
			li $v0,5 # nhap lua chon
			syscall 
			move $s0,$v0
			la $a0,Result
			li $v0,4
			syscall
			addi $t1,$s0,-1
			bne $t1,$0,CHUCNANG.MENU2B
			la $a0,Time 
			jal XULI2.1
			li $v0,4
			la $a0,kq2A
			syscall
			j CHUCNANG
			CHUCNANG.MENU2B:
				addi $t1,$s0,-2
				bne $t1,$0,CHUCNANG.MENU2C
				la $a0,Time
				la $a1,Focus
				jal XULI2.2
				li $v0,4
				la $a0,kq2B
				syscall
				j CHUCNANG
			CHUCNANG.MENU2C:
				addi $t1,$s0,-3
				bne $t1,$0,CHUCNANG.MENU2ERRO
				la $a0,Time
				la $a1,Focus
				jal XULI2.3
				li $v0,4
				la $a0,kq2C
				syscall
				j CHUCNANG
			CHUCNANG.MENU2ERRO:
				li $v0,4
				la $a0,Error2
				syscall
				j CHUCNANG
		CHUCNANG.MENU3:
			addi $t1,$s0,-3
			bne $t1,$0,CHUCNANG.MENU4
			la $a0,Result
			li $v0,4
			syscall
			la $a0,Focus
			jal XULI3
			j CHUCNANG
		CHUCNANG.MENU4:
			addi $t1,$s0,-4
			bne $t1,$0,CHUCNANG.MENU5
			la $a0,Result
			li $v0,4
			syscall
			la $a0,Focus
			jal XULI4
			li $v0,4
			la $a0,kq4
			syscall
			j CHUCNANG
		CHUCNANG.MENU5:
			addi $t1,$s0,-5
			bne $t1,$0,CHUCNANG.MENU6
			la $a0,Focus
			jal XULI5
			j CHUCNANG
		CHUCNANG.MENU6:
			addi $t1,$s0,-6
			bne $t1,$0,CHUCNANG.MENU7
			la $a0,Result
			li $v0,4
			syscall
			la $a0,Focus
			jal XULI6
			li $v0,4
			la $a0,kq6
			syscall
			j CHUCNANG
		CHUCNANG.MENU7:
			addi $t1,$s0,-7
			bne $t1,$0,CHUCNANG.MENU8
				li $v0,4
				la $a0,Note
				syscall
				la $a0,Time1
 				jal NHAPTIME
 				la $a0,Time1
 				la $a1,Focus1
				jal KhoiTaoFOCUS
			li $v0,4
			la $a0,Result
			syscall
			la $a0,Focus
			la $a1,Focus1
			jal XULI7
			move $a0,$v0
			li $v0,1
			syscall
			j CHUCNANG
		CHUCNANG.MENU8:
				
				
	THOATCT:	
		li $v0,10
		syscall
MENU:
	addi $sp,$sp,-4
	#backup thanh ghi
	sw $ra,($sp)
	
	li $v0,4
	la $a0,Opt
	syscall
	la $a0,Opt1
	syscall
	la $a0,Opt2
	syscall
	la $a0,Opt2A
	syscall
	la $a0,Opt2B
	syscall
	la $a0,Opt2C
	syscall
	la $a0,Opt3
	syscall
	la $a0,Opt4
	syscall
	la $a0,Opt5
	syscall
	la $a0,Opt6
	syscall
	la $a0,Opt7
	syscall
	la $a0,Opt8
	syscall
	la $a0,Opt9
	syscall
	la $a0,Opt
	syscall
	la $a0,Chose
	syscall
	lw $ra,($sp)
	#xoa stack
	addi $sp,$sp,4
	jr $ra

KhoiTaoFOCUS:
	#Khai bao stack
	addi $sp,$sp,-12
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	
	move $s0,$a0
	move $s1,$a1
	la $a0,($s0)
	la $a1,2
	jal CONVERTSTRING
	sw $v0,($s1)
	la $a0,3($s0)
	la $a1,2
	jal CONVERTSTRING
	sw $v0,4($s1)
	
	la $a0,6($s0)
	la $a1,4
	jal CONVERTSTRING
	sw $v0,8($s1)
	#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	#xoa stack
	addi $sp,$sp,12
	#tra ve
	jr $ra



NHAPTIME:
	#khai bao stack
	addi $sp,$sp,-12
	#backup thanh ghi
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
#Than thu tuc:
	#Lay dia chi mang
	move $s0,$a0
	li $s1,'/'
	NHAPTIME.LAP:
		#xuat Day
		li $v0,4
		la $a0,Day
		syscall
	
		#Nhap so Day
		li $v0,12
		syscall
		sb $v0,($s0)
		li $v0,12
		syscall
		sb $v0,1($s0)
		sb $s1,2($s0)
		
		li $v0,4
		la $a0,LineDown
		syscall
		#xuat Month
		li $v0,4
		la $a0,Month
		syscall
	
		li $v0,12
		syscall
		sb $v0,3($s0)
		li $v0,12
		syscall
		sb $v0,4($s0)
		sb $s1,5($s0)
		
		li $v0,4
		la $a0,LineDown
		syscall
	
		#xuat Year
		li $v0,4
		la $a0,Year
		syscall
	
		li $v0,12
		syscall
		sb $v0,6($s0)
		li $v0,12
		syscall
		sb $v0,7($s0)
		li $v0,12
		syscall
		sb $v0,8($s0)
		li $v0,12
		syscall
		sb $v0,9($s0)
		
		li $v0,4
		la $a0,LineDown
		syscall
		#tham chieu ham
		#move $a0,$s0
		#la $a1,Focus
		#jal CHECKTIME #kiem tra ngay co hop le
#Cuoi thu tuc
	#Restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	sw $s1,8($sp)
	#xoa stack
	addi $sp,$sp,12
	jr $ra


#######################
 XULI1:#(*Time)
 	#Khai bao stack
	addi $sp,$sp,-8
	sw $ra,($sp)
	sw $s0,4($sp)
	move $s0,$a0
	li $v0,4
	la $a0,Result
	syscall
	li $v0,4
	move $a0,$s0
	syscall
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	#xoa stack
	addi $sp,$sp,8
	#tra ve
	jr $ra
#####################
XULI2.1:#(Time*)
	#Khai bao stack
	addi $sp,$sp,-16
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $t0,12($sp)
#Than thu tuc
	move $s0,$a0
	la $s1,kq2A
	
	lb $t0,3($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,4($s0)
	sb $t0,($s1)
	addi $s1,$s1,1

	li $t0,'/'
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,0($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,1($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	li $t0,'/'
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,6($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,7($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,8($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
	
	lb $t0,9($s0)
	sb $t0,($s1)
	addi $s1,$s1,1
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $t0,12($sp)
	#xoa stack
	addi $sp,$sp,16
	#tra ve
	jr $ra
	
####################
XULI2.2:#(Time*,Focus*)
	#Khai bao stack
	addi $sp,$sp,-20
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
#Than thu tuc
	move $s0,$a0
	move $s1,$a1
	la $s2,kq2B
	la $a0,($s2)
	lw $a1,4($s1)
	jal GhiThangBangChu
	li $t0,' '
	sb $t0,3($s2)
	
	lb $t0,($s0)
	sb $t0,4($s2)
	lb $t0,1($s0)
	sb $t0,5($s2)
	
	li $t0,','
	sb $t0,6($s2)
	
	lb $t0,6($s0)
	sb $t0,7($s2)
	
	lb $t0,7($s0)
	sb $t0,8($s2)
	
	lb $t0,8($s0)
	sb $t0,9($s2)
	
	lb $t0,9($s0)
	sb $t0,10($s2)
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	#xoa stack
	addi $sp,$sp,20
	#tra ve
	jr $ra
####################
XULI2.3:#(Time*,Focus*)
	#Khai bao stack
	addi $sp,$sp,-20
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
#Than thu tuc
	move $s0,$a0
	move $s1,$a1
	la $s2,kq2C
	
	lb $t0,($s0)
	sb $t0,($s2)
	lb $t0,1($s0)
	sb $t0,1($s2)
	
	li $t0,' '
	sb $t0,2($s2)
	
	la $a0,3($s2)
	lw $a1,4($s1)
	jal GhiThangBangChu
	
	li $t0,','
	sb $t0,6($s2)
	
	lb $t0,6($s0)
	sb $t0,7($s2)
	
	lb $t0,7($s0)
	sb $t0,8($s2)
	
	lb $t0,8($s0)
	sb $t0,9($s2)
	
	lb $t0,9($s0)
	sb $t0,10($s2)
	
	
	
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	#xoa stack
	addi $sp,$sp,20
	#tra ve
	jr $ra
####################
XULI3:#(Focus*)
	#Khai bao stack
	addi $sp,$sp,-8
	sw $ra,($sp)
	sw $s0,4($sp)
	
#Than thu tuc
	move $s0,$a0
	lw $a0,8($s0)
	jal LeapYear
	beq $v0,$0,XULI3.NO
	li $v0,4
	la $a0,NamNhuan
	syscall
	j XULI3.Exit
	XULI3.NO:
		li $v0,4
		la $a0,KhongNhuan
		syscall
	XULI3.Exit:
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	#xoa stack
	addi $sp,$sp,8
	#tra ve
	jr $ra

##############
XULI4:#(Focus*)
	addi $sp,$sp,-20
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $t0,12($sp)
	sw $s2,16($sp)
#Than thu tuc
	jal TONGSONGAY
	li $s0,7
	div $v0,$s0
	mfhi $s1
	la $s2,kq4
	bne $s1,$0,XULI4.T3
	#luu vao chuoi
	li $t0,'M'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'o'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'n'
	sb $t0,($s2)
	addi $s2,$s2,1
	j XULI4.Exit
	
	XULI4.T3:
		addi $t0,$s1,-1
		bne $t0,$0,XULI4.T4
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'e'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI4.Exit
	XULI4.T4:
		addi $t0,$s1,-2
		bne $t0,$0,XULI4.T5
		#luu
		li $t0,'W'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'e'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'d'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI4.Exit
	XULI4.T5:
		addi $t0,$s1,-3
		bne $t0,$0,XULI4.T6
		#
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'h'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI4.Exit
	XULI4.T6:
		addi $t0,$s1,-4
		bne $t0,$0,XULI4.T7
		
		#
		li $t0,'F'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'r'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI4.Exit
	XULI4.T7:
		addi $t0,$s1,-5
		bne $t0,$0,XULI4.Cn
		
		#
		li $t0,'S'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'t'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI4.Exit
	XULI4.Cn:
		addi $t0,$s1,-6
		bne $t0,$0,XULI4.Exit
		#
		li $t0,'S'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
	XULI4.Exit:
#Cuoi thu tuc	
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $t0,12($sp)
	lw $s2,16($sp)
	addi $sp,$sp,20
	jr $ra
#############
XULI5:#(Focus*)
#Khai bao stack
	addi $sp,$sp,-8
	sw $ra,($sp)
	sw $s0,4($sp)
	#xuatv0
#Than thu tuc
	jal TONGSONGAY
	#xuat ket qua
	move $s0,$v0
	li $v0,4
	la $a0,Result
	syscall
	#xuat $v0
	move $a0,$s0
	la $v0,1
	syscall
#Cuoi thu tuc	
	lw $ra,($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
	jr $ra
#############
XULI6:# tham so: Focus* , tra ve kq6
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
#Than thu tuc
	lw $s0,8($a0) # nam 
	li $t1,10   #can
	div $s0,$t1
	mfhi $t1
	la $s2,kq6
	
	bne $t1,$0,XULI6.Tan
	#luu vao chuoi
	li $t0,'C'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'a'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'n'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'h'
	sb $t0,($s2)
	addi $s2,$s2,1
	j XULI6.Exit
	
	XULI6.Tan:
		addi $t0,$t1,-1
		bne $t0,$0,XULI6.Nham
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
		
		j XULI6.Exit
	XULI6.Nham:
		addi $t0,$t1,-2
		bne $t0,$0,XULI6.Quy
		#luu
		li $t0,'N'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'h'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'m'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Quy:
		addi $t0,$t1,-3
		bne $t0,$0,XULI6.Giap
		#
		li $t0,'Q'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'y'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Giap:
		addi $t0,$t1,-4
		bne $t0,$0,XULI6.At
		
		#
		li $t0,'G'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'p'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.At:
		addi $t0,$t1,-5
		bne $t0,$0,XULI6.Binh
		#
		li $t0,'A'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'t'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Binh:
		addi $t0,$t1,-6
		bne $t0,$0,XULI6.Dinh
		#
		li $t0,'B'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'h'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Dinh:
		addi $t0,$t1,-7
		bne $t0,$0,XULI6.Mau
		#
		li $t0,'D'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'h'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Mau:
		addi $t0,$t1,-8
		bne $t0,$0,XULI6.Ky
		#
		li $t0,'M'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.Exit
	XULI6.Ky:
		addi $t0,$t1,-9
		bne $t0,$0,XULI6.Exit
		#
		li $t0,'K'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'y'
		sb $t0,($s2)
		addi $s2,$s2,1
	XULI6.Exit:
	
	#them khoang trang
	li $t0,' '
	sb $t0,($s2)
	addi $s2,$s2,1
	#
	li $t1,12  #can
	div $s0,$t1
	mfhi $t1
	
	bne $t1,$0,XULI6.Dau
	#luu vao chuoi
	li $t0,'T'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'h'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'a'
	sb $t0,($s2)
	addi $s2,$s2,1
	li $t0,'n'
	sb $t0,($s2)
	addi $s2,$s2,1
	j XULI6.1.Exit
	
	XULI6.Dau:
		addi $t0,$t1,-1
		bne $t0,$0,XULI6.Tuat
		#luu vao chuoi
		li $t0,'D'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		
		j XULI6.1.Exit
	XULI6.Tuat:
		addi $t0,$t1,-2
		bne $t0,$0,XULI6.Hoi
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'t'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Hoi:
		addi $t0,$t1,-3
		bne $t0,$0,XULI6.TyC
		#luu vao chuoi
		li $t0,'H'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'o'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.TyC:
		addi $t0,$t1,-4
		bne $t0,$0,XULI6.Suu
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'y'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'('
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'C'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,')'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Suu:
		addi $t0,$t1,-5
		bne $t0,$0,XULI6.Dan
		#luu vao chuoi
		li $t0,'S'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Dan:
		addi $t0,$t1,-6
		bne $t0,$0,XULI6.Meo
		#luu vao chuoi
		li $t0,'D'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'a'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Meo:
		addi $t0,$t1,-7
		bne $t0,$0,XULI6.Thin
		#luu vao chuoi
		li $t0,'M'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'e'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'o'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Thin:
		addi $t0,$t1,-8
		bne $t0,$0,XULI6.TyR
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'h'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'n'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.TyR:
		addi $t0,$t1,-9
		bne $t0,$0,XULI6.Ngo
		#luu vao chuoi
		li $t0,'T'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'y'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'('
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'R'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,')'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Ngo:
		addi $t0,$t1,-10
		bne $t0,$0,XULI6.Mui
		#luu vao chuoi
		li $t0,'N'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'g'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'o'
		sb $t0,($s2)
		addi $s2,$s2,1
		j XULI6.1.Exit
	XULI6.Mui:
		addi $t0,$t1,-11
		bne $t0,$0,XULI6.1.Exit
		#
		li $t0,'M'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'u'
		sb $t0,($s2)
		addi $s2,$s2,1
		li $t0,'i'
		sb $t0,($s2)
		addi $s2,$s2,1
	XULI6.1.Exit:
		
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra
###################
XULI7:#(Focus1*,Focus2*)
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $t0,12($sp)
	sw $t1,16($sp)
	sw $t2,20($sp)
#Than thu tuc
	move $s0,$a0
	move $s1,$a1
	lw $a0,8($s0)
	lw $a1,8($s1)
	jal SONGAYCHANNAMCUA2NGAY
	move $t0,$v0 #luu khoang cach
	lw $t1,8($s0)
	lw $t2,8($s1)
	sub $t1,$t2,$t1
	beq $t1,$0,XULI7.CUNGNAM #2 ngay cung nam
	la $a0,($s0)
	jal NGAYHIENTAIDENCUOINAM
	add $t0,$t0,$v0
	la $a0,($s1)
	jal DAUNAMDENNGAYHIENTAI
	add $t0,$t0,$v0
	j XULI7.Exit
	XULI7.CUNGNAM:
		lw $t1,4($s1)
		lw $t2,4($s0)
		beq $t2,$t1,,XULI7.CUNGNAMTHANG
		lw $t1,4($s1)
		addi $t1,$t1,-1
		lw $t2,4($s0)
		beq $t2,$t1,XULI7.Continue1
		j XULI7.Continue2
		XULI7.Continue1:
			move $a0,$t2
			lw $t2,8($s0)
			move $a1,$t2
			jal SoNgayTrongThang
			lw $t2,($s0)
			sub $v0,$v0,$t2
			add $t0,$t0,$v0
		XULI7.Continue2:
		la $a0,($s0)
		move $a1,$t1
		jal NGAYHIENTAIDENCUOITHANG
		add $t0,$t0,$v0
		lw $t1,($s1)
		add $t0,$t0,$t1
	XULI7.Exit:
	move $v0,$t0
	j XULI7.Exit1
	XULI7.CUNGNAMTHANG:
		lw $t1,($s1)
		lw $t2,($s0)
		sub $v0,$t1,$t2
	XULI7.Exit1:
		
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $t0,12($sp)
	lw $t1,16($sp)
	lw $t2,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra


#############
CONVERTSTRING: #(Time* ,int) 
#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	sw $t2,16($sp)
	sw $t3,20($sp)
#Than thu tuc
	move $s0,$a0
	li $t0,1
	li $t1,10
	li $t2,1
	li $v0,0
	beq $a1,$t0,CONVERTSTRING.lap
	timheso:
		mult $t0,$t1
		mflo $t0
		addi $t2,$t2,1
		bne $t2,$a1,timheso
	CONVERTSTRING.lap:
		lb $t1,($s0)
		addi $t1,$t1,-48
		li $t2,1
		slt $t3,$t1,$t2
		mult $t1,$t0
		mflo $t1
		add $v0,$v0,$t1
		addi $s0,$s0,1 # tang dia chi
		addi $a1,$a1,-1
		li $t1,10
		div $t0,$t1
		mflo $t0
		bne $a1,$0,CONVERTSTRING.lap
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	lw $t2,16($sp)
	lw $t3,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra

##################
	
LeapYear: #(int Nam)
	#khai bao stack
	addi $sp,$sp,-12
	#backup thanh ghi
	sw $t1, 0($sp)
	sw $t0, 4($sp)
	sw $ra, 8($sp)
	#nam = $a0
	li $t1, 400
	div $a0, $t1  #nam/400
	mfhi $t1 # so du cua phep chia cho 400
	beq $0, $t1 True #neu so du = 0 thuc thi nhan True
	li $t1, 4
	div $a0, $t1  #nam/4
	mfhi $t1 # so du cua phep chia cho 14
	beq $0, $t1 YearDIV100
  YearDIV100:
	li $t1, 100
	div $a0, $t1  #nam/100
	mfhi $t1 # so du cua phep chia cho 100
	beq $t1, $0, False
   False:
	li $v0, 0 #tra ve 0 khi nam khong phai nam nhuan
	lw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $ra, 8($sp)
	addi $sp,$sp,12
	jr $ra
   True:
	li $v0, 1 #tra ve 1 khi nam la nam nhuan
	#Restore thanh ghi
	lw $t1, 0($sp)
	lw $t0, 4($sp)
	lw $ra, 8($sp)
	# Xoa stack
	addi $sp,$sp,12
	jr $ra
######################
SoNgayTrongThang: #(int Thang,int Nam)
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
#Than thu tuc
	move $s1,$a0
	move $s2,$a1
	li $t0,1
	bne $s1,$t0,L3
	li $v0,31
	j EXIT
	L3:
		addi $t1,$s1,-2
		bne $t1,$t0,L4
		li $v0,31
		j EXIT
	L4:
		addi $t1,$s1,-3
		bne $t1,$t0,L5
		li $v0,30
		j EXIT
	L5:
		addi $t1,$s1,-4
		bne $t1,$t0,L6
		li $v0,31
		j EXIT
	L6:
		addi $t1,$s1,-5
		bne $t1,$t0,L7
		li $v0,30
		j EXIT
	L7:
		addi $t1,$s1,-6
		bne $t1,$t0,L8
		li $v0,31
		j EXIT
	L8:
		addi $t1,$s1,-7
		bne $t1,$t0,L9
		li $v0,31
		j EXIT
	L9:
		addi $t1,$s1,-8
		bne $t1,$t0,L10
		li $v0,30
		j EXIT
	L10:
		addi $t1,$s1,-9
		bne $t1,$t0,L11
		li $v0,31
		j EXIT
	L11:
		addi $t1,$s1,-10
		bne $t1,$t0,L12
		li $v0,30
		j EXIT
	L12:
		addi $t1,$s1,-11
		bne $t1,$t0,L2
		li $v0,31
		j EXIT
	L2:
		addi $t1,$s1,-1
		bne $t1,$t0,EXIT
		move $a0,$s2
		jal LeapYear
		beq $v0,$0,L2.1
		li $v0,29
		j EXIT
		L2.1:
			li $v0,28
			
	EXIT:
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra

#################
##################
SONGAYCUANAM:#(int Nam)
	#Khai bao stack
	addi $sp,$sp,-4
	sw $ra,($sp)
#Than thu tuc
	
	jal LeapYear
	bne $v0,$0,SONGAYCUANAM.Nhuan
	li $v0,365
	j SONGAYCUANAM.KETTHUC
	SONGAYCUANAM.Nhuan:
		li $v0,366
#Cuoi thu tuc	
	SONGAYCUANAM.KETTHUC:
	#restore thanh ghi
	lw $ra,($sp)
	#xoa stack
	addi $sp,$sp,4
	#tra ve
	jr $ra
#################
SONGAYTRUOCNAM: #(int NAM)
	#Khai bao stack
	addi $sp,$sp,-16
	sw $ra,($sp)
	
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $s0,12($sp)
#Than thu tuc
	move $t0,$a0
	li $t1,0
	li $s0,1
	beq $t0,$s0,SONGAYTRUOCNAM.TRAVE
	SONGAYTRUOCNAM.LAP:
		addi $t0,$t0,-1
		move $a0,$t0
		jal SONGAYCUANAM
		add $t1,$t1,$v0
		bne $t0,$s0,SONGAYTRUOCNAM.LAP
#Cuoi thu tuc	
	SONGAYTRUOCNAM.TRAVE:
	move $v0,$t1
	#restore thanh ghi
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $s0,12($sp)
	#xoa stack
	addi $sp,$sp,16
	#tra ve
	jr $ra
############################
SONGAYTRUOCTHANG:#(int Thang,Nam)
	
#Khai bao stack
	addi $sp,$sp,-20
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	sw $t2,16($sp) 
#Than thu tuc
	move $t0,$a0
	move $s0,$a1
	li $t1,0
	li $t2,1
	beq $t0,$t2,SONGAYTRUCTHANG.TRAVE
	SONGAYTRUOCTHANG.LAP:
		addi $t0,$t0,-1
		move $a0,$t0
		move $a1,$s0
		jal SoNgayTrongThang
		add $t1,$t1,$v0
		bne $t2,$t0,SONGAYTRUOCTHANG.LAP
	SONGAYTRUCTHANG.TRAVE:
	move $v0,$t1
	
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	lw $t2,16($sp) 
	#xoa stack
	addi $sp,$sp,20
	#tra ve
	jr $ra
########################### ke tu ngay 1/1/1
TONGSONGAY:#(FOCUS*)
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $t0,20($sp)
#Than thu tuc
	#move $s0,$a0 
	la $a0,Focus
	lw $s1,($a0)
	lw $s2,4($a0)
	lw $s3,8($a0)
	li $t0,0
	add $t0,$s1,$0
	move $a0,$s2
	move $a1,$s3
	jal SONGAYTRUOCTHANG
	add $t0,$t0,$v0
	move $a0,$s3
	jal SONGAYTRUOCNAM
	add $t0,$t0,$v0
	move $v0,$t0
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $t0,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra
##############
GhiThangBangChu:#(Time*,int Thang)
	#Khai bao stack
	addi $sp,$sp,-16
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $t0,12($sp)
#Than thu tuc
	move $s0,$a0
	move $s1,$a1
	addi $t0,$s1,-1
	bne $t0,$0,GhiThang2
	li $t0,'J'
	sb $t0,($s0)
	addi $s0,$s0,1
	li $t0,'a'
	sb $t0,($s0)
	addi $s0,$s0,1
	li $t0,'n'
	sb $t0,($s0)
	addi $s0,$s0,1
	j GhiThangBangChu.Exit
	GhiThang2:
		addi $t0,$s1,-2
		bne $t0,$0,GhiThang3
		li $t0,'F'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'e'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'b'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang3:
		addi $t0,$s1,-3
		bne $t0,$0,GhiThang4
		li $t0,'M'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'a'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'r'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang4:
		addi $t0,$s1,-4
		bne $t0,$0,GhiThang5
		li $t0,'A'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'p'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'r'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang5:
		addi $t0,$s1,-5
		bne $t0,$0,GhiThang6
		li $t0,'M'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'a'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'y'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang6:
		addi $t0,$s1,-6
		bne $t0,$0,GhiThang7
		li $t0,'J'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'u'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'n'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang7:
		addi $t0,$s1,-7
		bne $t0,$0,GhiThang8
		li $t0,'J'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'u'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'l'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang8:
		addi $t0,$s1,-8
		bne $t0,$0,GhiThang9
		li $t0,'A'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'u'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'g'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang9:
		addi $t0,$s1,-9
		bne $t0,$0,GhiThang10
		li $t0,'S'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'e'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'p'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang10:
		addi $t0,$s1,-10
		bne $t0,$0,GhiThang11
		li $t0,'O'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'c'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'t'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang11:
		addi $t0,$s1,-11
		bne $t0,$0,GhiThang12
		li $t0,'N'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'o'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'v'
		sb $t0,($s0)
		addi $s0,$s0,1
		j GhiThangBangChu.Exit
	GhiThang12:
		addi $t0,$s1,-12
		bne $t0,$0,GhiThangBangChu.Exit
		li $t0,'D'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'e'
		sb $t0,($s0)
		addi $s0,$s0,1
		li $t0,'c'
		sb $t0,($s0)
		addi $s0,$s0,1
	GhiThangBangChu.Exit:
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $t0,12($sp)
	#xoa stack
	addi $sp,$sp,16
	#tra ve
	jr $ra
################
SONGAYCHANNAMCUA2NGAY: #(int NAM1,Int Nam2)
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
#Than thu tuc
	move $s0,$a0
	move $s1,$a1
	sub $s2,$s1,$s0
	li $t0,1
	beq $s2,$0,SONGAYCHANNAMCUA2NGAY.Exit
	beq $s2,$t0,SONGAYCHANNAMCUA2NGAY.Exit
	addi $t0,$s2,-1
	li $t1,0 #luu so ngay
	SONGAYCHANNAMCUA2NGAY.Tinh:
		addi $s1,$s1,-1
		move $a0,$s1
		jal SONGAYCUANAM
		add $t1,$t1,$v0
		addi $t0,$t0,-1
		bne $t0,$0,SONGAYCHANNAMCUA2NGAY.Tinh
		j SONGAYCHANNAMCUA2NGAY.Exit1
	SONGAYCHANNAMCUA2NGAY.Exit:
	li $v0,0
	SONGAYCHANNAMCUA2NGAY.Exit1:
	move $v0,$t1
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra
######################
NGAYHIENTAIDENCUOINAM:#(Focus*)
	#Khai bao stack
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
#Than thu tuc
	move $s0,$a0
	lw $s1,4($s0)
	lw $s2,8($s0)
	li $t0,12
	li $t1,0
	beq $t0,$s1,NGAYHIENTAIDENCUOINAM.KQ
	NGAYHIENTAIDENCUOINAM.LAP:
		move $a0,$t0
		move $a1,$s2
		jal SoNgayTrongThang
		add $t1,$t1,$v0
		addi $t0,$t0,-1
		bne $t0,$s1,NGAYHIENTAIDENCUOINAM.LAP
	NGAYHIENTAIDENCUOINAM.KQ:	
		move $a0,$s1
		move $a1,$s2
		jal SoNgayTrongThang
		lw $s1,($s0)
		sub $t0,$v0,$s1
		add $t1,$t1,$t0
		move $v0,$t1
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra
###################
DAUNAMDENNGAYHIENTAI:#Focus*
	#Khai bao stack
	
	addi $sp,$sp,-24
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
#Than thu tuc
	move $s0,$a0
	lw $s1,4($s0)
	lw $s2,8($s0)
	li $t0,1
	li $t1,0
	beq $t0,$s1,DAUNAMDENNGAYHIENTAI.KQ
	DAUNAMDENNGAYHIENTAI.LAP:
		move $a0,$t0
		move $a1,$s2
		jal SoNgayTrongThang
		add $t1,$t1,$v0
		addi $t0,$t0,1
		bne $t0,$s1,DAUNAMDENNGAYHIENTAI.LAP
	DAUNAMDENNGAYHIENTAI.KQ:	
		move $a0,$s1
		move $a1,$s2
		jal SoNgayTrongThang
		lw $s1,($s0)
		add $t1,$t1,$s1
		addi $t1,$t1,-1
		move $v0,$t1
	
#Cuoi thu tuc	
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	#xoa stack
	addi $sp,$sp,24
	#tra ve
	jr $ra
#########################
NGAYHIENTAIDENCUOITHANG:#(Focus*,int thang)
	#Khai bao stack
	
	addi $sp,$sp,-28
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
	sw $s3,24($sp)
#Than thu tuc
	lw $s0,($a0)
	lw $s1,4($a0)
	lw $s2,8($a0)
	move $s3,$a1
	li $t0,0
	beq $s3,$s1,NGAYHIENTAIDENCUOITHANG.Exit
	move $a0,$s1
	move $a1,$s2
	jal SoNgayTrongThang
	sub $t0,$v0,$s0
	NGAYHIENTAIDENCUOITHANG.LAP:
		addi $s1,$s1,1
		move $a0,$s1
		move $a1,$s2
		jal SoNgayTrongThang
		add $t0,$t0,$v0
		bne $s3,$s1,NGAYHIENTAIDENCUOITHANG.LAP
#Cuoi thu tuc	
	NGAYHIENTAIDENCUOITHANG.Exit:
	move $v0,$t0
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	lw $s3,24($sp)
	#xoa stack
	addi $sp,$sp,28
	#tra ve
	jr $ra
