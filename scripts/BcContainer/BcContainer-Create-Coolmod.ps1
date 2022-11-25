# Buscar la URL de la imagen
# Get-BCArtifactUrl -country es -select All -type OnPrem -version 14.11 -verbose
# <https://bcartifacts.azureedge.net/onprem/14.11.41204.0/es>

$type = 'OnPrem'
$Country = 'es'
$Version ='14.11'

$artifact = Get-BCArtifactUrl -country $Country -select All -type $type -version $Version

$ContainerName = 'BC1411ES'
$license = 'c:\dev\bc\Lic\BC14_Caduca_19-02-23.flf'

Measure-command {

New-BcContainer -containerName $ContainerName `
                -accept_eula `
                -accept_outdated  `
                -artifactUrl $artifact `
                -auth Windows `
                -doNotExportObjectsToText `
                -includeCSide `
                -includeTestToolkit `
                -isolation hyperv `
                -locale es-ES `
                -restart no `
                -shortcuts DesktopFolder `
                -WebClientPort 8081 `
                -enableSymbolLoading `
                -includeAL `
                -licenseFile $license `
                -updateHosts 
                #-dns 8.8.8.8  `
                #-ManagementServicesPort 7245  `
                #-ClientServicesPort 7246  `
                #-SoapServicesPort 7247  `
                #-ODataServicesPort 7248  `
                #-DeveloperServicesPort 7249  `
                #-bakFile LOCAL-BACKUP.BAK -bakFolder C:\COOLMOD\BAK
}

<# Use:
Get-BcContainerEventLog -containerName BC1411ES to retrieve a snapshot of the event log from the container
Get-BcContainerDebugInfo -containerName BC1411ES to get debug information about the container
Enter-BcContainer -containerName BC1411ES to open a PowerShell prompt inside the container
Remove-BcContainer -containerName BC1411ES to remove the container again
docker logs BC1411ES to retrieve information about URL's again
Minutes           : 6
Seconds           : 50    #>