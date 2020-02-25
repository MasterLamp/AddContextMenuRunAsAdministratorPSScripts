
$DisplayTextInContextMenu = "Run as Administrator"

$hkcrPath = "HKCR:\Microsoft.PowerShellScript.1\Shell\$DisplayTextInContextMenu\Command"

if((Test-Path $hkcrPath) -eq $false) {
    #Create
    Write-Host "Key Doesn't Exist - It will be created."
    New-Item -Path $hkcrPath -Force | Out-Null

    $psCommand = '"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "-Command" ""& {Start-Process PowerShell.exe -ArgumentList ''-ExecutionPolicy RemoteSigned -File \"%1\"'' -Verb RunAs}"'
    New-ItemProperty -Path $hkcrPath -Name "(default)" -Value $psCommand -Force | Out-Null
}