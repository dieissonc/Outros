#Include	_.ahk
Gui,	Add,	ListView,				x2		y9		w220	h350	gSeleciona	vIdUnidade,	Unidade|ID
Gui,	Add,	Text,					x232	y9		w540	h20		vTexto
Gui,	Add,	DropDownList,	x232	y39		w540	h20	R5	vTipo,	Endereço|Safra|Portão|Veículos|Outros
gosub	nomesDasUnidades
Gui,	Add,	Edit,					x232	y69		w540	h60		vDescricao
Gui,	Add,	Edit,					x232	y139	w540	h220	vConteudo
Gui,	Add,	Button,				x2		y369	w380	h30		gAdiciona,	Adiciona
Gui,	Add,	Button,				x392	y369	w380	h30		,	Cancela
Gui,	Show
return

GuiClose:
ExitApp

nomesDasUnidades:	;{
nomeUnidades =
(
	SELECT	[nm_unidade],[id_unidade]
	FROM		[testes].[dbo].[dados_unidades]
	ORDER	BY	1
)
nomeUnidades := ADOSQL(con, nomeUnidades)
Loop, % nomeUnidades.MaxIndex()-1
	LV_Add("",nomeUnidades[A_Index+1,1],nomeUnidades[A_Index+1,2])
LV_ModifyCol()
LV_ModifyCol(2,0)
return	;}
Seleciona:	;{
Gui,	Submit,	NoHide
LV_GetText(id,A_EventInfo,2)
LV_GetText(Texto,A_EventInfo,1)
GuiControl,	,	Texto,	%	Texto
return

adiciona:
Gui,	Submit,	NoHide
insere=
(
	INSERT INTO [testes].[dbo].[informacoes_unidades]
           ([tipo]
           ,[descricao]
           ,[conteudo]
           ,[adicionado]
           ,[ip]
           ,[id_unidade])
     VALUES
           ('%tipo%','%descricao%','%conteudo%',Convert(Date, '%A_Year%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%', 121),'%A_IPAddress1%','%id%')
)
insere	:=	adosql(con,insere)
if(StrLen(adosql_le)=0)
	Reload
else
	MsgBox % adosql_le
return	;}