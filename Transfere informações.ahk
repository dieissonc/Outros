#Include	_adosql.ahk
#Include	header.ahk
#Persistent
Menu,	Tray,	Standard
Menu,	Tray,	Icon
con2	:=	"Driver={SQL Server Native Client 10.0};Server=SRVVDM02\IRIS10DB;Uid=ahk;Pwd=139565Sa"
t=(SELECT TABLE_NAME FROM IRISSQL.INFORMATION_SCHEMA.TABLES)
t:=adosql(con,t)
	Loop,	%	t.MaxIndex()-1
	{
		table	:=	t[A_Index+1,1]
		server1	=
		(
			 Select	*	FROM IRISSQL.dbo.%table% order by 1 asc
		)
		server1	:=	adosql(con,server1)
		gosub insere
	}
return

insere:
Loop,	%	server1.Maxindex()-1
{
	Insert	=	
	(
		insert into 
	)
}


return