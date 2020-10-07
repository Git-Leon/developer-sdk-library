Set Args = Wscript.Arguments
source = Args(0)
target = Args(1)

' make sure source folder has \ at end
If Right(source, 1) <> "\" Then
    source = source & "\"
End If

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set zip = objFSO.OpenTextFile(target, 2, vbtrue)
' this is the header to designate a file as a zip
zip.Write "PK" & Chr(5) & Chr(6) & String( 18, Chr(0) )
zip.Close
Set zip = nothing

wscript.sleep 500

Set objApp = CreateObject( "Shell.Application" )
intSkipped = 0

' Loop over items within folder and use CopyHere to put them into the zip folder
For Each objItem in objApp.NameSpace( source ).Items
    If objItem.IsFolder Then
        Set objFolder = objFSO.GetFolder( objItem.Path )
        ' if this folder is empty, then skip it as it can't compress empty folders
        If objFolder.Files.Count + objFolder.SubFolders.Count = 0 Then
            intSkipped = intSkipped + 1
        Else
            objApp.NameSpace( target ).CopyHere objItem
        End If
    Else
        objApp.NameSpace( target ).CopyHere objItem
    End If
Next