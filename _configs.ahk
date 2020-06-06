;{
estacoes				=				162,166,169,176,179,184
FormatTime,		is_now,	A_Now,	yyyMMdd
SysGet,				m2,			MonitorWorkArea
SysGet,				m1,			Monitor
m_h						:=			m2Bottom
m_w					:=			m2Right
taskbar				:=			m1Bottom-m_h
isoff 					=				0
SetBatchLines,					-1
StringSplit,			ip,			A_IPAddress1,	.
ip 						:=			ip4
smk						=				\\fs\Departamentos\monitoramento\Monitoramento\Dieisson\SMK\
operador1			=				CPC027893
operador2			=				CPC027896
operador3			=				CPC027897
operador4			=				CPC023409
operador5			=				CPC023405
;~ bgctrl				=				9AA8A8	;	Fundo controles
bgctrl					=				dbdbdb	;	Fundo controles
;~ bggui				=				FF8738
bggui					=				425942	;	Fundo GUI
bglv					=				22AA8D	;	texto
segundoreset		=				0
minutoreset		=				1
horareset1			=				07
horareset2			=				19
agora					=				%A_DD%/%A_MM%/%A_YYYY% | %A_Hour%:%A_Min%:%A_Sec%
;}