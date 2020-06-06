WQLQuery	:="Select * From Win32_PingStatus where Address = '192.9.100.187'"
for obj in ComObjGet("winmgmts:").ExecQuery(WQLQuery)
{
    Manufacturer	:= obj.statusCode
    Model					:= obj.SourceRoute 
    UserName			:= obj.BufferSize
}

MsgBox % Manufacturer " | " Model " | " UserName