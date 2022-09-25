Class dc.irisftpsample.LoadCSVFTPBusinessService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.FTP.InboundAdapter";

Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{
    Set tSC = $$$OK, 
        tSource = pInput.Attributes("Filename"),
        tFileLocation = pInput.Attributes("FTPDir"),
        pInput=##class(dc.irisftpsample.LoadCSVFTPReqMessage).%New(pInput)

    Set tSC = ..SendRequestSync("LoadCSVFTPBusinessOperation", pInput, .pOutput, -1)
    
    Quit tSC
}

}
