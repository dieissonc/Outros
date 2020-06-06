#Persistent
;{	GUI
Gui,	Add,	ListView,	%				"w"	Round((A_ScreenWidth/10)*2)	"	R58	gL1	vL1	AltSubmit" ,	Câmera|ip|Eventos
gosub	i_lv1
Gui,	Add,	ListView,%		"ym	w"	Round((A_ScreenWidth/10)*2)	"	R58	gL2	vL2	AltSubmit"	,	Arquivo|FullPath
Gui,	Add,	Picture,%			"ym	w"	Round((A_ScreenWidth/10)*6)	"	vpic	h"Round((A_ScreenWidth/10)*6)/16*9
Gui,	Show
Menu,	mcm,	Add,	Configurar,		_configurar
Menu,	mcm,	Add,	Deletar todas,	_limpar
return	;}
	GuiClose:	;{
	ExitApp	;}
	L1:	;{
	if(A_EventInfo="")
		return
	Gui,	ListView,	L1
	LV_GetText(ip1, A_EventInfo, 2)
	if (A_GuiEvent = "Normal")	{
	Gui,	ListView,	L2
	LV_Delete()
	Loop,	Files,	\\srvftp\Monitoramento\FTP\Verificados\%ip1%*
		{
			i	:=	StrSplit(A_LoopFileName," - ")
			LV_Add("",i[5],A_LoopFileFullPath)
		}
	LV_ModifyCol()
	LV_ModifyCol(2,0)
	LV_Modify(0, "-Select")
	LV_Modify(1,"Focus Select")
	GuiControl, Focus, l2
	Send {right}
	Gui,	Submit,	NoHide
	row	:=	LV_GetNext()
	LV_GetText(p, row,2)
	GuiControl,	-Redraw,		pic
	GuiControl,	,					pic,	%p%
	GuiControl,	+Redraw,	pic
	}
	return	;}
	L2:	;{
	if (A_GuiEvent = "Normal")	{
		Gui,	ListView,	L2
		LV_GetText(p,A_EventInfo,2)
		GuiControl,	-Redraw,		pic
		GuiControl,	,					pic,	%p%
		GuiControl,	+Redraw,	pic
	}
	If(A_GuiEvent	=	"K")
	{
		if(A_EventInfo	=	40)
		{
			r	:= LV_GetNext()
			Sleep	100
			LV_GetText(p,r,2)
			GuiControl,	-Redraw,		pic
			GuiControl,	,					pic,	%p%
			GuiControl,	+Redraw,	pic
		}
		if(A_EventInfo	=	38)
		{
			r	:= LV_GetNext()
			Sleep	100
			LV_GetText(p,r,2)
			GuiControl,	-Redraw,		pic
			GuiControl,	,					pic,	%p%
			GuiControl,	+Redraw,	pic
		}
	}
	return	;}
	GuiContextMenu:	;{
	if (A_GuiControl != "L1")
		return
	Menu, mcm, Show, %A_GuiX%, %A_GuiY%
	return	;}
	i_lv1:	;{
	vez	++
	Loop,	Files,	\\srvftp\Monitoramento\FTP\Verificados\*.*
	{
		IfInString,	A_LoopFileName,	Thumbs
			continue
		i	:=	StrSplit(A_LoopFileName," - ")
		ip	:=	i[1]
		IfInString, tem,	%ip%
			continue
		LV_Add("",i[3] " | " i[4],i[1])
		tem	:=	i[1]
	}
	Loop,	%	LV_GetCount()
	{
		soma	=
		LV_GetText(isip,A_Index,2)
		Loop,	Files,	\\srvftp\Monitoramento\FTP\Verificados\%isip%*
			soma ++
		LV_Modify(A_Index,Col3,,,soma)
	}
	LV_ModifyCol()
	LV_ModifyCol(2,0)
	LV_ModifyCol(3,"Integer")
	LV_ModifyCol(3,"SortDesc")
	LV_ModifyCol(3,75)
	LV_Modify(0, "-Select")
	LV_Modify(1,"Focus Select")
	GuiControl, Focus, l2
	Send {right}
	Gui,	Submit,	NoHide
	LV_GetText(p, row,2)
	GuiControl,	-Redraw,		pic
	GuiControl,	,					pic,	%p%
	GuiControl,	+Redraw,	pic
	return	;}
	_configurar:	;{
	Gui,	ListView,	L1
	d := LV_GetNext(0, "F")
	LV_GetText(d,d,2)
	Run,	http://admin:tq8hSKWzy5A@%d%
	return	;}
	_limpar:	;{
	Gui,	ListView,	L1
	Gui,	Submit,	NoHide
	d := LV_GetNext(0, "F")
	LV_GetText(d,d,2)
	Loop,	Files,	\\srvftp\Monitoramento\FTP\Verificados\%d%*
		FileDelete,	%A_LoopFileFullPath%
	Reload
;}
	F5::	;{
	Reload	;}