@ECHO OFF
:check
timeout /t 10
ECHO checking connection...
ipconfig | find "10.170.172.145" || goto restart
goto check
:restart
ECHO connection failed, disabling controller...
netsh interface set interface "Wi-Fi" Disable
ECHO enabling controller...
netsh interface set interface "Wi-Fi" Enable
goto check
ECHO script end