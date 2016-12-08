# create a template XML to hold data
$template = @'

<localusers machine='pc1' version='1.0'>

<users>

<Name></Name>

<Fullname></Fullname>

<Description></Description>

<SID></SID>

<PasswordRequired></PasswordRequired>

<Disabled></Disabled>

</users>

</localusers>

'@

$template | Out-File $home\users.xml -encoding UTF8

# load template into XML object
$xml = New-Object xml
$xml.Load("$home\users.xml")

# grab template user
$newuser = (@($xml.localusers.users)[0]).Clone()

# use template to add local user accounts to xml 
Get-WmiObject Win32_UserAccount -filter 'LocalAccount=true' |
ForEach-Object {
	$newuser = $newuser.clone()
	$newuser.Name = $_.Name
	$newuser.Fullname = $_.FullName
	$newuser.Description = $_.Description
	$newuser.SID = $_.SID
	$newuser.PasswordRequired = $_.PasswordRequired.toString()
	$newuser.Disabled = $_.Disabled.toString()
	$xml.localusers.AppendChild($newuser) > $null
}

# remove users with undefined name (remove template)
$xml.localusers.users | 
Where-Object { $_.Name -eq "" } | 
ForEach-Object  { [void]$xml.localusers.RemoveChild($_) }

# save xml to file
$xml.Save("$home\userlist.xml")

# play with results

$xml.localusers.users | Sort-Object Name | Format-Table name, description, SID

& "$home\userlist.xml"