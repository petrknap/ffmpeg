set process=%~1

start /b powershell.exe -command "ping 127.0.0.1 -n 3; $progs = Get-Process -Name %process%; Foreach ($prog in $progs) { $prog.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::IDLE }"
