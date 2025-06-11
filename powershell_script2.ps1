# Write-Output "hello world"
# Create an OrderedDictionary
#[bool] $ppPresent = 0
$powerGuidDict = [System.Collections.Specialized.OrderedDictionary]::new()

# Add key-value pairs
$powerGuidDict.Add("1", "381b4222-f694-41f0-9685-ff5bb260df2e")
$powerGuidDict.Add("2", "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c")
$powerGuidDict.Add("3", "a1841308-3541-4fab-bc81-f71556f20b4a")
$powerGuidDict.Add("4", "e9a42b02-d5df-448d-aa00-03f14749eb61")

# Power Scheme GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced) 
# Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
# Power Scheme GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)
# Power Scheme GUID: e9a42b02-d5df-448d-aa00-03f14749eb61  (Ultimate Performance)

# Display the dictionary
#$powerGuidDict

#UI
Write-Output "Select a power profile:`r`n1: Balanced,`r`n2: High Performance,`r`n3: Power Saver,`r`n4: ULTIMATE PERFORMANCE!!!!"
$pp = Read-Host 'Enter a number: '
$pp

# foreach ($key in $dictionary.Keys) {
#     $value = $dictionary[$key]
#     Write-Output "$key: $value"
# }


if ($powerGuidDict.Contains($pp)) {
    #Write-Output "Key '$pp' exists in the dictionary."
    #Write-Output $powerGuidDict[$pp]
    powercfg /S $powerGuidDict[$pp]
    Write-Output "Power Profile Set."
    powercfg /L
} else {
    Write-Output "Key '$pp' does not exist in the S."
}