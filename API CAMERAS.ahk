#Include C:\Users\dsantos\Desktop\AHK\Libs\_.ahk
global deu,	global	ip,	global n,	global append,	global n_mac,	global sem
cameras	=		SELECT [ip],[mac],[modelo] FROM [MotionDetection].[dbo].[Cameras] where (last_md < CONVERT(datetime, '2020-05-01')) AND (modelo = 'Foscam')
cameras	:=	adosql(con,cameras)
total		:=	cameras.MaxIndex()-1

Loop,	%	cameras.MaxIndex()-1
{
	ip	=	
	ip				:=	cameras[A_Index+1,1]
	if(ping(ip)=0)
		continue
	;~ gosub	dahua
	;~ gosub	Samsung
	gosub	Foscam
}
ExitApp
END::	;{
ExitApp	;}
Dahua:	;{
		dahua		:=	"http://admin:tq8hSKWzy5A@"	ip	"/cgi-bin/magicBox.cgi?action=getSerialNo"
		dahua(dahua)
		return	;}
Samsung:	;{
		ssm			:=	"http://admin:tq8hSKWzy5A@"	ip	"/cgi-bin/about.cgi?msubmenu=about&action=view2"
		samsung(ssm)
		return	;}
Foscam:	;{
		;~ foscam	:=	"http://"	ip	":88/cgi-bin/CGIProxy.fcgi?&usr=admin&pwd=tq8hSKWzy5A&cmd=getMotionDetectConfig"	;	GET motion detect status
		foscam	:=	"http://"	ip	":88/cgi-bin/CGIProxy.fcgi?&usr=admin&pwd=tq8hSKWzy5A&cmd=getSnapConfig"	;	get snap config
		;~ foscam	:=	"http://"	ip	":88/cgi-bin/CGIProxy.fcgi?&usr=admin&pwd=tq8hSKWzy5A&cmd=setSnapConfig&snapQuality=2&saveLocation=2"	;	Set snap config
		;~ foscam	:=	"http://"	ip	":88/cgi-bin/CGIProxy.fcgi?&usr=admin&pwd=tq8hSKWzy5A&cmd=getDevInfo"
		foscam(foscam)
return	;}

dahua(WTN)	{
	n_mac	=
	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", WTN, false)
	ComObjError(False)
	req.Send()
	if(InStr(req.responseText,"sn="))	{
		n_mac		:=	StrReplace(StrReplace(StrReplace(req.responseText,"sn="),"`n"),"`r")
		update	=		update	[MotionDetection].[dbo].[Cameras]	Set	modelo='Dahua', mac='%n_mac%'	where ip = '%ip%'
		update	:=	adosql(con,update)
		if(StrLen(adosql_le)>0)
			MsgBox % adosql_le
	}
	if(StrLen(n_mac)>0)
		append	:=	ip " - " n_mac	"`n`t" adosql_lq	"`n`n"
}
samsung(WTN)	{
	n_mac	=	
	static	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", WTN, false)
	ComObjError(False)
	req.Send()
	if(InStr(req.responseText,"serial:")>0)	{
		Line	:=	StrSplit(req.responseText,"`n")
		Loop,	%	line.MaxIndex()
			if(InStr(line[A_Index],"serial:")>0)	{
				n_mac		:=	StrReplace(StrReplace(SubStr(line[A_Index],InStr(line[A_Index],":")+1),"`n"),"`r")
				update	=		update	[MotionDetection].[dbo].[Cameras]	Set	modelo='Samsung', mac='%n_mac%'	where ip = '%ip%'
				update	:=	adosql(con,update)
				if(StrLen(adosql_le)>0)
					MsgBox % adosql_le
		}
	}
	if(StrLen(n_mac)>0)
		append	:=	ip " - " n_mac	"`n`t" adosql_lq	"`n`n"
}
foscam(WTN)	{
	n_mac	=	
	static	req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", WTN, false)
	ComObjError(False)
	req.Send()
	;~ MsgBox % req.responsetext
	Line		:=	StrSplit(req.responseText,"`n")
	Loop,	%	line.MaxIndex()
		if(InStr(line[A_Index],"<isEnable>")>0)
			n_mac		:=	StrReplace(StrReplace(SubStr(line[A_Index],InStr(line[A_Index],">")+1,1),"`n"),"`r")
		if(n_mac=0)
			FileAppend,	%	"http://"	ip ":88`n",	%A_ScriptDir%\desativado.txt
}