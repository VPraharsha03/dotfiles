#Silence Warnings
$WarningPreference = "SilentlyContinue"

Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Set-Theme Paradox

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

#Pertain gsudo to current profile's context
#Function to call the alias with parameters
function gsudo_pwsh()
{
	gsudo.exe powershell.exe -nologo -noexit -noprofile -f $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_wtprofile.ps1
}
 
#set alias
set-alias gsudo gsudo_pwsh

# Import Linux Commands to Powershell 5.x (through WSL)

# The commands to import.
$commands = "awk", "emacs", "git", "grep", "head", "less", "ls", "man", "sed", "seq", "ssh", "tail", "vim"

# Register a function for each command.
$commands | ForEach-Object { Invoke-Expression @"
Remove-Item $_ -Force -ErrorAction Ignore
function global:$_() {
    for (`$i = 0; `$i -lt `$args.Count; `$i++) {
        # If a path is absolute with a qualifier (e.g. C:), run it through wslpath to map it to the appropriate mount point.
        if (Split-Path `$args[`$i] -IsAbsolute -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (wsl.exe wslpath (`$args[`$i] -replace "\\", "/"))
        # If a path is relative, the current working directory will be translated to an appropriate mount point, so just format it.
        } elseif (Test-Path `$args[`$i] -ErrorAction Ignore) {
            `$args[`$i] = Format-WslArgument (`$args[`$i] -replace "\\", "/")
        }
    }

    if (`$input.MoveNext()) {
        `$input.Reset()
        `$input | wsl.exe $_ (`$args -split ' ')
    } else {
        wsl.exe $_ (`$args -split ' ')
    }
}
"@
}
