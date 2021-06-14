$unit = Read-host -Prompt 'Please provide the unit of measure (C, K, or F)'
if (($unit -eq 'C') -or ($unit -eq 'K') -or ($unit -eq 'F')) {
    $value = Read-Host -Prompt 'Please provide the measured value'
}
else {
    Write-Host 'Unsupported unit of measure entered.'
break
}
$temptable = @(
    [PSCustomObject]@{'Kelvin' = $valuek}
    [PSCustomObject]@{'Farhenheit' = $valuef}
    [PSCustomObject]@{'Celsius' = $valuec}
)
if ($unit -eq 'C') {
    $valuec = $value;
    $valuek = ($value + 273.15);
    $valuef = ($value * (9/5) + 32)
    write-host $temptable | Format-Table
}
elseif ($unit -eq 'K') {
    write-host $tempheadings
    $valuek = $value;
    $valuec = ($value - 273.15);
    $valuef = (($value -273.5) * (9/5) + 32)
    $tempvalues = @($valuek,$valuef,$valuec)
    write-host $tempvalues
}
else {
    write-host $tempheadings
    $valuef = $value;
    $valuec = ($value - 32) *  (5/9);
    $valuek = (($value - 32) * (5/9) + 273.15)
    $tempvalues = @($valuek,$valuef,$valuec)
    write-host $tempvalues

}