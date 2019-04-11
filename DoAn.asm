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
Opt7: .asciiz"7. Khoang cah giua hai thoi gian\n"
Opt8: .asciiz"8. Hai nam nhuan gan nhat\n"
Opt9: .asciiz"9. Nhan du lieu tu input.txt va xuat ra output.txt\n"
Opt10: .asciiz"Else. Thoat"
Opt: .asciiz"\n\n----------------------------------------------------\n\n"
Chose: .asciiz"Lua chon: "
Result: .asciiz"Ket qua:  "
LineDown:.asciiz"\n\n"
Time: .space 12
Focus: .space 20
Format: .space 20
.text
#truyen tham so cho ham NHAPTIME

la $a0,Time
jal NHAPTIME	
XUATMENU:
	#luu gia tri mang
	
	li $v0,4
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
	li $v0,5 # nhap lua chon
	syscall
	move $t0,$v0
	##khoi tao tham chieu
	la $a0,Time
	la $a1,Focus
	la $a2,Format
	beq $t0,1,XULI1
	#thoat
	li $v0,10
	syscall
#################
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
		#jal CHECK #kiem tra ngay co hop le
#Cuoi thu tuc
	#Restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	sw $s1,8($sp)
	#xoa stack
	addi $sp,$sp,12
	jr $ra

 XULI1:
 	#Khai bao stack
	addi $sp,$sp,-8
	sw $ra,($sp)
	sw $s0,($sp)
	move $s0,$a0
	li $v0,4
	la $a0,Result
	syscall
	li $v0,4
	move $a0,$s0
	syscall
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,($sp)
	#xoa stack
	addi $sp,$sp,8
	#tra ve
	# jr $ra
	j XUATMENU
	



	
	

