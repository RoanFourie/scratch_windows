

Set objConnection = GetObject(�WinNT://GFSA05867-PC/LanmanServer�)

Set colSessions = objConnection.Sessions

For Each objSession in colSessions

    Wscript.Echo �Computer: � & objSession.Computer

    Wscript.Echo �Connected Time: � & objSession.ConnectTime

    Wscript.Echo �Idle Time: � & objSession.IdleTime

    Wscript.Echo �Name: � & objSession.Name

    Wscript.Echo �User: � & objSession.User

    Wscript.Echo

Next