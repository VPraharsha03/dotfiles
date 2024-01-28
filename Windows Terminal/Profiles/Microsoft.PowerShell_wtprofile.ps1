$WarningPreference = "SilentlyContinue"
Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\omp_themes\paradox_coloremoji.omp.json" | Invoke-Expression
fastfetch --logo $env:USERPROFILE\.config\fastfetch\ascii.txt # change to fastfetch as winfetch is no longer compatible with powershell 5.1

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
