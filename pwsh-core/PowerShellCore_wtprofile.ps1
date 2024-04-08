$WarningPreference = "SilentlyContinue"
Import-Module posh-git
Import-Module WslInterop
Import-WslCommand "awk", "emacs", "git", "grep", "head", "less", "ls", "man", "nano", "sed", "seq", "ssh", "sudo", "tail", "vim"
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -Colors @{ "InlinePrediction" = "`e[38;5;238m" } #PSReadLine 2.3.4 changes history predictions to 'dim white italic'

fastfetch --logo $env:USERPROFILE\.config\fastfetch\ascii.txt

#set default distro
$WslDefaultParameterValues = @{}
$WslDefaultParameterValues["-d"] = "Ubuntu-20.04"

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

#Pertain gsudo to current profile's context
#Function to call the alias with parameters
function gsudo_pwsh()
{
	gsudo.exe pwsh.exe -nologo -noexit -noprofile -f $env:USERPROFILE\Documents\PowerShell\PowerShellCore_wtprofile.ps1
}
 
#set alias
set-alias gsudo gsudo_pwsh
set-alias cat "bat --pager=never"

Invoke-Expression (&starship init powershell)
 
