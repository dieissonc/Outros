#Include	_adosql.ahk
#Include	_.ahk
oper = 0003
if(ip4!="184")	;{
	login	=		dsantos:139565war@
else
	login	=		admin:admin@	;}
http			:=	"http://" login "localhost/"
camid		:=	"camerasnomes.cgi"
SetTimer,	verificador, 500
return
verificador:	;{
violados	=
(
	SELECT		IdCliente,	Setor,	COUNT(IdCliente)
	FROM			[IrisSQL].[dbo].[Violados] 
	WHERE		Evento	=	'E130'	AND Setor	='%oper%'
	GROUP BY	IdCliente,	setor
)
violados	:= adosql(con,violados)	;	TODOS os disparos em aberto do operador
if(violados.MaxIndex()-1=0)
	return
else
{
	SetTimer,	verificador, Off
	Sleep,	5000
}
violados	=
(
	SELECT		IdCliente,	Setor,	COUNT(IdCliente)
	FROM			[IrisSQL].[dbo].[Violados] 
	WHERE		Evento	=	'E130'	AND Setor	='%oper%'
	GROUP BY	IdCliente,	setor
)
violados	:= adosql(con,violados)	;	TODOS os disparos em aberto do operador
Loop,	%	violados.MaxIndex()-1		;	Trata por UNIDADE
{
	id				:=	violados[A_Index+1,1]
	idcliente	:=	id
	setor		:=	violados[A_Index+1,2]
	disparos	:=	violados.MaxIndex()-1
	sensores	=
	(
		SELECT			a.Alarme, a.Descricao, a.Camera
		FROM				[IrisSQL].[dbo].[Alarmes]		a
		RIGHT JOIN	[IrisSQL].[dbo].[Violados]	v	ON	a.IdCliente	=	v.IdCliente
		WHERE			a.IdCliente	=	'%id%'
		AND				a.Alarme		=	CONCAT(v.Evento,v.zona)
	)
	sensores	:=adosql(con,sensores)	;	Seleciona TODOS os sensores que dispararam
	disparados	:=	[]
	Loop,	%	sensores.MaxIndex()-1
	{
		if(StrLen(sensores[A_Index+1,3])>0)	{	;	busca os ID das câmeras
			ver++
			ID		:=	HttpGet(http camid,sensores[A_Index+1,3])
			disparados.push(ID "-" sensores[A_Index+1,3])
		}
	}
}
if(StrLen(ver)=0)	{
	FileAppend,	%A_Now%`t%oper%`t%nomedacamera%`tNão conseguiu resgatar o ID da câmera no ip %ip4%`n, \\fs\Departamentos\monitoramento\Monitoramento\Dieisson\Logs\Falha ID - Sensor x Câmera.txt
	ver	=
	return
}
options	=	""
Gui,	live: -DPIScale
Gui, live:Font, S12 Bold
Gui, live:Add, Button,			x10		y0	w1260	gliveClose	Center	,	Fechar visualização ao Vivo
Gui, live:Font, cfffffff
if(disparados.MaxIndex=1)
	Gui,	live:Add,	ActiveX,	x10		y45	w1260	h720	vVlcx1		,	VideoLAN.VLCPlugin
else
{
	Gui,	live:Add,	ActiveX,	x10		y65		w630	h360	vVlcx1	,	VideoLAN.VLCPlugin
	Gui,	live:Add,	ActiveX,	x640	y65		w630	h360	vVlcx2	,	VideoLAN.VLCPlugin
	Gui,	live:Add,	ActiveX,	x10		y460	w630	h360	vVlcx3	,	VideoLAN.VLCPlugin
	Gui,	live:Add,	ActiveX,	x640	y460	w630	h360	vVlcx4	,	VideoLAN.VLCPlugin
	Gui,	live:Add,	Text,		x50		y35		w630	h20		vt1
	Gui,	live:Add,	Text,		x690	y35		w630	h20		vt2
	Gui,	live:Add,	Text,		x50		y430	w630	h20		vt3
	Gui,	live:Add,	Text,		x690	y430	w630	h20		vt4
}
Gui,	live:Color,	000000,	FFFFFF
Gui,	live:Show,	x0	y0	w1275 
for	i,	idx	in disparados
{
	id	:=	StrSplit(idx,"-")
	vlcx%A_Index%.playlist.add("http://" login "localhost/mjpegstream.cgi?camera="	id[1])
	vlcx%A_Index%.playlist.next()
	GuiControl,	live:,	t%A_Index%,	%	id[2]
}
return	;}
HttpGet(URL,nomedacamera)	{
	responseText	=
	static req := ComObjCreate("Msxml2.XMLHTTP")
	req.open("GET", URL, false)
	req.SetRequestHeader("If-Modified-Since", "Sat, 1 Jan 2000 00:00:00 GMT")
	req.send()
	o	:=	StrSplit(req.responseText,"&")
	Loop,	%	o.MaxIndex()	{
		oa	:=	StrReplace(o[A_Index],"`n")
		oa	:=	StrReplace(oa,"`r")
		IfInString,	oa,	%nomedacamera%	
		{
			nome		:=	StrSplit(oa,"=")
			camera	:=	SubStr(nome[2],1,Floor(StrLen(nome[2])/2))
			if(nomedacamera=camera)
				id	:=	StrSplit(oa,"=")
			else
				continue
		}
	}
	if(StrLen(id[1])=0)
		return "Erro"
	else
		return	id[1]
}

liveClose:
Gui,	live:Destroy
SetTimer,	verificador, 500
return