/* Turn the screen to black when a key is pressed */
/* Assuming Hack language. */

@KEY_PRESSED
M=0
(LOOP)
@KBD
D=M
@KBD_0
D;JEQ
D=-1
(KBD_0)
@KEY_PRESSED
D=D-M
@NO_KBD
D;JEQ

@KEY_PRESSED
M=!M
@8192
D=A 
@n
M=D 
@i 
M=0

(IN_LOOP)
@i
D=M
@n
D=D-M
@NO_KBD
D;JGE

@i
D=M
@SCREEN
A=D+A 
M=!M

@i
M=M+1
@IN_LOOP
0;JMP

// This program loops forever
(NO_KBD)
@LOOP
0;JMP