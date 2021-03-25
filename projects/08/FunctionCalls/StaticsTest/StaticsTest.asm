////SP = 256
@261
D=A
@SP
M=D

////call Sys.init
@Sys.init
0; JMP

(Class1)
	//function Class1.set 0
////generate function label
(Class1.set)

////adding 0 local variables = 0

	//push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//pop static 0
@Class1.0
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push argument 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//pop static 1
@Class1.1
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

	//return
////R13(endFrame) = LCL
@LCL
D=M
@endFrame
M=D

////R14(RET) = *(endFrame - 5)
@5
D=A
@endFrame
D=M-D
A=D
D=M
@RET
M=D

////*ARG = pop()
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D

////SP = ARG + 1
@ARG
D=M+1
@SP
M=D

////getting THAT THIS ARG LCL from the frame
@1
D=A
@endFrame
D=M-D
A=D
D=M
@THAT
M=D

@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D

@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D

@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D

////goto RET
@RET
A=M
0; JMP


	//function Class1.get 0
////generate function label
(Class1.get)

////adding 0 local variables = 0

	//push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1

	//push static 1
@Class1.1
D=M
@SP
A=M
M=D
@SP
M=M+1

	//sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

	//return
////R13(endFrame) = LCL
@LCL
D=M
@endFrame
M=D

////R14(RET) = *(endFrame - 5)
@5
D=A
@endFrame
D=M-D
A=D
D=M
@RET
M=D

////*ARG = pop()
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D

////SP = ARG + 1
@ARG
D=M+1
@SP
M=D

////getting THAT THIS ARG LCL from the frame
@1
D=A
@endFrame
D=M-D
A=D
D=M
@THAT
M=D

@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D

@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D

@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D

////goto RET
@RET
A=M
0; JMP

(Class2)
	//function Class2.set 0
////generate function label
(Class2.set)

////adding 0 local variables = 0

	//push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//pop static 0
@Class2.0
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push argument 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//pop static 1
@Class2.1
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

	//return
////R13(endFrame) = LCL
@LCL
D=M
@endFrame
M=D

////R14(RET) = *(endFrame - 5)
@5
D=A
@endFrame
D=M-D
A=D
D=M
@RET
M=D

////*ARG = pop()
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D

////SP = ARG + 1
@ARG
D=M+1
@SP
M=D

////getting THAT THIS ARG LCL from the frame
@1
D=A
@endFrame
D=M-D
A=D
D=M
@THAT
M=D

@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D

@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D

@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D

////goto RET
@RET
A=M
0; JMP


	//function Class2.get 0
////generate function label
(Class2.get)

////adding 0 local variables = 0

	//push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1

	//push static 1
@Class2.1
D=M
@SP
A=M
M=D
@SP
M=M+1

	//sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1

	//return
////R13(endFrame) = LCL
@LCL
D=M
@endFrame
M=D

////R14(RET) = *(endFrame - 5)
@5
D=A
@endFrame
D=M-D
A=D
D=M
@RET
M=D

////*ARG = pop()
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D

////SP = ARG + 1
@ARG
D=M+1
@SP
M=D

////getting THAT THIS ARG LCL from the frame
@1
D=A
@endFrame
D=M-D
A=D
D=M
@THAT
M=D

@2
D=A
@endFrame
D=M-D
A=D
D=M
@THIS
M=D

@3
D=A
@endFrame
D=M-D
A=D
D=M
@ARG
M=D

@4
D=A
@endFrame
D=M-D
A=D
D=M
@LCL
M=D

////goto RET
@RET
A=M
0; JMP

(Sys)
	//function Sys.init 0
////generate function label
(Sys.init)

////adding 0 local variables = 0

	//push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

	//push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1

	//call Class1.set 2
////push return-address, LCL, ARG, THIS, THAT
@return-address0
D=A
@SP
A=M
M=D
@SP
M=M+1

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

////ARG = SP - 7
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.set
0; JMP
(return-address0)

	//pop temp 0 
@5
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1

	//push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1

	//call Class2.set 2
////push return-address, LCL, ARG, THIS, THAT
@return-address1
D=A
@SP
A=M
M=D
@SP
M=M+1

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

////ARG = SP - 7
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.set
0; JMP
(return-address1)

	//pop temp 0 
@5
D=A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//call Class1.get 0
////push return-address, LCL, ARG, THIS, THAT
@return-address2
D=A
@SP
A=M
M=D
@SP
M=M+1

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

////ARG = SP - 5
@5
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class1.get
0; JMP
(return-address2)

	//call Class2.get 0
////push return-address, LCL, ARG, THIS, THAT
@return-address3
D=A
@SP
A=M
M=D
@SP
M=M+1

@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1

@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1

@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1

////ARG = SP - 5
@5
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Class2.get
0; JMP
(return-address3)

	//label WHILE
(WHILE)

	//goto WHILE
@WHILE
0; JMP
