Set Args = Wscript.Arguments
source = Args(0)
target = Args(1)


currentDirectory = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
ZipFile= currentDirectory & "\" & Args(0)
'The folder the contents should be extracted to.
ExtractTo= currentDirectory & "\" & Args(1)


'If the extraction location does not exist create it.
Set fso = CreateObject("Scripting.FileSystemObject")
If NOT fso.FolderExists(ExtractTo) Then
   fso.CreateFolder(ExtractTo)
End If

'Extract the contants of the zip file.
set objShell = CreateObject("Shell.Application")
set FilesInZip=objShell.NameSpace(ZipFile).items
objShell.NameSpace(ExtractTo).CopyHere(FilesInZip)
Set fso = Nothing
Set objShell = Nothing