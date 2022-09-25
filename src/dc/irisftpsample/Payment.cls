Class dc.irisftpsample.Payment Extends %Persistent
{

Property amount As %Double;

Property transactiondate As %TimeStamp;

Property payer As %String;

Property receiver As %String;

Storage Default
{
<Data name="PaymentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>amount</Value>
</Value>
<Value name="3">
<Value>transactiondate</Value>
</Value>
<Value name="4">
<Value>payer</Value>
</Value>
<Value name="5">
<Value>receiver</Value>
</Value>
</Data>
<DataLocation>^dc.irisftpsample.PaymentD</DataLocation>
<DefaultData>PaymentDefaultData</DefaultData>
<IdLocation>^dc.irisftpsample.PaymentD</IdLocation>
<IndexLocation>^dc.irisftpsample.PaymentI</IndexLocation>
<StreamLocation>^dc.irisftpsample.PaymentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
