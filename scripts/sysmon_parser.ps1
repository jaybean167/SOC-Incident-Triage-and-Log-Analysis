# Sysmon Event ID 1 & 3 Log Parser
# Objective: Query Windows Event Log for suspicious process execution and network connections

Write-Host "=== Sysmon Process Creation (Event ID 1) Triage ===" -ForegroundColor Cyan
Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-Sysmon/Operational'; Id=1} -MaxEvents 20 | ForEach-Object {
    $xml = [xml]$_.ToXml()
    $eventData = $xml.Event.EventData.Data
    [PSCustomObject]@{
        TimeCreated = $_.TimeCreated
        Image       = ($eventData | Where-Object {$_.Name -eq 'Image'}).'#text'
        CommandLine = ($eventData | Where-Object {$_.Name -eq 'CommandLine'}).'#text'
        ParentImage = ($eventData | Where-Object {$_.Name -eq 'ParentImage'}).'#text'
    }
} | Format-Table -AutoSize

Write-Host "`n=== Sysmon Network Connections (Event ID 3) Triage ===" -ForegroundColor Cyan
Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-Sysmon/Operational'; Id=3} -MaxEvents 20 | ForEach-Object {
    $xml = [xml]$_.ToXml()
    $eventData = $xml.Event.EventData.Data
    [PSCustomObject]@{
        TimeCreated   = $_.TimeCreated
        Image         = ($eventData | Where-Object {$_.Name -eq 'Image'}).'#text'
        DestinationIp = ($eventData | Where-Object {$_.Name -eq 'DestinationIp'}).'#text'
        DestinationPort = ($eventData | Where-Object {$_.Name -eq 'DestinationPort'}).'#text'
    }
} | Format-Table -AutoSize
