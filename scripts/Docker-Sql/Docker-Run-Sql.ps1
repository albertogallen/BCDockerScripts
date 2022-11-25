docker run `
    --name testdb3 `
    -d  `
    -p 1433:1433  `
    -e MSSQL_SA_PASSWORD=G52ndTOur  `
    -e ACCEPT_EULA=Y  `
    -v D:/Vivek/Trials/SqlDocker/data:/var/opt/mssql/data  `
    -v D:/Vivek/Trials/SqlDocker/log:/var/opt/mssql/log  `
    -v D:/Vivek/Trials/SqlDocker/secrets:/var/opt/mssql/secrets  `
    mcr.microsoft.com/mssql/server