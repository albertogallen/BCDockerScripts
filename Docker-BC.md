# Instalacion BC con Docker

-Activar Hyper-V
> Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V","Containers") -All

-Instalar Modulo Helper de Container BC
>Install-Module -Name BcContainerHelper -Force

-Buscar la URL de la imagen
> Get-BCArtifactUrl -country es -select All -type OnPrem -version 14.11 -verbose

```https://bcartifacts.azureedge.net/onprem/14.11.41204.0/es```

New-BcContainer -accept_eula -accept_outdated -artifactUrl https://bcartifacts.azureedge.net/onprem/14.11.41204.0/es -auth Windows -ClientServicesPort 7246 -containerName BC1411ES -DeveloperServicesPort 7249 -dns 8.8.8.8 -doNotExportObjectsToText -includeCSide -includeTestToolkit -isolation hyperv -locale ES -ManagementServicesPort 7245 -ODataServicesPort 7248 -restart no -shortcuts DesktopFolder -SoapServicesPort 7247 -WebClientPort 8081

-bakFile LOCAL-BACKUP.BAK -bakFolder C:\COOLMOD\BAK
