
# Restore a single database

# If you have a database you want to restore into a running container, you can do this using Restore-DatabaseInBcContainer as well:

$containername = 'test'
$navdockerimage = 'mcr.microsoft.com/businesscentral/sandbox:dk'
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'P@ssword1' -AsPlainText -Force)


New-NavContainer -accept_eula `
    -accept_outdated `
    -containerName $containername `
    -imageName $navdockerimage `
    -auth UserPassword `
    -Credential $credential `
    -updateHosts `
    -includeCSIDE `
    -doNotExportObjectsToText

Restore-DatabasesInBCContainer -containerName $containername `
    -bakFile "c:\programdata\navcontainerhelper\converttest\database.bak" `
    -databaseName "newdb" `
    -databaseFolder "c:\databases\newdb"