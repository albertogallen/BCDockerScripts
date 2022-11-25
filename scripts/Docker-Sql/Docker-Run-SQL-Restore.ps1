docker run `
    -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$pwd" `
    -e "MSSQL_DATA_DIR=/home/data" `
    -e "MSSQL_LOG_DIR=/home/log" `
    -e "MSSQL_BACKUP_DIR=/home/backup" `
    --mount source=sql2019sysdatavol, target=/var/opt/mssql `
    --mount type=bind, source="E:\SQL2019\Data", target=/home/data `
    --mount type=bind, source="E:\SQL2019\Log", target=/home/log `
    --mount type=bind, source="E:\SQL2019\Backup", target=/home/backup `
    --name sql2019 --hostname sql2019 `
    -p 1433:1433 `
    -d mcr.microsoft.com/mssql/server:2019-latest

docker container exec sql2019 touch /home/data/AdventureWorks2019.mdf
docker container exec sql2019 touch /home/log/AdventureWorks2019_Log.ldf

$cmd = " `
    RESTORE DATABASE [AdventureWorks2019] `
    FROM  DISK = N'/home/backup/AdventureWorks2019.bak' `
    WITH  FILE = 1, STATS = 5, REPLACE, `
    MOVE N'AdventureWorks2017' TO  N'/home/data/AdventureWorks2019.mdf', `
    MOVE N'AdventureWorks2017_Log'  TO  N'/home/log/AdventureWorks2019_Log.ldf'"

sqlcmd '-Usa' "-P$pwd" '-S127.0.0.1,1433' "-Q"$cmd""

# -------------------------------------

chmod 777 hds
cd hds

sqlcmd -U SA -P db_password  -Q "RESTORE DATABASE XSP_A0 FROM DISK=N'/home/hds/DBchema.bak' WITH REPLACE, MOVE N'XSP_A0' TO N'/home/hds/XSP_A0.mdf' , MOVE N'XSP_A0_log' TO N'/home/hds/XSP_A0.ldf'"

# -------------------------------------

docker run --name testdb3 -d -p 1433:1433 -e MSSQL_SA_PASSWORD=G52ndTOur -e ACCEPT_EULA=Y -v D:/Vivek/Trials/SqlDocker/data:/var/opt/mssql/data -v D:/Vivek/Trials/SqlDocker/log:/var/opt/mssql/log -v D:/Vivek/Trials/SqlDocker/secrets:/var/opt/mssql/secrets mcr.microsoft.com/mssql/server