# Restore a single database

#If you have a database you want to restore into a running container, you can do this using Restore-DatabaseInBcContainer as well:

#$containername = 'test'
#$navdockerimage = 'mcr.microsoft.com/businesscentral/sandbox:dk'
#$license = 'c:\temp\build.flf'
#$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'P@ssword1' -AsPlainText -Force)


New-NavContainer -accept_eula `
    -accept_outdated `
    -containerName "to" `
    -imageName "mcr.microsoft.com/businesscentral/onprem:1904-cu1-w1" `
    -auth UserPassword `
    -Credential $credential `
    -updateHosts `
    -includeCSIDE `
    -doNotExportObjectsToText

Restore-DatabasesInBCContainer -containerName "to" `
    -bakFile "c:\programdata\navcontainerhelper\converttest\database.bak" `
    -databaseName "newdb" `
    -databaseFolder "c:\databases\newdb"