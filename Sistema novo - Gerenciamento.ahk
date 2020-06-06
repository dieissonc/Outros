#Include	_.ahk
Gui,	Add,	Tab2,					x2		y9		w1270	h860																		,	Agendamentos e Emails|Dados da Unidade|Responsáveis da Unidade|Adicionar ou Remover Informações
Gui,	Tab,	Dados da Unidade
Gui,	Add,	DropDownList,	x10		y40		w410	h10		vUnidade	R30	gselecionaUnidade
gosub	nomesDasUnidades
Gui,	Add,	ListView,				x10		y70		w410	h420	vAutorizados												,	Matricula|Nome|Observação
Gui,	Add,	ListView,				x425	y70		w410	R10		vLembretes												,	Tipo|Descrição|Completo
Gui,	Add,	Edit,					x425	y270	w410	h220	vLembretesEdit											,	Tipo|Descrição|Completo
Gui,	Show
return

nomesDasUnidades:	;{
nomeUnidades =
(
	SELECT	[nm_unidade]
	FROM		[testes].[dbo].[dados_unidades]
	ORDER	BY	1
)
nomeUnidades := ADOSQL(con, nomeUnidades)
Loop, % nomeUnidades.MaxIndex()-1
	nmUnidades	.=	"|"	nomeUnidades[A_Index+1,1]
GuiControl,	,	Unidade,	%	nmUnidades
return	;}

selecionaUnidade:	;{
Gui,	Submit,	NoHide
idUnidade =
(
	SELECT		id_gerencia,	id_cotrijal
	FROM			[testes].[dbo].[dados_unidades]
	WHERE		nm_unidade	=	'%Unidade%'
	ORDER BY	1
)
nomeUnidades	:=	ADOSQL(con, idUnidade)
MsgBox	%	nomeUnidades[2,1]	nomeUnidades[2,2]
return	;}

GuiClose:
ExitApp
F5::
Reload