$WarningPreference = "SilentlyContinue"
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Set-Theme Paradox_anaconda

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

#Pertain gsudo to current profile's context
#Function to call the alias with parameters
function gsudo_pwsh()
{
	gsudo.exe powershell.exe -nologo -noexit -noprofile -f $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_condawtprofile.ps1
}
 
#set alias
set-alias gsudo gsudo_pwsh

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Anaconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion