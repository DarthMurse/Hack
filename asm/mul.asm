/* The Hack language for R2 = R1 * R0 */

// Assume data is already stored in R0 and R1.
@i
M=0

@R2
M=0

(LOOP)
@i
D=M
@R1
D=D-M
@END
D;JGE

@R2
D=M
@R0
D=D+M
@R2
M=D 
@i
M=M+1
@LOOP
0;JMP

(END)
@END 
0;JMP