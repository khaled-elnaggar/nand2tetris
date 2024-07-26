// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

@R2
M=0

@R1
D=M
@R0
D=M-D;    	//R0 - R1
@R0_IS_GREATER
D;JGT

@R1
D=M
@bigger
M=D

@R0
D=M
@smaller
M=D

@LOOP
0;JMP

(R0_IS_GREATER)
@R0
D=M
@bigger
M=D

@R1
D=M
@smaller
M=D

(LOOP)
@smaller
D=M

@END
D;JEQ

@bigger
D=M

@R2
M=M+D

@smaller
M=M-1

@LOOP
0;JMP

(END)
@END
0;JMP
