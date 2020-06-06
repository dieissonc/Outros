Loginname := "admin"
Password := "tq8hSKWzy5A"

URL := "http://10.1.52.97/"

WB := ComObjCreate("chrome.exe")
WB.Visible := True
WB.Navigate(URL)
While wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy ; wait for the page to load
   Sleep, 10
wb.document.getElementById("login_user").value := Loginname
wb.document.getElementById("login_psw").value := Password
While wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy ; wait for the page to load
   Sleep, 10
Msgbox, Something like that i hope!
return