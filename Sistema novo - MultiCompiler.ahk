compile_app	=	"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
icondir			=	\\fs\Departamentos\monitoramento\Monitoramento\Dieisson\SMK\ico
Loop	Files,	C:\Users\dsantos\Desktop\AHK\teste compiler\*.ahk
{
	If(InStr(A_LoopFileFullPath,"#")>0)	{
		name	:=	StrReplace(A_LoopFileFullPath,".ahk",".exe")
		ToolTip	%	A_Index
		gosub	CompileFile
	}
	else
		;~ MsgBox no %A_LoopFileFullPath%
		continue
}
return

; ==============================================

CompileFile:
		runme	=	%compile_app% /in "%A_LoopFileFullPath%" /out "%name%"  /mpress 1
		RunWait	%runme%
	return