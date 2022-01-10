// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

(BEGIN)
  @R2     // will be a running product
  M=0
          //CASE 1: R1>R0
  @R0
  D=M
  @R3
  M=D     //set counter to val[R0] :^)
  @R1
  D=M
  @R4     //set add amount to val[R1]
  M=D
          //INTERLUDE: IF STATEMENT
  @R0
  D=D-M   //D=val[R1]-val[R0]
  @LOOP
  D;JLE
          //CASE 2: R0≥R1
  @R1
  D=M
  @R3
  M=D     //set counter to val[R1]
  @R0
  D=M
  @R4
  M=D     //set add amt to val[R0]

(LOOP)
  @R3
  D=M
  @END    //if counter at 0, end
  D;JLE   //at start of loop bc R3:R0->0 would be R0+1 reps
  @R4
  D=M
  @R2
  M=D+M   //add R1 to running product in R2 each iteration
  @R3
  M=M-1   //decrement counter
  @LOOP
  0;JMP   //iterate
(END)
  0;JMP
