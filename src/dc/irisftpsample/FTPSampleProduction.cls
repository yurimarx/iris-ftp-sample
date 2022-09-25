Class dc.irisftpsample.FTPSampleProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.irisftpsample.FTPSampleProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  
  <Item Name="LoadCSVFTPBusinessService" Category="" ClassName="dc.irisftpsample.LoadCSVFTPBusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">FTPCredentials</Setting>
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FTPServer">pure-ftpd</Setting>
    <Setting Target="Adapter" Name="FilePath">/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.csv</Setting>
    <Setting Target="Adapter" Name="SubdirectoryLevels">1</Setting>
    <Setting Target="Adapter" Name="UseFileStream">1</Setting>
    <Setting Target="Adapter" Name="UsePASV">0</Setting>
  </Item>
  
  <Item Name="LoadCSVFTPBusinessOperation" Category="" ClassName="dc.irisftpsample.LoadCSVFTPBusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Header">1</Setting>
    <Setting Target="Host" Name="Delimiter">,</Setting>
    <Setting Target="Host" Name="Classname">dc.irisftpsample.Country</Setting>
    <Setting Target="Host" Name="Prowtype"></Setting>
    <Setting Target="Host" Name="GuessTypes">1</Setting>
    <Setting Target="Host" Name="Append">1</Setting>
    <Setting Target="Host" Name="UseLoadData">1</Setting>
  </Item>
  
  <Item Name="PaymentSQLBusinessService" Category="" ClassName="EnsLib.SQL.Service.GenericService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">User</Setting>
    <Setting Target="Adapter" Name="DeleteQuery">DELETE FROM dc_irisftpsample.Payment</Setting>
    <Setting Target="Adapter" Name="Query">SELECT ID, amount, payer, receiver, transactiondate FROM dc_irisftpsample.Payment</Setting>
    <Setting Target="Host" Name="TargetConfigNames">SendSQLDataToFTPBusinessOperation</Setting>
  </Item>

  <Item Name="SendSQLDataToFTPBusinessOperation" Category="" ClassName="dc.irisftpsample.SendSQLDataToFTPBusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FTPPort">21</Setting>
    <Setting Target="Adapter" Name="FilePath">/</Setting>
    <Setting Target="Host" Name="Filename">%F_%Q.json</Setting>
    <Setting Target="Adapter" Name="Credentials">FTPCredentials</Setting>
    <Setting Target="Adapter" Name="FTPServer">pure-ftpd</Setting>
    <Setting Target="Adapter" Name="Protocol">FTP</Setting>
    <Setting Target="Adapter" Name="UsePASV">0</Setting>
  </Item>
  
</Production>
}

}
