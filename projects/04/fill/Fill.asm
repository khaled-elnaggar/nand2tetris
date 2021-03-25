// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite PLOOP that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@8191
D=A
@n
M=D			//The number of words in the screen memory chunk

(START)
@i
M=0			//setting i to 0 before iterating
@SCREEN
D=A
@addr
M=D			//setting addr to screen before iterating

@KBD
D=M
@PLOOP
D; JGT			// if (D > 0) { PLOOP }

(NLOOP)
@i
D=M
@n
D=D-M
@START
D; JGT
@addr
A=M
M=0
@addr
M=M+1
@i
M=M+1
@NLOOP
0; JMP


(PLOOP)
@i
D=M
@n
D=D-M
@START
D; JGT
@addr
A=M
M=-1
@addr
M=M+1
@i
M=M+1
@PLOOP
0; JMP
