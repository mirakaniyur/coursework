// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Checkers.asm

// When key pressed, create checkerboard of 16x16pix with black in top left
// When no key pressed, switch checkerboard to white in top left

// Put your code here.

(LOOP)
  @SCREEN
  D=A
  @R0
  M=D // set R0 to index of first pixels
  @R1
  M=0
  @KBD
  D=M
  @SCREENSWAP
  D;JEQ     //if val[KBD] = 0, jump to screenswap while R1 = 0
  @R1
  M=-1
  @SCREENSWAP
  0;JMP     //else, change R1 to 1 before entering screenswap
(SCREENSWAP)
  @R1
  D=M       //D is 1 or 0 depending
  @R0
  A=M       //change A from index of R0 to index of pixel held in R0
  M=D       //change pixel
  @24576
  D=A       //for later
  @R0
  M=M+1     //increment R0
  D=D-M     //D=24576 - val[R0]
  @LOOP
  D;JLE     //loop if 0 ≤ 24576 - R0 == R0 ≤ 24576
  @SCREENSWAP
  0;JMP
