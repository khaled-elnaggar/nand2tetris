

// push constant 3030
  @3030
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


// pop pointer 0
  @0
  D=A
  @THIS
  AD=D+A
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


// push constant 3040
  @3040
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


// pop pointer 1
  @1
  D=A
  @THIS
  AD=D+A
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


// push constant 32
  @32
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


// push constant 46
  @46
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


// pop that 6
  @6
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


// push pointer 0
  @0
  D=A
  @THIS
  AD=D+A
  D=M
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


// push pointer 1
  @1
  D=A
  @THIS
  AD=D+A
  D=M
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


// push this 2
  @2
  D=A
  @THIS
  D=D+M
  // UNLOAD(R13)
    @R13
    M=D
  // LOAD_RAM(R13)
    @R13
    A=M
    D=M
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


// sub
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
  // Executing command sub
    @R13
    D=M
    @R14
    M=M-D
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


// push that 6
  @6
  D=A
  @THAT
  D=D+M
  // UNLOAD(R13)
    @R13
    M=D
  // LOAD_RAM(R13)
    @R13
    A=M
    D=M
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