.file "stdin"
.text
.globl fizzbuzz
.type fizzbuzz, @function
fizzbuzz:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$32, %rsp
	push	%rbx
	# move parameter onto the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$1, %rax
	push	%rax
	pop	%rax
	mov	%rax, -16(%rbp)
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$0, %rax
	push	%rax
	pop	%rax
	mov	%rax, -24(%rbp)
	# generate code for the return expression
	mov	-32(%rbp), %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit the epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
.text
.globl main
.type main, @function
main:
	# stack space for argc and argv
	# emit main's prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$48, %rsp
	push	%rbx
	# move argc and argv from parameter registers to the stack
	mov	%rdi, -40(%rbp)
	mov	%rsi, -48(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$2, %rax
	push	%rax
	pop	%rax
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$5, %rax
	push	%rax
	pop	%rax
	mov	%rax, -16(%rbp)
	# generate code for the right-hand side of the assignment
	# copy the base pointer to another register
	mov	%rbp, %rax
	# subtract the offset from the copy of the base pointer
	sub	$16, %rax
	# push the expression result
	push	%rax
	pop	%rax
	mov	%rax, -24(%rbp)
	# generate code for the deref on the left side of an expression
	mov	-24(%rbp), %rax
	push	%rax
	# generate code for the right-hand side of the assignment
	# evaluate the parameter
	# push the integer
	mov	$25, %rax
	push	%rax
	# pass the parameter
	pop	%rdi
	# call the function
	call	fizzbuzz
	# push the return value
	push	%rax
	# pop the result of the right-hand side
	pop	%rax
	# pop the result of the left-hand side
	pop	%rbx
	# move the right-hand side's value into the address pointed to by the left-hand size
	mov	%rax, (%rbx)
	# generate code for the right-hand side of the assignment
	# evaluate the parameter
	# push the integer
	mov	$42, %rax
	push	%rax
	# pass the parameter
	pop	%rdi
	# call the function
	call	fizzbuzz
	# push the return value
	push	%rax
	pop	%rax
	mov	%rax, -32(%rbp)
	# generate code for the right-hand side of the assignment
	# generate code for the unary operand
	mov	-24(%rbp), %rax
	push	%rax
	# pop the unary operand
	pop	%rax
	# move the contents of the address to the result register
	mov	(%rax), %rbx
	# push the expression result
	push	%rbx
	pop	%rax
	mov	%rax, -32(%rbp)
	# generate code for the return expression
	# push the integer
	mov	$100, %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit main's epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret