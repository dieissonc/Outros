global cliptext
global istest
global ison
global con
global ora
global nomeSensor
global nrSensor
global forReplace
GeraLog(debug)	{
	if(debug=1)
		OutputDebug,	%	debug		
}
Ping(addresses) {
	;~ MsgBox % Ping("192.9.100.182")[1].1	;forma de uso
	rVal := []
	Loop, Parse, addresses, % A_Space
		addr .= addr ? A_Space "or Address = '" A_LoopField "'" : "Address = '" A_LoopField "'"
	colPings := ComObjGet( "winmgmts:" ).ExecQuery("Select * From Win32_PingStatus where " addr "")._NewEnum
	While colPings[objStatus]
		rVal.Push( [((oS:=(objStatus.StatusCode="" or objStatus.StatusCode<>0)) ? "0" : "1" ), objStatus.Address] )
	Return rVal
}

AutoComplete(ctrl) {
	static lf = "`n"
	If GetKeyState("Delete") or GetKeyState("Backspace")
	Return
	SetControlDelay, -1
	SetWinDelay, -1
	GuiControlGet, h, Hwnd, %ctrl%
	ControlGet, haystack, List, , , ahk_id %h%
	GuiControlGet, needle, , %ctrl%
	StringMid, text, haystack, pos := InStr(lf . haystack, lf . needle)
	, InStr(haystack . lf, lf, false, pos) - pos
	If text !=
	{
	ControlSetText, , %text%, ahk_id %h%
	ControlSend, , % "{Right " . StrLen(needle) . "}+^{End}", ahk_id %h%
	}
}
@@(ByRef	texto@,	ByRef	forReplace)	{
	StringReplace	texto@,	texto@,	@,	@,	UseErrorLevel
	Loop,	%	ErrorLevel/2
	{
	if(InStr(texto@,"@")   <>  0)  {
		pos1 :=  InStr(texto@,"@",,,1)																	;	posiÁ„o primeiro @
		pos2 :=  InStr(texto@,"@",,,2)																	;	posiÁ„o segundo @
		zona   :=   StrReplace(RTrim(SubStr(texto@,pos1,pos2-pos1)),"@")	;	n˙mero da zona
		q6@    :=  "@" zona "@"																			;	vari·vel para busca e replace
		if(StrLen(zona)=1)																						;{	se for apenas 1 dÌgito, inclui o zero na frente
			nrSensor	=		0%zona%
		else
			nrSensor	:=	zona	;}
	}
	nrSensor		:=	nrSensor
	forReplace	:=	q6@
	return
	}
}
BuscaSensor(nrSensor,	idCliente) {
	if(StrLen(nrSensor)=1)
		nrSensor	:=	"0"	nrSensor
	if(StrLen(nrSensor)=3)
		nrSensor	:=	SubStr(nrSensor,	2,	2)
	zona := "E1300" nrSensor																;	zona para busca no banco do iris
	sensor   =																							;{	Busca a descriÁ„o dos sensores
	(
		SELECT
			[Descricao]
		FROM
			[IrisSQL].[dbo].[Alarmes]
		WHERE
			[Alarme]	=		'%zona%'	AND
			[IdCliente]	=	'%idCliente%'
	)
	sensor   :=  adosql(con,sensor)	;}
	nomeSensor := sensor[2,1]																;	DescriÁ„o do sensor
	if(StrLen(nomeSensor)=0)																;	Se o tamanho da descriÁ„o for 0, define o nome como n„o cadastrada
		nomeSensor	=	ZONA N√O CADASTRADA NO IRIS
	else
	{
		nmSensor	:=	StrSplit(nomeSensor," - ")
		nomeSensor2	:=	nmSensor[2]
		StringUpper, nomeSensor2, nomeSensor2, T							;	Define o texto como Title Case
		nomeSensor	:=	nmSensor[1]	" - "	nomeSensor2
	}
	zona    :=  StrReplace(zona,"E1300")												;	Remove do nome da zona o E1300
	return %nomeSensor%
}
MaskName(altername) {
	if altername = 
	SetEnv, semphone, 1
	StringUpper, altername, altername, T
	an	:=	StrSplit(altername, A_Space)
	Loop, % an.MaxIndex()
	{
	if	(	A_index	=	1	or	A_Index = an.MaxIndex()	)
	newname	:=	an[A_Index]
	else
	{
	if (	an[A_index]	=	"do"	or	an[A_index]	=	"da"	or	an[A_index]	=	"dos"	or	an[A_index]	=	"das"	or	an[A_index]	=	"de"	)
	{
	newname :=	an[A_Index]
	StringLower, newname, newname
	}
	else
	newname	:=	SubStr(an[A_Index],1,1) "."
	}
	nomeretorno	:=	nomeretorno . " " . newname " "
	}
	
    return %nomeretorno%
}
MaskTel(telnum) {
	if telnum =
	SetEnv, semphone, 1
	else
	SetEnv, semphone, 0
	IfInString, telnum, (
	{
	telnum	:=	strreplace(telnum,"(")
	telnum	:=	strreplace(telnum,")")
	telnum	:=	strreplace(telnum," ")
	telnum	:=	strreplace(telnum," ")
	telnum	:=	strreplace(telnum," ")
	telnum	:=	strreplace(telnum," ")
	telnum	:=	strreplace(telnum," ")
	telnum	:=	strreplace(telnum," ")
	}
	ddd	:=	SubStr(telnum,1,3)
	IfInString, ddd, 054
	telnum	:=	strreplace(telnum,"054","54")
	IfInString, ddd, 055
	telnum	:=	strreplace(telnum,"055","55")
	IfInString, ddd, 051
	telnum	:=	strreplace(telnum,"051","51")
	StringTrimRight, numeroa, telnum, 8
	StringTrimRight, numerob, telnum, 4
	StringLen, len, telnum
	if len = 11
	SetEnv, num, 7
	else
	SetEnv, num, 6
	if num = 7
	SetEnv, vb, 3
	if num = 6
	SetEnv, vb, 2
	StringTrimLeft, numerob, numerob, %vb%
	StringTrimLeft, numeroc, telnum, %num%
	if semphone = 0
	if vb = 2
	telnum = 0`( 0%numeroa% `) %numerob% - %numeroc%
	Else
	telnum = 0`(0%numeroa%`) %numerob% - %numeroc%
	SetEnv, semphone, 0
    return %telnum%
}
ChangeCase(String,Type) {
If (Type="S") {
 X = I,AHK,AutoHotkey
 S := RegExReplace(RegExReplace(String, "(.*)", "$L{1}"), "(?<=[\.\!\?]\s|\n).|^.", "$U{0}")
 Loop Parse, X, `,
  S := RegExReplace(S,"i)\b" A_LoopField "\b", A_LoopField)
 Return S
}
If (Type="I")
 Return % RegExReplace(String, "([A-Z])|([a-z])", "$L1$U2")
Return % RegExReplace(String, "(.*)", "$" Type "{1}")
}
DateDiff(startT, endT)	{
	EnvSub, endT, startT, days
	return endT
}
ProcessExist(processo)	{
	Process,Exist,%processo%
	return Errorlevel
}
ison(URL, byref speed, timeout = 250)	{
Runwait,%comspec% /c ping -w %timeout% -4 -n 1 %url% >"C:/Dguard advanced/ison.log",,hide 
fileread , StrTemp, C:/Dguard advanced/ison.log
If InStr(StrTemp, "ms")
	ison	=	1
Else
	ison	=	0
FileDelete,  C:/Dguard advanced/ison.log
}
LogonUser(string_userName, string_domain, string_password, LogonType_logonType = 3, LogonProvider_logonProvider = 3, out_SafeTokenHandle_token="")	;{
{
	if DllCall("advapi32\LogonUser", "str", string_userName, "str", string_domain, "str", string_password, "Ptr", LogonType_logonType, "Ptr", LogonProvider_logonProvider, "UintP", nSize)
	ret	=	1
	else
	ret	=	0
	GuiControl, , user
	GuiControl, , pass
}	;}
Accents( text )	{
replace=¡·¿‡¬‚AaAa√„????ƒ‰≈ÂAaAa??????????????????????CcCcCcCc«ÁDd–d–…È»Ë ÍEeEe????EeÀÎEeEe????????????GgGgGgGgHhHhÕÌÃÏIiŒÓIiœÔIiIiIi????JjKkLlLlLlLl??NnNn—ÒNn”Û“ÚOo‘Ù????????Oo÷ˆOo’ıÿ¯??Oo??Oo??????????????????RrRrRrSsSsäöSsTtTtTt⁄˙Ÿ˘Uu€˚UuUu‹¸UuUuUuUuUuUuUuUu??Uu????????????????Ww??›˝??Yyüˇ??????ZzéûZz
with=AaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaAaCcCcCcCcCcDdDdDEeEeEeEeEeEeEeEeEeEeEeEeEeEeEeEeEeGgGgGgGgHhHhIiIiIiIiIiIiIiIiIiIiIiJjKkLlLlLlLlLlNnNnNnNnOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoPpPpRrRrRrSsSsSsSsTtTtTtUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuUuWwWwWwWwYyYyYyYyYyYyYyZzZzZz
Loop, Parse, Replace
   {
	stringmid, w, with, a_index, 1
	stringreplace, text, text, %a_loopfield%, %w%, All
   }
return text
}