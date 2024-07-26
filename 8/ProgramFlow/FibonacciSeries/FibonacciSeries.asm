

//File FibonacciSeries

// push argument 1
  @1
  D=A
  @ARG
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


// push constant 0
  @0
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


// pop that 0
  @0
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


// push constant 1
  @1
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


// pop that 1
  @1
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


// push argument 0
  @0
  D=A
  @ARG
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


// push constant 2
  @2
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


// pop argument 0
  @0
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


// label LOOP
  (FibonacciSeries.null$LOOP)


// push argument 0
  @0
  D=A
  @ARG
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


// if-goto COMPUTE_ELEMENT
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
  @FibonacciSeries.null$COMPUTE_ELEMENT
  D;JNE


// goto END
  @FibonacciSeries.null$END
  0;JNE


// label COMPUTE_ELEMENT
  (FibonacciSeries.null$COMPUTE_ELEMENT)


// push that 0
  @0
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


// push that 1
  @1
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


// push constant 1
  @1
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


// push argument 0
  @0
  D=A
  @ARG
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


// push constant 1
  @1
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


// pop argument 0
  @0
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


// goto LOOP
  @FibonacciSeries.null$LOOP
  0;JNE


// label END
  (FibonacciSeries.null$END)
(END)
@END
0;JMP