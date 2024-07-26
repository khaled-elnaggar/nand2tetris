// bootstrapping code
@256
D=A
@SP
M=D


// call Sys.init 0
  // push file.function$ret.i 
    @null.Sys.init$ret.1
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
  // push LCL,ARG,THIS,THAT 
    // PUSH(LCL)
      // LOAD(LCL)
        @LCL
        D=M
      // UNLOAD_RAM(SP)
        @SP
        A=M
        M=D
      // INCREMENT(SP)
        @SP
        M=M+1
    // PUSH(ARG)
      // LOAD(ARG)
        @ARG
        D=M
      // UNLOAD_RAM(SP)
        @SP
        A=M
        M=D
      // INCREMENT(SP)
        @SP
        M=M+1
    // PUSH(THIS)
      // LOAD(THIS)
        @THIS
        D=M
      // UNLOAD_RAM(SP)
        @SP
        A=M
        M=D
      // INCREMENT(SP)
        @SP
        M=M+1
    // PUSH(THAT)
      // LOAD(THAT)
        @THAT
        D=M
      // UNLOAD_RAM(SP)
        @SP
        A=M
        M=D
      // INCREMENT(SP)
        @SP
        M=M+1
  // ARG = SP-5-nArgs 
    @5
    D=A
    @SP
    D=M-D
    // UNLOAD(ARG)
      @ARG
      M=D
  // LCL = SP 
    // LOAD(SP)
      @SP
      D=M
    // UNLOAD(LCL)
      @LCL
      M=D
  // goto fileName.functionName 
    @Sys.init
    0;JMP
    (null.Sys.init$ret.1)


//File SimpleFunction

// function SimpleFunction.test 2
  (SimpleFunction.test)
  // For the next part going to initialize local vars to zero


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


// pop local 0
  @0
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


// pop local 1
  @1
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


// push local 0
  @0
  D=A
  @LCL
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


// push local 1
  @1
  D=A
  @LCL
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


// not
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
  // Executing command not
    @R13
    D=M
    @R14
    M=!D
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


// return
  // frame (R15) = LCL
    // LOAD(LCL)
      @LCL
      D=M
    // UNLOAD(R15)
      @R15
      M=D
  // retAdd (R14) = *(frame - 5)
    @5
    D=A
    @R15
    A=M-D
    D=M
    // UNLOAD(R14)
      @R14
      M=D
  // *ARG=pop()
    // DECREMENT(SP)
      @SP
      M=M-1
    // LOAD_RAM(SP)
      @SP
      A=M
      D=M
    // UNLOAD_RAM(ARG)
      @ARG
      A=M
      M=D
  // SP=ARG+1
    @ARG
    D=M+1
    // UNLOAD(SP)
      @SP
      M=D
  // THAT=*(frame-1); THIS=*(frame-2); ARG=*(frame-3); LCL=*(frame-4)
    // DECREMENT(R15)
      @R15
      M=M-1
    // LOAD_RAM(R15)
      @R15
      A=M
      D=M
    // UNLOAD(THAT)
      @THAT
      M=D
    // DECREMENT(R15)
      @R15
      M=M-1
    // LOAD_RAM(R15)
      @R15
      A=M
      D=M
    // UNLOAD(THIS)
      @THIS
      M=D
    // DECREMENT(R15)
      @R15
      M=M-1
    // LOAD_RAM(R15)
      @R15
      A=M
      D=M
    // UNLOAD(ARG)
      @ARG
      M=D
    // DECREMENT(R15)
      @R15
      M=M-1
    // LOAD_RAM(R15)
      @R15
      A=M
      D=M
    // UNLOAD(LCL)
      @LCL
      M=D
 // goto retAddr(R14)
    @R14
    A=M
    0;JMP
