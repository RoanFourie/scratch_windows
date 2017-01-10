Set objConnection = GetObject(“WinNT://atl-ws-01/LanmanServer”)

Set colSessions = objConnection.Sessions

For Each objSession in colSessions

    colSessions.Remove(objSession.Name)

Next