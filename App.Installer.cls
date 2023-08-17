/// an example of Installer class just to create a new clear namespace and database IRISAPP
Class App.Installer
{

XData setup
{
<Manifest>
  <Default Name="Namespace" Value="IRISAPP"/>
  <Default Name="database" Value="irisapp"/>
  
  <Namespace Name="${Namespace}" Code="${Namespace}-CODE" Data="${Namespace}-DATA" Create="yes" Ensemble="1">
    <Configuration>
      <Database Name="${Namespace}-DATA" Dir="${mgrdir}${database}/data" Create="yes" Resource="%DB_${Namespace}-DATA"/>
      <Database Name="${Namespace}-CODE" Dir="${mgrdir}${database}/code" Create="yes" Resource="%DB_${Namespace}-CODE"/>
    </Configuration>
     <CSPApplication Url="/csp/${app}" Directory="${cspdir}${app}"  ServeFiles="1" Recurse="1" MatchRoles=":%DB_${Namespace}" AuthenticationMethods="32" 
    />
  </Namespace>
</Manifest>
}

ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  #; Let XGL document generate code for this method. 
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

}
