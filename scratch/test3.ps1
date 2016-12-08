$ComputerName = "MyComputer"
$Computer = [ADSI]"WinNT://$ComputerName,computer"
$Users = $Computer.psbase.Children | Where-Object {$_.psbase.schemaclassname -eq "user"}
ForEach ($User in $Users)
{
    $Name = $User.Name
    $Login = $User.lastLogin
    If ($Login.Name -eq "lastLogin") {$Login = "Never"}
    $PwdAge = $User.passwordAge
    $PwdExpired = $User.passwordExpired 
    "$Name,$PwdAge,$PwdExpired,$Login" | Out-File -FilePath "c:\LocalUsers.csv" -Append
}