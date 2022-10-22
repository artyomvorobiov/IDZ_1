	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	n # переменная int n;
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	x # переменная х;
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d"
	.align 8
.LC1:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 n \320\262 \320\277\321\200\320\276\320\274\320\265\320\266\321\203\321\202\320\272\320\265 \320\276\321\202 0 \320\264\320\276 10000"
	.text
	.globl	Scan
	.type	Scan, @function
Scan:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	lea	rax, n[rip]
	
	# ввод числа n;
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	
	mov	eax, DWORD PTR n[rip]
	# сравниваем n с 10000;
	cmp	eax, 10000
	jg	.L2
	mov	eax, DWORD PTR n[rip]
	# сравниваем c 0
	test	eax, eax
	jns	.L3
.L2:
	# Выводим надпись : "Введите n в промежутке от 0 до 10000"
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	
	# переходим на выход из функции если не удовлетворяет условиям 
	jmp	.L4
.L3:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L5
.L6:
	# ввод чисел в массив A;
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L5:
	# сравниваем n с 0
	mov	eax, DWORD PTR n[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L6
	nop
.L4:
	# выход из функции Scan
	nop
	leave
	ret
	.size	Scan, .-Scan
	.globl	Comp
	.type	Comp, @function
Comp:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	eax, DWORD PTR n[rip]
	sub	eax, 1
	mov	DWORD PTR -4[rbp], eax
	jmp	.L8
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	
	# сравнение а[i] и 0;
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L9
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR x[rip]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	mov	eax, DWORD PTR x[rip]
	add	eax, 1
	mov	DWORD PTR x[rip], eax
.L9:
	sub	DWORD PTR -4[rbp], 1
.L8:
	cmp	DWORD PTR -4[rbp], 0
	jns	.L10
	nop
	nop
	pop	rbp
	ret
	.size	Comp, .-Comp
	.section	.rodata
	.align 8
.LC2:
	.string	"\320\237\320\276\320\273\321\203\321\207\320\270\320\262\321\210\320\270\320\271\321\201\321\217 \320\274\320\260\321\201\321\201\320\270\320\262 B: "
.LC3:
	.string	"%d "
	.text
	.globl	Prin
	.type	Prin, @function
Prin:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	lea	rax, .LC2[rip]
	
	# выводим текст;
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC3[rip]
	
	# выводим элементы массива В;
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR x[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
	nop
	nop
	leave
	ret
	.size	Prin, .-Prin
	.section	.rodata
.LC4:
	.string	"Rus"
	.align 8
.LC5:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\200\320\260\320\267\320\274\320\265\321\200 \320\274\320\260\321\201\321\201\320\270\320\262\320\260 \320\220, \320\267\320\260\321\202\320\265\320\274 \321\201\320\260\320\274 \320\274\320\260\321\201\321\201\320\270\320\262:"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	lea	r11, -77824[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 2192
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC4[rip]
	mov	rsi, rax
	mov	edi, 6
	
	# setlocate для пенчатанья текста на русском языке; 
	call	setlocale@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -80016[rbp]
	mov	rdi, rax
	
	# Вызываем функцию Scan;
	call	Scan
	mov	eax, DWORD PTR n[rip]
	test	eax, eax
	js	.L15
	mov	eax, DWORD PTR n[rip]
	cmp	eax, 10000
	jg	.L15
	lea	rdx, -40016[rbp]
	lea	rax, -80016[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	
	# Вызываем функцию Comp;
	call	Comp
	lea	rax, -40016[rbp]
	mov	rdi, rax
	
	# Вызываем функцию Prin;
	call	Prin
.L15:
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
