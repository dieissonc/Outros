which	=	161
global	which
SetTimer,	label,	500
Loop	20
{
	ht		=	Http://
	login	=	admin:@dm1n@
	url		=	%ht%192.9.100.%which%/servidor.cgi
	HttpGet(url)
	which++
}
return

HttpGet(URL)	{
	responseText	=
	static req := ComObjCreate("MSXML2.XMLHTTP.6.0")
	req.open("GET", URL, false)
	req.SetRequestHeader("Authorization", "Basic YWRtaW46QGRtMW4=")
	req.SetRequestHeader("If-Modified-Since", "Sat, 1 Jan 2000 00:00:00 GMT")
		req.send()
	FileAppend,	%	req.responseText	" - " which "`n",	%A_ScriptDir%\versões.txt
}

ExitApp

label:
IfWinActive,	Segurança do Windows
	Send,	admin{Tab}Seventh{Tab}{Tab}{Enter}
return

END::
ExitApp