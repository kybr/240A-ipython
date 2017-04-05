
Set objArgs = Wscript.Arguments

if (objArgs.Count = 0) then
    Wscript.echo "I need a sound file as argument!"
    WScript.Quit 123
end if
'Wscript.echo "Playing: " & objArgs(0) & "..."

Set objPlayer = createobject("Wmplayer.OCX.7")

With objPlayer  ' saves typing
    .settings.autoStart = True
    .settings.volume = 50  ' 0 - 100
    .settings.balance = 0  ' -100 to 100
    .settings.enableErrorDialogs = False
    .enableContextMenu = False
    .URL = objArgs(0)
    ' Wait until play finish
    While .Playstate <> 1
        Wscript.Sleep 100
    Wend
End With

'MsgBox "if WMP is still playing, clicking OK will end it", _
'    vbInformation, "WMP Demo finished"
