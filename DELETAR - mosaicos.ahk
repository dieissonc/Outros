SetBatchLines, -1
Loop
{
	IfWinActive, Configuração Mosaicos	;{
	{
	if(mdone=1)
		continue
	mdone=1
	Click, 29, 404 Left
	Click, 214, 550 Left, Down
	Click, 97, 549 Left, Up
	Send, {Numpad4}
	Click, 305, 547 Left
		Click, 36, 372 Left
	Click, 208, 548 Left, Down
	Click, 105, 547 Left, Up
	Send, {Numpad4}
	Click, 331, 242 Left, Down
	Click, 432, 348 Left, Up
		Click, 305, 547 Left
	Click, 33, 334 Left
	Click, 142, 118 Left
	Click, 104, 70 Left, Down
	Click, 343, 263 Left, Up
	Click, 449, 242 Left, Down
	Click, 651, 101 Left, Up
	Click, 623, 330 Left, Down
	Click, 541, 427 Left, Up
	Click, 448, 417 Left, Down
	Click, 300, 339 Left, Up
	Click, 240, 332 Left, Down
	Click, 123, 432 Left, Up
		Click, 305, 547 Left
	Click, 27, 293 Left
	Click, 150, 122 Left, Down
	Click, 318, 237 Left, Up
	Click, 455, 220 Left, Down
	Click, 647, 111 Left, Up
		Click, 305, 547 Left
	Click, 26, 259 Left
	Click, 208, 548 Left, Down
	Click, 105, 547 Left, Up
	Send, {Numpad3}
		Click, 305, 547 Left
	Click, 28, 218 Left
	Click, 254, 366 Left
	Click, 181, 178 Left
	Click, 128, 90 Left, Down
	Click, 497, 340 Left, Up
		Click, 305, 547 Left
	Click, 34, 181 Left
	Click, 293, 218 Left
	Click, 172, 119 Left, Down
	Click, 349, 242 Left, Up
	Click, 435, 242 Left, Down
	Click, 637, 122 Left, Up
	Click, 294, 348 Left, Down
	Click, 142, 511 Left, Up
		Click, 305, 547 Left
	Click, 24, 139 Left
	Click, 208, 548 Left, Down
	Click, 105, 547 Left, Up
	Send, {Numpad3}
	Click, 197, 110 Left, Down
	Click, 392, 311 Left, Up
		Click, 305, 547 Left
	;~ Click, 692, 13 Left
	}	;}

	IfWinActive, Configuração Legendas	;{
	{
	if(ldone=1)
		continue
	ldone=1
	Click, 31, 98 Left
	Send, {Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Space}{Tab}{Space}{Tab}{Tab}{Tab}{Down}{Tab}{Tab}{Tab}{Tab}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Tab}{Down}{Tab}{Down}{Up}{Up}{Up}{Up}
	;~ Click, 401, 290 Left
	}	;}
	IfWinActive, Configuração de Aparência	;{
	{
	if(adone=1)
		continue
	adone=1
		Click, 252, 68 Left
		Click, 34, 115 Left,
		Click, 268, 509 Left
	}	;}
	IfWinActive, Configuração Discos	;{
	{
	if(ddone=1)
		continue
	ddone=1
	Send, {Down}
	Click, 38, 124 Left
	Send, {Up}
	Click, 38, 124 Left
	}	;}
}
	
END::
ExitApp