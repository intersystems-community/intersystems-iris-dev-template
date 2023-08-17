Class dc.sample.PersistentClass Extends %Persistent
{

Property Test As %VarString;

ClassMethod CreateRecord(ByRef id As %Integer) As %Status
{
    set sc=$$$OK
    Try {
        write "from Python       : "
        set builtins = ##class(%SYS.Python).Import("builtins")
        set id = builtins.list()
        set sc = ..CreateRecordPython(id)
        write id."__getitem__"(0)," successfully created with CreateRecordPython",!
        write "from ObjectScript : "
        set sc = ..CreateRecordObjesctScript(.id)   
        write id," successfully created with CreateRecordObjesctScript",!
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
  
    return sc
}

ClassMethod CreateRecordObjesctScript(ByRef id As %Integer) As %Status
{
    set sc=$$$OK
    set objPC=..%New()
    set objPC.Test="Test string from CreateRecordObjectScript() "_$zdt($now(),3,,6)
    set sc=objPC.%Save()
    set id=objPC.%Id()
    return sc
}

ClassMethod CreateRecordPython(id) As %Status [ Language = python ]
{
import iris
from datetime import datetime

objPC=iris.cls('dc.sample.PersistentClass')._New()
objPC.Test="Test string from CreateRecordPython() "+str(datetime.now())
sc=objPC._Save()
id.append(objPC._Id())
return sc
}

ClassMethod ReadProperty(id As %Integer) As %Status
{

    Set sc = $$$OK
    Try {
        write "from Python       : "
        set sc = ..ReadPropertyPython(id)
        write "from ObjectScript : "
        set sc = ..ReadPropertyObjectScript(id)    
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// opens the record by id and reads its property
ClassMethod ReadPropertyObjectScript(id As %Integer) As %Status
{
    Set sc = $$$OK
    #dim obj as dc.sample.PersistentClass
    if ..%ExistsId(id) { 
        set obj=..%OpenId(id,,.sc)
        if $ISOBJECT(obj) write obj.Test,!
    } else {
        write id," is not an existing ID in dc.sample.PersistentClass",!
    }
    Return sc
}

ClassMethod ReadPropertyPython(id As %Integer) As %Status [ Language = python ]
{
import iris
sc=1
if iris.cls('dc.sample.PersistentClass')._ExistsId(id):
    obj=iris.cls('dc.sample.PersistentClass')._OpenId(id)
    print(obj.Test)
else:
 print(id,'is not an existing ID in dc.sample.PersistentClass')
return sc
}

Storage Default
{
<Data name="PersistentClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Test</Value>
</Value>
</Data>
<DataLocation>^dc.Package4C8F.PersistentC1A93D</DataLocation>
<DefaultData>PersistentClassDefaultData</DefaultData>
<IdLocation>^dc.Package4C8F.PersistentC1A93D</IdLocation>
<IndexLocation>^dc.Package4C8F.PersistentC1A93I</IndexLocation>
<StreamLocation>^dc.Package4C8F.PersistentC1A93S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
