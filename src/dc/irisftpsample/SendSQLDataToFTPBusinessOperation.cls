Class dc.irisftpsample.SendSQLDataToFTPBusinessOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.FTP.OutboundAdapter";

Property Filename As %String(MAXLEN = 1000);

Parameter SETTINGS As %String = "Filename";

Method OnMessage(pRequest As Ens.StreamContainer, Output pResponse As %Persistent) As %Status
{
  Set tFilename=
  ..Adapter.CreateTimestamp(##class(%File).GetFilename("/tmp/sqltojson"),..Filename)
  Quit ..Adapter.PutStream(tFilename, pRequest.Stream)
}

}
