# Disable Netbios
# If you want to use Powershell to disable Netbios on several computers, you can execute this script:

$adapters=(gwmi win32_networkadapterconfiguration )
Foreach ($adapter in $adapters){
  Write-Host $adapter
  $adapter.settcpipnetbios(2)
}