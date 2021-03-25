////SP = 256
@261
D=A
@SP
M=D

////call Sys.init
@Sys.init
0; JMP

(Sys)
	//function Sys.init 0
////generate function label
(Sys.init)

////adding 0 local variables = 0

	//push constant 4000 
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 0
@3
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

	//push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 1
@4
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

	//call Sys.main 0
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
@Sys.main
0; JMP
(return-address0)

	//pop temp 1
@6
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

	//label LOOP
(LOOP)

	//goto LOOP
@LOOP
0; JMP

	//function Sys.main 5
////generate function label
(Sys.main)

////adding 5 local variables = 0
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

@SP
A=M
M=0
@SP
M=M+1


	//push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 0
@3
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

	//push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 1
@4
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

	//push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

	//push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1

	//call Sys.add12 1
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

////ARG = SP - 6
@6
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.add12
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

	//push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

	//push local 4
@LCL
D=M
@4
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


	//function Sys.add12 0
////generate function label
(Sys.add12)

////adding 0 local variables = 0

	//push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 0
@3
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

	//push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1

	//pop pointer 1
@4
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

	//push constant 12
@12
D=A
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

