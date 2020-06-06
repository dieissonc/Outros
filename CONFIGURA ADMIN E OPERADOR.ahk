^1::
WinWait, Configuração Usuários
WinActivate, Configuração Usuários
Sleep, 250
Click, 150, 361 Left
Click, 340, 267 Left, Down
Click, 188, 255 Left, Up
Send, {LShift Down}{@}{LShift Up}{d}{m}{1}{n}{Tab}{LShift Down}{@}{LShift Up}{d}{m}{1}{n}	;Senha admin
Click, 443, 319 Left
WinWaitActive,	Mensagem
Send, {Enter}

Click, 343, 191 Left
Sleep, 10
Send, {Down}{Tab}{Tab}{Tab}{s}{e}{v}{e}{n}{t}{h}{Tab}{s}{e}{v}{e}{n}{t}{h}	;Senha operador
Click, 444, 322 Left
Sleep, 10
WinWaitActive,	Mensagem
Send, {Enter}
Sleep	10
Send, {LShift Down}{Tab}{Tab}{Tab}{Tab}{LShift Up}{Down}{Tab}{Tab}{Tab}{s}{e}{v}{e}{n}{t}{h}{Tab}{s}{e}{v}{e}{n}{t}{h}	;	Senha convidado
Click, 439, 324 Left
WinWaitActive,	Mensagem
Send, {Enter}

Click, 194, 352 Left
Sleep	10
Click, 118, 101 Left
Sleep	10
Send, {Down}{Enter}
Sleep	10
Click, 43, 150 Left
Send, {Down}{Space}{Down}{Space}{Down}{Down}{Space}{Down}{Space}{Down}{Space}{Down}{Space}{Down}{Down}{Down}{Space}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Space}{Down}{Space}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Down}{Down}{Space}	;permissão acesso
Click, 226, 356 Left
Sleep	10
Click, 61, 134 Left
Send, {Space}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Down}{Down}{Space}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Space}{Down}{Down}{Space}	;	permissão configurações
Click, 485, 12 Left
return