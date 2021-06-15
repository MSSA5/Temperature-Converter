$unit = Read-host -Prompt 'Please provide the unit of measure (C, K, or F)'
if (($unit -eq 'C') -or ($unit -eq 'K') -or ($unit -eq 'F')) {
    $value = Read-Host -Prompt 'Please provide the measured value'
    Try{
        [decimal]$value | Out-Null
    } Catch {
        Write-Host 'Value entered was not in a number format.'
        break
    }
}
else {
    Write-Host 'Unsupported unit of measure entered.'
    break
}
switch ($unit) {
    'C' { 
        $valuec = "{0:####.00}" -f [decimal]$value
        $valuek = "{0:####.00}" -f ([decimal]$value + 273.15)
        $valuef = "{0:####.00}" -f ([decimal]$value * (9/5) + 32)
        Write-Host 'Kelvin:' $valuek ' Farhenheit:' $valuef ' Celsius' $valuec
     }
    'K' { 
        $valuek = "{0:####.00}" -f [decimal]$value
        $valuec = "{0:####.00}" -f ([decimal]$value - 273.15)
        $valuef = "{0:####.00}" -f (([decimal]$value - 273.15) * (9/5) + 32)
        Write-Host 'Kelvin:' $valuek ' Farhenheit:' $valuef ' Celsius' $valuec
     }
    'F' { 
        $valuef = "{0:####.00}" -f [decimal]$value
        $valuec = "{0:####.00}" -f (([decimal]$value - 32) * (5/9))
        $valuek = "{0:####.00}" -f (([decimal]$value - 32) * (5/9) + 273.15)
        Write-Host 'Kelvin:' $valuek ' Farhenheit:' $valuef ' Celsius' $valuec
     }
}



