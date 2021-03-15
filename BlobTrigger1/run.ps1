# Input bindings are passed in via param block.
param([byte[]] $InputBlob, $TriggerMetadata)

# Write out the blob name and size to the information log.
Write-Host "PowerShell Blob trigger function Processed blob! Name: $($TriggerMetadata.Name) Size: $($InputBlob.Length) bytes"

$TextString = [System.Text.Encoding]::UTF8.GetString($InputBlob).Replace('system','système')

echo $TextString

Push-OutputBinding -Name outputBlob -Value $TextString -Clobber

