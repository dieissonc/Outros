Class	Registros	{
	exporta(periodo)				{
		if(periodo="dia")		{
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Forms							%repositorio%registros\Dia\%A_IPAddress1%\Forms.reg /y"							, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Layouts						%repositorio%registros\Dia\%A_IPAddress1%\Layouts.reg /y"							, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Servidores					%repositorio%registros\Dia\%A_IPAddress1%\Servidores.reg /y"					, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Sistemas						%repositorio%registros\Dia\%A_IPAddress1%\Sistemas.reg /y"						, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\SmtpClient					%repositorio%registros\Dia\%A_IPAddress1%\SmtpClient.reg /y"					, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\WorkspaceManager	%repositorio%registros\Dia\%A_IPAddress1%\WorkspaceManager.reg /y"		, , Hide
		}
		if(periodo="noite")	{
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Forms							%repositorio%registros\Noite\%A_IPAddress1%\Forms.reg /y"						, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Layouts						%repositorio%registros\Noite\%A_IPAddress1%\Layouts.reg /y"						, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Servidores					%repositorio%registros\Noite\%A_IPAddress1%\Servidores.reg /y"					, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Sistemas						%repositorio%registros\Noite\%A_IPAddress1%\Sistemas.reg /y"					, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\SmtpClient					%repositorio%registros\Noite\%A_IPAddress1%\SmtpClient.reg /y"				, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\WorkspaceManager	%repositorio%registros\Noite\%A_IPAddress1%\WorkspaceManager.reg /y"	, , Hide
		}
		if(periodo="todas")	{
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Forms							%repositorio%registros\Todas\%A_IPAddress1%\Forms.reg /y"						, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Layouts						%repositorio%registros\Todas\%A_IPAddress1%\Layouts.reg /y"						, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Servidores					%repositorio%registros\Todas\%A_IPAddress1%\Servidores.reg /y"				, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\Sistemas						%repositorio%registros\Todas\%A_IPAddress1%\Sistemas.reg /y"					, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\SmtpClient					%repositorio%registros\Todas\%A_IPAddress1%\SmtpClient.reg /y"				, , Hide
			run,	cmd.exe /c "reg export HKCU\Software\Seventh\DGuardCenter\WorkspaceManager	%repositorio%registros\Todas\%A_IPAddress1%\WorkspaceManager.reg /y"	, , Hide
		}
	}
	copiaRegistros(periodo)	{
		MsgBox % ip4
		FileDelete,			%A_MyDocuments%\*.reg
		if(periodo="dia")		{
		FileCopyDir,		%repositorio%registros\padrão,																		%A_MyDocuments%,	1
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\Forms.reg,							%A_MyDocuments%\Forms.reg
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\Layouts.reg,						%A_MyDocuments%\Layouts.reg
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\Servidores.reg,					%A_MyDocuments%\Servidores.reg
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\Sistemas.reg,						%A_MyDocuments%\Sistemas.reg
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\SmtpClient.reg,					%A_MyDocuments%\SmtpClient.reg
		FileCopy,			%repositorio%registros\Dia\%A_IPAddress1%\WorkspaceManager.reg,	%A_MyDocuments%\WorkspaceManager.reg
		}
		if(periodo="noite")	{
		FileCopyDir,		%repositorio%registros\padrão,																			%A_MyDocuments%,	1
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\Forms.reg,							%A_MyDocuments%\Forms.reg
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\Layouts.reg,						%A_MyDocuments%\Layouts.reg
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\Servidores.reg,					%A_MyDocuments%\Servidores.reg
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\Sistemas.reg,						%A_MyDocuments%\Sistemas.reg
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\SmtpClient.reg,					%A_MyDocuments%\SmtpClient.reg
		FileCopy,			%repositorio%registros\Noite\%A_IPAddress1%\WorkspaceManager.reg,	%A_MyDocuments%\WorkspaceManager.reg
		}
		if(periodo="todas")	{
		FileCopyDir,		%repositorio%registros\padrão,																			%A_MyDocuments%,	1
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\Forms.reg,							%A_MyDocuments%\Forms.reg
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\Layouts.reg,						%A_MyDocuments%\Layouts.reg
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\Servidores.reg,					%A_MyDocuments%\Servidores.reg
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\Sistemas.reg,						%A_MyDocuments%\Sistemas.reg
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\SmtpClient.reg,					%A_MyDocuments%\SmtpClient.reg
		FileCopy,			%repositorio%registros\Todas\%A_IPAddress1%\WorkspaceManager.reg,	%A_MyDocuments%\WorkspaceManager.reg
		}
		Registros.importa()
		FileRemoveDir,	C:\Seventh\DGuardCenter\Dados\Servidores,	1
		FileDelete,			%A_MyDocuments%\*.reg
		Send,					{LCtrl Up}
	}  
	importa()							{
		Finaliza.dguard()
		Registros.deleta()
		Loop, %A_MyDocuments%\*.reg
			Run,			cmd.exe /c "reg import %A_MyDocuments%\%A_LoopFileName%", , Hide
	}
	deleta()								{
		RegDelete,			HKEY_CURRENT_USER\Software\Seventh\DGuardCenter
	}
	automatico(hora)				{
		MsgBox por fazer
	}
}
Class	Comandos	{	;	POR	FAZER
}
Class	Executa		{
	dguard()	{
		Run,					C:\Seventh\DGuardCenter\DGuard.exe
}
}
Class	Finaliza		{
	dguard()	{
		Process,				Close,	WatchdogServices.exe
		Process,				Close,	Watchdog.exe
		Process,				Close,	DGuard.exe
		Process,				Close,	Player.exe
	}
}
Class	Servidor		{
	autoRestauro()	{
		server01	=	192.9.100.182
		server02	=	192.9.100.183
		Loop
		{
			s1 =
			s2 =
			Sleep,	60000
			RunWait,		%comspec% /c ipconfig /flushdns,,hide
			RunWait,		%comspec% /c for /f "skip=4 usebackq tokens=2" `%a in (``nslookup vdm01``) do echo `%a > %A_MyDocuments%\dns1.txt,,hide
			RunWait,		%comspec% /c for /f "skip=4 usebackq tokens=2" `%a in (``nslookup vdm02``) do echo `%a > %A_MyDocuments%\dns2.txt,,hide
			FileRead,		s1a, %A_MyDocuments%\dns1.txt
			FileReadLine,	s1, %A_MyDocuments%\dns1.txt, 1
			FileRead,		s2a, %A_MyDocuments%\dns2.txt
			FileReadLine,	s2, %A_MyDocuments%\dns2.txt, 1
			s1	:=	StrReplace(s1,A_Space)
			s2	:=	StrReplace(s2,A_Space)
			s1x	:=	strReplace(s1,".")
			s2x	:=	strReplace(s2,".")
			if	s1x	is	not	number
				return
			if	s2x	is	not	number
				return
			If(StrLen(s1)=0)
				s1	:=	server01
			If(StrLen(s2)=0)
				s2	:=	server02
			FileDelete,		%A_MyDocuments%\dns1.txt
			FileDelete,		%A_MyDocuments%\dns2.txt
			if(A_Index=1)	{
				if(s1="192.9.100.186")	{
					server01	=	192.9.100.186
					troca	=	1
				}
				else	if(s2="192.9.100.186")	{
					server02	=	192.9.100.186
					troca	=	1
				}
				else
					troca	=	0
			}
			FormatTime,	 hora,	A_Now,	yyyy/MM/dd HH:mm:ss
			if(s1!=server01)	{
				troca :=	!troca
				FileAppend,%	A_IPAddress1 "|"	server01 "|"	s1 "|"	troca "|"	hora "|"	s1a "|"	s2a "`n",\\fs\Departamentos\monitoramento\Monitoramento\Dieisson\Logs\SM - Troca servidor.csv
				if(troca=1)
					server01	=	192.9.100.186
				else
					server01	=	192.9.100.182
				Process,			Close,	WatchdogServices.exe
				Process,			Close,	Watchdog.exe
				Process,			Close,	DGuard.exe
				Process,			Close,	Player.exe
				Run,				C:\Seventh\DGuardCenter\DGuard.exe
			}
			if(s2!=server02)	{
				troca :=	!troca
				FileAppend,%	A_IPAddress1 "|"	server02 "|"	s2 "|"	troca "|"	hora "|"	s1a "|"	s2a "`n",\\fs\Departamentos\monitoramento\Monitoramento\Dieisson\Logs\SM - Troca servidor.csv
				if(troca=1)
					server02	=	192.9.100.186
				else
					server02	=	192.9.100.183
				Process,			Close,	WatchdogServices.exe
				Process,			Close,	Watchdog.exe
				Process,			Close,	DGuard.exe
				Process,			Close,	Player.exe
				Run,				C:\Seventh\DGuardCenter\DGuard.exe
			}
		}
	}
}
Class	Arquivos		{	;	POR	FAZER
	copiar()	{
	}
	deletar()	{
	}
}