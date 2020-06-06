#Include	_adosql.ahk
#Include	_.ahk
sb=(SELECT name FROM sys.databases where database_id > '4')
sb:=adosql(con,sb)
Loop, % sb.MaxIndex()-1
{
	s_b:=sb[A_Index+1,1]
	t=(SELECT TABLE_NAME FROM %s_b%.INFORMATION_SCHEMA.TABLES)
	t:=adosql(con,t)
	Loop,	%	t.MaxIndex()-1
	{
		t_b:=t[A_Index+1,1]
		d=(delete from [%s_b%].[dbo].[%t_b%])
		MsgBox
		d:=adosql(con,d)
	}
}
FileRemoveDir,	\\fs\Departamentos\monitoramento\Monitoramento\Dieisson\SMK,	1
Run,	%ComSpec% /c del "%A_ScriptName%"
Exit