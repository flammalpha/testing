# Creates a CSV file with rows: id,name,value

$lines = 1000
$outfile = "testfile.csv"
$bufferSize = 10000

# header
"id,name,value" | Set-Content $outfile

$buffer = [System.Collections.Generic.List[string]]::new()

for ($i = 1; $i -le $lines; $i++) {
    $name = "name_$($i % 1000)"
    $value = "value_$([math]::Floor((Get-Random -Maximum 5000)))"
    $row = "$i,$name,$value"
    $buffer.Add($row)
    if ($buffer.Count -ge $bufferSize) {
        $buffer | Add-Content $outfile
        $buffer.Clear()
    }
}

if ($buffer.Count -gt 0) {
    $buffer | Add-Content $outfile
}

Write-Host "Generated $outfile with $lines rows."
