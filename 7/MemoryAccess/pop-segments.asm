

// push constant 10
  @10
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop local 2
  @2
  D=A
  @LCL
  D=D+M
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D


// push constant 20
  @20
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop argument 2
  @2
  D=A
  @ARG
  D=D+M
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D


// push constant 30
  @30
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop this 2
  @2
  D=A
  @THIS
  D=D+M
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D


// push constant 40
  @40
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop that 2
  @2
  D=A
  @THAT
  D=D+M
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D


// push constant 50
  @50
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop temp 2
  @2
  D=A
  @5
  D=D+A
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D


// push constant 60
  @60
  D=A
  // UNLOAD(R14)
    @R14
    M=D
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


// pop static 2
  @pop-segments.2
  D=A
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
  // LOAD(R14)
    @R14
    D=M
  // UNLOAD_RAM(R13)
    @R13
    A=M
    M=D
(END)
@END
0;JMP