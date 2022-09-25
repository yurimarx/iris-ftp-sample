Class dc.irisftpsample.LoadCSVFTPBusinessOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Property Header As %Boolean [ InitialExpression = 1 ];

Property Delimiter As %String [ InitialExpression = "," ];

Property Classname As %String(MAXLEN = "");

Property Prowtype As %String(MAXLEN = "");

Property GuessTypes As %Boolean [ InitialExpression = 1 ];

Property Append As %Boolean [ InitialExpression = 1 ];

Property UseLoadData As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "Header:Basic,Delimiter:Basic,Classname:Basic,Prowtype:Basic,GuessTypes:Basic,Append:Basic,UseLoadData:Basic";

Method LoadCSVIntoTable(pInput As dc.irisftpsample.LoadCSVFTPReqMessage, Output pOutput As Ens.StringResponse) As %Status
{
    
    Set tSC = $$$OK
    Set pOutput = ##class(Ens.StringResponse).%New()

    Try {
        Set tSC = ##class(community.csvgen).StreamToFile(pInput.Stream, .pFile)
        Set tSC = ##class(community.csvgen).Generate(pFile, ..Delimiter, ..Classname, ..Prowtype, ..GuessTypes, ..Append, ..UseLoadData, ..Header)
        Set pOutput.StringValue = "OK"
    } Catch err {
        Set pOutput.StringValue = $System.Status.GetOneErrorText(tSC, 1)
    }

    Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="dc.irisftpsample.LoadCSVFTPReqMessage">
        <Method>LoadCSVIntoTable</Method>
    </MapItem>
</MapItems>
}

}
