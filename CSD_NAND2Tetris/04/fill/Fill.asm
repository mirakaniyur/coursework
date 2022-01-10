// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
  @SCREEN
  D=A
  @R0
  M=D          //set R0 to first word of screen
  @R1
  M=0
  @KBD
  D=M
  @SCREENSWAP
  D;JEQ        //if no key press, screenswap with R1=16[0]
  @R1
  M=-1
  @SCREENSWAP
  0;JMP       //else, R1=16[1] for screenswap
(SCREENSWAP)
  @R1
  D=M         //D is pixel color
  @R0
  A=M         //A=address[R0] --> A=val[R0]=address[currentword]
  M=D         //change color of entire word of pixels
  @24576
  D=A
  @R0
  M=M+1       //increment R0 to next word
  D=D-M       //D=24576 - val[R0]
  @LOOP
  D;JLE       //break inner loop if current word is end of screen
  @SCREENSWAP
  0;JMP       //else continue to next word
