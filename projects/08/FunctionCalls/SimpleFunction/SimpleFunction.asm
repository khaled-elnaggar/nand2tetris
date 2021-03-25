////SP = 256
@261
D=A
@SP
M=D

////call Sys.init
@Sys.init
0; JMP

(SimpleFunction)
	//function SimpleFunction.test 2
////generate function label
(SimpleFunction.test)

////adding 2 local variables = 0
@SP
A=M
M=0
@SP
M=M+1

@SP
A=M
M=0
@SP
M=M+1


	//push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//push local 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

	//not
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
@SP
M=M+1
A=M
D=M
M=!M
@SP
M=M+1

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

	//add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1

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

