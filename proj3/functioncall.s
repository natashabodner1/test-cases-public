.file "stdin"
.text
.globl fi
.type fi, @function
fi:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$8, %rsp
	push	%rbx
	# move parameter onto the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the return expression
	# push the integer
	mov	$20, %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit the epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
.text
.globl do
.type do, @function
do:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$24, %rsp
	push	%rbx
	# move parameter onto the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$100, %rax
	push	%rax
	pop	%rax
	mov	%rax, -24(%rbp)
	# generate code for the right-hand side of the assignment
	# evaluate the parameter
	mov	-24(%rbp), %rax
	push	%rax
	# pass the parameter
	pop	%rdi
	# call the function
	call	fi
	# push the return value
	push	%rax
	pop	%rax
	mov	%rax, -16(%rbp)
	# generate code for the return expression
	mov	-16(%rbp), %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit the epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
.text
.globl go
.type go, @function
go:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$24, %rsp
	push	%rbx
	# move parameter onto the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$0, %rax
	push	%rax
	pop	%rax
	mov	%rax, -24(%rbp)
	# generate code for the right-hand side of the assignment
	# evaluate the parameter
	mov	-24(%rbp), %rax
	push	%rax
	# pass the parameter
	pop	%rdi
	# call the function
	call	do
	# push the return value
	push	%rax
	pop	%rax
	mov	%rax, -16(%rbp)
	# generate code for the return expression
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	mov	-16(%rbp), %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the subtraction
	sub	%rbx, %rax
	# push the expression result
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
	sub	$32, %rsp
	push	%rbx
	# move argc and argv from parameter registers to the stack
	mov	%rdi, -24(%rbp)
	mov	%rsi, -32(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$10, %rax
	push	%rax
	pop	%rax
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# evaluate the parameter
	mov	-8(%rbp), %rax
	push	%rax
	# pass the parameter
	pop	%rdi
	# call the function
	call	go
	# push the return value
	push	%rax
	pop	%rax
	mov	%rax, -16(%rbp)
	# generate code for the return expression
	# push the integer
	mov	$5, %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit main's epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret