Write-Output "Power Profiles are listed, * = Active"
# Create dictionary
$powerGuidDict = [System.Collections.Specialized.OrderedDictionary]::new()
$i = 0
foreach ($pp in (powercfg /l)) {#loop through powercfg profiles, works like a list of strings
    if($i -gt 2) #>2, skip header lines; extract data
    {
        $key = $i - 2
        $ppstr = [string] $pp
        $guid_substr = $ppstr.Substring(19,36)
        $name_substr = $ppstr.Substring(57)
        
        $powerGuidDict.Add([string] $key, $guid_substr) #populate dictionary
        $formatted = $key,$name_substr -join " " #create and display formatted string      
        Write-Output $formatted
    }
    $i = $i + 1
}

# Display the dictionary
#$powerGuidDict

#user input
$ppkey = Read-Host 'Enter a number'
$ppkey

if ($powerGuidDict.Contains($ppkey)) {
    powercfg /S $powerGuidDict[$ppkey] #set power profile if found
    Write-Output "Power Profile Set."
    powercfg /L
} else {
    Write-Output "Key '$ppkey' does not exist. Opening powercfg.cpl..."
    powercfg.cpl
}

Write-Output " "
Read-Host -Prompt "Press Enter to close"