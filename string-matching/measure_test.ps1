$searchTerm = "value_42"

Write-Host "Reading TestData"

$time = Measure-Command {
    $script:fileData1k = Get-Content "testfile_1k.csv"
    $script:fileData1m = Get-Content "testfile_1m.csv"
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1000x Select-String 1K"
$time = Measure-Command {
    1..1000 | ForEach-Object { $fileData1k | Select-String $searchTerm | Out-Null }
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1000x findstr 1K"
$time = Measure-Command {
    1..1000 | ForEach-Object { $fileData1k | findstr $searchTerm | Out-Null }
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1000x grep 1K"
$time = Measure-Command {
    1..1000 | ForEach-Object { $fileData1k | grep $searchTerm | Out-Null }
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1x Select-String 1M"
$time = Measure-Command {
    $fileData1m | Select-String $searchTerm | Out-Null
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1x findstr 1M"
$time = Measure-Command {
    $fileData1m | findstr $searchTerm | Out-Null
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"

Write-Host "Measuring 1x grep 1M"
$time = Measure-Command {
    $fileData1m | grep $searchTerm | Out-Null
} | Select-Object -ExpandProperty TotalSeconds
Write-Host "Time to complete: $time seconds"