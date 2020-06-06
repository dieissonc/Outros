diretorios = C:\Users\dsantos\Downloads\Mapas\*.*
diretorio = C:\Users\dsantos\Downloads\Mapas\
Loop, Files, % diretorios , D
{
	FileMove,	%	diretorio	A_LoopFileName "\*.*",	%diretorio%
	if(ErrorLevel=0)
		FileRemoveDir,	%	diretorio	A_LoopFileName
	ErrorLevel	=
}
MsgBox,,, Done,	1
ExitApp