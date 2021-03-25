////SP = 256
@261
D=A
@SP
M=D

////call Sys.init
@Sys.init
0; JMP

(Main)
	//function Main.fibonacci 0
////generate function label
(Main.fibonacci)

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

	//push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

	//lt                     
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@TRUE0
D; JLT
@SP
A=M
M=0
@END0
0; JMP
(TRUE0)
@SP
A=M
M=-1
(END0)
@SP
M=M+1

	//if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@IF_TRUE
D; JNE

	//goto IF_FALSE
@IF_FALSE
0; JMP

	//label IF_TRUE          
(IF_TRUE)

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


	//label IF_FALSE         
(IF_FALSE)

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

	//push constant 2
@2
D=A
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

	//call Main.fibonacci 1  
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
@Main.fibonacci
0; JMP
(return-address0)

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

	//push constant 1
@1
D=A
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

	//call Main.fibonacci 1  
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
@Main.fibonacci
0; JMP
(return-address1)

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

(Sys)
	//function Sys.init 0
////generate function label
(Sys.init)

////adding 0 local variables = 0

	//push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

	//call Main.fibonacci 1   
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
@Main.fibonacci
0; JMP
(return-address2)

	//label WHILE
(WHILE)

	//goto WHILE              
@WHILE
0; JMP
