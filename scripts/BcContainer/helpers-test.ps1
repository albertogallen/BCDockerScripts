Get-BcContainerServerConfiguration -containerName bc1411es

Set-BcContainerServerConfiguration -keyName EnableSymbolLoadingAtServerStartup -keyValue true -containerName bc1411es

Restart-BcContainerServiceTier -ContainerName bc1411es

Import-TestToolkitToBcContainer -ContainerName BC1411ES -tenant default -testToolkitCountry es -useDevEndpoint

Get-BccontainerAppInfo -containername BC1411ES | where-object { $_.name -like '*mi*' } | select-object -property name, version


Get-BCArtifactUrl -country es -select All -type OnPrem -version 14.11 -verbose

