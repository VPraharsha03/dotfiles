#Silence Warnings
$WarningPreference = "SilentlyContinue"

Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Set-Theme Paradox2

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
 
