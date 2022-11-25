Import-Module bccontainerhelper

$url = Get-BCArtifactUrl -type OnPrem -country nl 
$cred = Get-Credential
$sqlcred = Get-Credential
$containerName = 'developal'

$databaseParams = @{
    "databaseServer"     = 'host.containerhelper.internal'
    "databaseInstance"   = ''
    "databasePrefix"     = "$containerName-"
    "databaseName"       = 'CRONUS'
    "databaseCredential" = $sqlcred 
    "multitenant"        = $false
}

New-NavContainer @databaseParams `
    -replaceExternalDatabases `
    -accept_eula `
    -accept_outdated `
    -containerName $containerName `
    -artifactUrl $url `
    -locale 'nl-NL' `
    -isolation 'process' `
    -Credential $cred `
    -auth UserPassword `
    -updateHosts `
    -useBestContainerOS `
    -shortcuts desktop `
    -licenseFile "C:\Users\gintautas\Documents\myData\7613755.flf" `
    -includeTestToolkit



