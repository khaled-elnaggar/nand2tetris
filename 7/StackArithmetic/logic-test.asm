

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


// lt
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
  // Executing command lt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @13014_R14_MATCH
    D;JLT
    @R14
    M=0
    @13014_END_IF
    0;JMP
    (13014_R14_MATCH)
    @R14
    M=-1
    (13014_END_IF)
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


// lt
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
  // Executing command lt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @15931_R14_MATCH
    D;JLT
    @R14
    M=0
    @15931_END_IF
    0;JMP
    (15931_R14_MATCH)
    @R14
    M=-1
    (15931_END_IF)
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


// lt
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
  // Executing command lt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @5854_R14_MATCH
    D;JLT
    @R14
    M=0
    @5854_END_IF
    0;JMP
    (5854_R14_MATCH)
    @R14
    M=-1
    (5854_END_IF)
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


// push constant 17
  @17
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


// push constant 17
  @17
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


// eq
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
  // Executing command eq
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @17039_R14_MATCH
    D;JEQ
    @R14
    M=0
    @17039_END_IF
    0;JMP
    (17039_R14_MATCH)
    @R14
    M=-1
    (17039_END_IF)
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


// push constant 17
  @17
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


// push constant 16
  @16
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


// eq
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
  // Executing command eq
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @29913_R14_MATCH
    D;JEQ
    @R14
    M=0
    @29913_END_IF
    0;JMP
    (29913_R14_MATCH)
    @R14
    M=-1
    (29913_END_IF)
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


// push constant 16
  @16
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


// push constant 17
  @17
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


// eq
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
  // Executing command eq
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @5411_R14_MATCH
    D;JEQ
    @R14
    M=0
    @5411_END_IF
    0;JMP
    (5411_R14_MATCH)
    @R14
    M=-1
    (5411_END_IF)
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


// push constant 892
  @892
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


// push constant 891
  @891
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


// gt
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
  // Executing command gt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @11566_R14_MATCH
    D;JGT
    @R14
    M=0
    @11566_END_IF
    0;JMP
    (11566_R14_MATCH)
    @R14
    M=-1
    (11566_END_IF)
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


// push constant 891
  @891
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


// push constant 892
  @892
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


// gt
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
  // Executing command gt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @1392_R14_MATCH
    D;JGT
    @R14
    M=0
    @1392_END_IF
    0;JMP
    (1392_R14_MATCH)
    @R14
    M=-1
    (1392_END_IF)
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


// push constant 891
  @891
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


// push constant 891
  @891
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


// gt
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
  // Executing command gt
    // Executing command sub
      @R13
      D=M
      @R14
      M=M-D
    @R14
    D=M
    @11276_R14_MATCH
    D;JGT
    @R14
    M=0
    @11276_END_IF
    0;JMP
    (11276_R14_MATCH)
    @R14
    M=-1
    (11276_END_IF)
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