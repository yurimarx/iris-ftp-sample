Class dc.irisftpsample.LoadCSVFTPReqMessage Extends Ens.StreamContainer
{

Property Header As %Boolean [ InitialExpression = 1 ];

Property Delimiter As %String [ InitialExpression = "," ];

Property Classname As %String(MAXLEN = "");

Property Prowtype As %String(MAXLEN = "");

Property GuessTypes As %Boolean [ InitialExpression = 1 ];

Property Append As %Boolean [ InitialExpression = 1 ];

Property UseLoadData As %Boolean [ InitialExpression = 0 ];

Storage Default
{
<Data name="LoadCSVFTPReqMessageDefaultData">
<Subscript>"LoadCSVFTPReqMessage"</Subscript>
<Value name="1">
<Value>Header</Value>
</Value>
<Value name="2">
<Value>Delimiter</Value>
</Value>
<Value name="3">
<Value>Classname</Value>
</Value>
<Value name="4">
<Value>Prowtype</Value>
</Value>
<Value name="5">
<Value>GuessTypes</Value>
</Value>
<Value name="6">
<Value>Append</Value>
</Value>
<Value name="7">
<Value>UseLoadData</Value>
</Value>
</Data>
<DefaultData>LoadCSVFTPReqMessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
