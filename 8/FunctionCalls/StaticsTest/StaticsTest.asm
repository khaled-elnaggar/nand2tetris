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


//File Class1

// function Class1.set 0
  (Class1.set)


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


// pop static 0
  @Class1.0
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


// pop static 1
  @Class1.1
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


// function Class1.get 0
  (Class1.get)


// push static 0
  @Class1.0
  D=A
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


// push static 1
  @Class1.1
  D=A
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


//File Class2

// function Class2.set 0
  (Class2.set)


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


// pop static 0
  @Class2.0
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


// pop static 1
  @Class2.1
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


// function Class2.get 0
  (Class2.get)


// push static 0
  @Class2.0
  D=A
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


// push static 1
  @Class2.1
  D=A
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


//File Sys

// function Sys.init 0
  (Sys.init)


// push constant 6
  @6
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


// push constant 8
  @8
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


// call Class1.set 2
  // push file.function$ret.i 
    @Sys.Class1.set$ret.2
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
    @7
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
    @Class1.set
    0;JMP
    (Sys.Class1.set$ret.2)


// pop temp 0
  @0
  D=A
  @5
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


// push constant 23
  @23
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


// push constant 15
  @15
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


// call Class2.set 2
  // push file.function$ret.i 
    @Sys.Class2.set$ret.3
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
    @7
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
    @Class2.set
    0;JMP
    (Sys.Class2.set$ret.3)


// pop temp 0
  @0
  D=A
  @5
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


// call Class1.get 0
  // push file.function$ret.i 
    @Sys.Class1.get$ret.4
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
    @Class1.get
    0;JMP
    (Sys.Class1.get$ret.4)


// call Class2.get 0
  // push file.function$ret.i 
    @Sys.Class2.get$ret.5
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
    @Class2.get
    0;JMP
    (Sys.Class2.get$ret.5)


// label END
  (Sys.Sys.init$END)


// goto END
  @Sys.Sys.init$END
  0;JMP
