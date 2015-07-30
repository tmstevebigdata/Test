Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

Const TemporaryFolder = 2

linkfile = fso.BuildPath(fso.GetSpecialFolder(TemporaryFolder), "Git Bash.lnk")
gitdir = "C:\Program Files (x86)\Git\"

' Dynamically create a shortcut with the current directory as the working directory.
Set link = shell.CreateShortcut(linkfile)
link.TargetPath = fso.BuildPath(gitdir, "bin\sh.exe")
link.Arguments = "--login -i"
link.IconLocation = fso.BuildPath(gitdir, "etc\git.ico")

'link.WorkingDirectory = "C:\APPS\1-DigiDrive\Documents\GitHub"
link.WorkingDirectory = fso.GetAbsolutePathName(".")

link.Save

Set app = CreateObject("Shell.Application")
app.ShellExecute linkfile

Set fso = nothing
Set shell = nothing
set link = nothing
Set app = nothing

WScript.Quit
