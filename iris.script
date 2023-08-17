    zn "%SYS"

    // Unexpire passwords and set up passwordless mode to simplify dev use.
    // ** Comment out these two line for Production use **
    do ##class(Security.Users).UnExpireUserPasswords("*")
    zpm "install passwordless"

    // Enable callin for Embedded Python
    do ##class(Security.Services).Get("%Service_CallIn",.prop)
    set prop("Enabled")=1
    set prop("AutheEnabled")=48
    do ##class(Security.Services).Modify("%Service_CallIn",.prop)

    // create IRISAPP namespace
    do $SYSTEM.OBJ.Load("/home/irisowner/dev/App.Installer.cls", "ck")
    set sc = ##class(App.Installer).setup()

    zn "IRISAPP"

    // Create /_vscode web app to support intersystems-community.testingmanager VS Code extension
    zpm "install vscode-per-namespace-settings"

    // Configure %UnitTest in IRISAPP to suit the VS Code extension
    set ^UnitTestRoot="/usr/irissys/.vscode/IRISAPP/UnitTestRoot"

    zpm "load /home/irisowner/dev/ -v":1:1
    halt
