﻿$containername = 'test'
$navdockerimage = 'mcr.microsoft.com/businesscentral/sandbox:dk'
$license = 'c:\temp\build.flf'
$credential = New-Object pscredential 'admin', (ConvertTo-SecureString -String 'P@ssword1' -AsPlainText -Force)
Measure-command {
    New-NavContainer -accept_eula `
                     -containername $containername `
                     -auth UserPassword `
                     -Credential $credential `
                     -updateHosts `
                     -assignPremiumPlan `
                     -imageName $navdockerimage `
                     -includeTestToolkit `
                     -licenseFile $license `
                     -finalizeDatabasesScriptBlock { 
                         Setup-NavContainerTestUsers -containerName $containername -password $credential.Password -credential $credential
                     } `
                     -bakFolder "mysetup"
}