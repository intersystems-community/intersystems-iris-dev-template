Class dc.sample.ObjectScript
{

ClassMethod Test() As %Status
{
    set sc = $$$OK
    Try {
        set sc = ..Run() ; Python
        set sc = ..Run(0) ; ObjectScript
    }
    Catch ex {
        set sc=ex.AsStatus()
    }
    return sc
}

ClassMethod Run(python As %Boolean = 1) As %Status
{
    return:python ..Python()
    return:'python ..ObjectScript()
}

ClassMethod ObjectScript() As %Status
{
    set a=42 
    write "Hello World! from ",$CLASSMETHOD("dc.sample.ObjectScript","%ClassName",1)," in ObjectScript language",!
    write "This is InterSystems IRIS with version ",$zv,!
    write "Current time is: "_$zdt($now(),3,,6),!
    return a
}

ClassMethod Python() As %Status [ Language = python ]
{
import iris    
from datetime import datetime
a=42 
print("Hello World! from",iris.cls('dc.sample.ObjectScript')._ClassName(1),"in Python language")
print("This is InterSystems IRIS with version",iris.system.Version.GetVersion())
print("Current time is:",datetime.now())
return a
}

}
