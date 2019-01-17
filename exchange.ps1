$PlainPassword = $env:exchangeAdminPassword
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

$UserName = $env:exchangeAdminUser

$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName, $SecurePassword

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection

Import-PSSession $Session -DisableNameChecking

New-TransportRule -Name "no scripted 2" -From $env:mailbox -RejectMessageReasonText "No no can do"