Gui,	Add,	Text,					x10		y20	w120	h20	+Center			,	IP da C�mera
Gui,	Add,	Edit,					xp		y40	w120	h20	v1_ip
Gui,	Add,	Text,					x140	y20	w120	h20	+Center			,	Nome da C�mera
Gui,	Add,	Edit,					xp		y40	w120	h20	v1_nome
Gui,	Add,	Text,					x270	y20	w120	h20	+Center			,	Operador da C�mera
Gui,	Add,	DropDownList,	xp		y40	w120	h20	v1_setor		r5,	0001|0002|0003|0004|0005
Gui,	Add,	Button,				xm									gconfirma		,	Confirmar
Gui,	Add,	Button,				xp+75								gcancela			,	Cancelar
Gui,	Show,																								,	Cadastro de C�mera Nova
return

confirma:	;{
Gui,	Submit,	NoHide
2_ip	:=	StrSplit(1_ip,".")
if(StrLen(1_setor)=0)	{
	MsgBox Voc� precisa definir a qual operador a c�mera pertence
	return
}
if(2_ip.MaxIndex() != 4)	{
	MsgBox O ip precisa estar separado por "." e conter os quatro campos necess�rios
	GuiControl,	Focus,	1_ip
	return
}
if(2_ip[1] > 254	or	2_ip[2] >	254	or	2_ip[3] >	254	or	2_ip[4] >	254)	{
	MsgBox	O endere�o de ip, n�o pode conter campos com valores maiores que 254
	GuiControl,	Focus,	1_ip
	return
}
i	=
(

)
return	;}

cancela:	;{
Gui,	Submit,	NoHide

return	;}

GuiClose:	;{
ExitApp	;}