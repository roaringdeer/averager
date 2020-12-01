# $work_dir = Get-Location
# Write-Host $work_dir
$group = Read-Host -Prompt "Input group name"

$files = Get-Item "*.txt" -Exclude @("*-spect.txt", "*-spect_convert.txt", "*-mean.txt") -Include "$group*"

$Time   = @()
$L      = @()
$a      = @()
$b      = @()
$dE76   = @()
$dE2000 = @()
$dL     = @()
$da     = @()
$db     = @()

$files | ForEach-Object {
    $data = Get-Content -Path $_ | Select-Object -Skip 3 | Out-String | ConvertFrom-Csv -Delimiter "`t" -Header @("Time","L","a","b","dE76","dE2000","dL","da","db")
    $Time   += (($data | Select-Object -ExpandProperty Time)   | Measure-Object -Average).Average
    $L      += (($data | Select-Object -ExpandProperty L)      | Measure-Object -Average).Average
    $a      += (($data | Select-Object -ExpandProperty a)      | Measure-Object -Average).Average
    $b      += (($data | Select-Object -ExpandProperty b)      | Measure-Object -Average).Average
    $dE76   += (($data | Select-Object -ExpandProperty dE76)   | Measure-Object -Average).Average
    $dE2000 += (($data | Select-Object -ExpandProperty dE2000) | Measure-Object -Average).Average
    $dL     += (($data | Select-Object -ExpandProperty dL)     | Measure-Object -Average).Average
    $da     += (($data | Select-Object -ExpandProperty da)     | Measure-Object -Average).Average
    $db     += (($data | Select-Object -ExpandProperty db)     | Measure-Object -Average).Average
}


$Time_Avg   = ($Time   | Measure-Object -Average).Average
$L_Avg      = ($L      | Measure-Object -Average).Average
$a_Avg      = ($a      | Measure-Object -Average).Average
$b_Avg      = ($b      | Measure-Object -Average).Average
$dE76_Avg   = ($dE76   | Measure-Object -Average).Average
$dE2000_Avg = ($dE2000 | Measure-Object -Average).Average
$dL_Avg     = ($dL     | Measure-Object -Average).Average
$da_Avg     = ($da     | Measure-Object -Average).Average
$db_Avg     = ($db     | Measure-Object -Average).Average

Write-Host "Group       = $group     "
Write-Host "Mean Time   = $Time_Avg  "
Write-Host "Mean L      = $L_Avg     "
Write-Host "Mean a      = $a_Avg     "
Write-Host "Mean b      = $b_Avg     "
Write-Host "Mean dE76   = $dE76_Avg  "
Write-Host "Mean dE2000 = $dE2000_Avg"
Write-Host "Mean dL     = $dL_Avg    "
Write-Host "Mean da     = $da_Avg    "
Write-Host "Mean db     = $db_Avg    "


Set-Content -Path "./$group-mean.txt" -Value "Averaged values for group $group"
Add-Content -Path "./$group-mean.txt" -Value "Time   = $Time_Avg"
Add-Content -Path "./$group-mean.txt" -Value "L      = $L_Avg"
Add-Content -Path "./$group-mean.txt" -Value "a      = $a_Avg"
Add-Content -Path "./$group-mean.txt" -Value "b      = $b_Avg"
Add-Content -Path "./$group-mean.txt" -Value "dE76   = $dE76_Avg"
Add-Content -Path "./$group-mean.txt" -Value "dE2000 = $dE2000_Avg"
Add-Content -Path "./$group-mean.txt" -Value "dL     = $dL_Avg"
Add-Content -Path "./$group-mean.txt" -Value "da     = $da_Avg"
Add-Content -Path "./$group-mean.txt" -Value "db     = $db_Avg"
Add-Content -Path "./$group-mean.txt" -Value "`r`nFiles that were averaged:"
$files | ForEach-Object {
    Add-Content -Path "./$group-mean.txt" -Value "$($_.Name)"
}

# Read-Host -Prompt "Press any key to exit"