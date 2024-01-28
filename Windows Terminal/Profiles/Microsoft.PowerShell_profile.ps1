$WarningPreference = "SilentlyContinue"
Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\omp_themes\paradox_old.omp.json" | Invoke-Expression
fastfetch --logo $env:USERPROFILE\.config\fastfetch\ascii.txt

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
 

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
