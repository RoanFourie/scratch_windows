Set objConnection = GetObject(“WinNT://atl-ws-01/LanmanServer”)

Set colResources = objConnection.Resources

For Each objResource in colResources

    colResources.Remove(objResource.Name)

Next