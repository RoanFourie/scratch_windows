If InStr(WScript.arguments(0), "SCADA") Then
    SmartSendKeys strOutput,"","%{F4}" 'Activate Alt+4
Else
    SmartSendKeys strOutput,"bypass","%{F4}"
End If