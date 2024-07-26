// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
(START)
@KBD
D=M
@key
M=D
@old_key
D=M
@key
D=D-M
@START
D;JEQ

@counter
M=0

@key
D=M
@PRESSED
D;JNE
@value
M=0
@LOOP
0;JMP
(PRESSED)
@value
M=-1

(LOOP)
@8192        //how many lines to draw
D=A
@counter
D=D-M
@END
D;JEQ

@SCREEN
D=A
@counter
D=M+D
@screen_location
M=D
@value
D=M
@screen_location
A=M
M=D
@counter
M=M+1
@LOOP
0;JMP

(END)
@key
D=M
@old_key
M=D
@START
0;JMP
