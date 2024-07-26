// push constant 7
  @7
  D=A
  // UNLOAD(R13)
    @R13
    M=D
  // PUSH(R13)
    // LOAD(R13)
      @R13
      D=M
    // UNLOAD_RAM(SP)
      @SP
      A=M
      M=D
    // INCREMENT(SP)
      @SP
      M=M+1
// push constant 8
  @8
  D=A
  // UNLOAD(R13)
    @R13
    M=D
  // PUSH(R13)
    // LOAD(R13)
      @R13
      D=M
    // UNLOAD_RAM(SP)
      @SP
      A=M
      M=D
    // INCREMENT(SP)
      @SP
      M=M+1
// add
  // POP(R13)
    // DECREMENT(SP)
      @SP
      M=M-1
    // LOAD_RAM(SP)
      @SP
      A=M
      D=M
    // UNLOAD(R13)
      @R13
      M=D
  // POP(R14)
    // DECREMENT(SP)
      @SP
      M=M-1
    // LOAD_RAM(SP)
      @SP
      A=M
      D=M
    // UNLOAD(R14)
      @R14
      M=D
  // Executing command add
    @R13
    D=M
    @R14
    M=D+M
  // PUSH(R14)
    // LOAD(R14)
      @R14
      D=M
    // UNLOAD_RAM(SP)
      @SP
      A=M
      M=D
    // INCREMENT(SP)
      @SP
      M=M+1
(END)
@END
0;JMP