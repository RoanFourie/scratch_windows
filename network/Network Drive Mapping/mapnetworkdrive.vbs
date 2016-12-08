Dim objNetwork
Set objNetwork = WScript.CreateObject("WScript.Network")
strLocalDrive = "P:"
strRemoteShare = "\\172.21.55.2\scada_backups"
strPer = "TRUE"
strUsr = "wwbackup"
strPas = "Kloof1234"
objNetwork.MapNetworkDrive strLocalDrive, strRemoteShare, strPer, strUsr, strPas