FileEncoding,	UTF-8
#SingleInstance	Force
#Include	_configs.ahk
#Include	_functions.ahk
#Include	_adosql.ahk
#NoTrayIcon
;~ salvar = 1
if	( A_UserName	=	"dsantos"	)
Menu, Tray, Icon
if (	salvar = 1	)	;{
{
newc	= 
(
IF EXISTS (SELECT * FROM [Sistema_Monitoramento].[dbo].[Versao e Update] WHERE ip='%ip%')
UPDATE [Sistema_Monitoramento].[dbo].[Versao e Update] SET [update] = 'nao', versao = '%version%', computador = '%A_ComputerName%' WHERE ip ='%ip%'
ELSE
INSERT INTO [Sistema_Monitoramento].[dbo].[Versao e Update]
VALUES ('%ip%','nao','%version%','%A_ComputerName%');

IF EXISTS (SELECT * FROM [Sistema_Monitoramento].[dbo].[Computadores] WHERE ip='%ip%')
UPDATE [Sistema_Monitoramento].[dbo].[Computadores] SET [maquina] = '%A_IPAddress1%', [nome] = '%A_ComputerName%' WHERE ip ='%ip%'
ELSE
INSERT INTO [Sistema_Monitoramento].[dbo].[Computadores]
VALUES ('%A_IPAddress1%','%A_ComputerName%','','%ip%');

UPDATE [Sistema_Monitoramento].[dbo].[Computadores]
SET nome = '%A_ComputerName%'
WHERE maquina = '%A_IPAddress1%';
)
newco := ADOSQL(con,newc)
newc	= 
salvar = 
}
versao_	=
(
SELECT	*	FROM	[Sistema_Monitoramento].[dbo].[Versao e Update]
)
is_vers	:=	adosql(con,versao_)
versao_	=
Loop	%	is_vers.MaxIndex()-1
{
vers1	:=	 is_vers[A_Index+1,1]
vers3	:=	 is_vers[A_Index+1,3]
IfInString,	vers1,	255
z	:=	StrSplit(vers3,".")
}
est	= 
(
SELECT top 1 *	FROM [Sistema_Monitoramento].[dbo].[Computadores]	where maquina = '%A_IPAddress1%'	order by 1 asc
)
esta := ADOSQL(con,est)
est	= 
codigo	:=	z[3]z[9]z[5]z[6]z[5]z[1]
maquina := esta[2,2]
oper := esta[2,3]
repositorio	=	\\fs\Departamentos\monitoramento\monitoramento\Dieisson\SMK\
motion	:=	"\\srvftp\Monitoramento\FTP\Motion\"
inte =	
(
SELECT * FROM CAD_FUNCIONARIOS WHERE codigo = '%codigo%'
)
int = 
int := adosql(ora,inte)
;~ Loop,		45
;~ {
	;~ a	:=	int[1,A_Index] " - " int[2,A_Index]
	;~ OutputDebug,	%	"`n"	a	"	!"
;~ }
inte =	
lib	:= int[2,45]
lib2	:= int[2,44]
if(debug=1)	{
	lib	=	
	lib2	=	01/01/2020
}
if	lib is not digit
	ExitApp
;~ OutputDebug,	%	"`n"	lib	"	!"
;~ OutputDebug,	%	"`n"	lib2	"	!"
if (lib	=	7	or lib = "")
{
if (lib = "")	{
	MsgBox,48,Update Necessário,	Entre em contato com o desenvolvedor do sistema para o update do mesmo.
ExitApp
}
lib2	:=	StrSplit(lib2,"/")
lib2 := lib2[3] lib2[2] lib2[1]
EnvSub, is_now, lib2,  days
if (is_now >= 30	and is_now < 3650)	{
MsgBox,48,Update Necessário,	Entre em contato com o desenvolvedor do sistema para o update do mesmo.
ExitApp
}
}	;}
adosql_lq	=