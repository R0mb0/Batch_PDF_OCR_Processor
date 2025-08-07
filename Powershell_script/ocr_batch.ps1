$CurrentFolder = Get-Location
$OutputFolder = Join-Path $CurrentFolder "output"
if (!(Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

Get-ChildItem -Path $CurrentFolder -Filter *.pdf | ForEach-Object {
    $SrcFile = $_.FullName
    $DstFile = Join-Path $OutputFolder $_.Name

    Write-Host "Processing $($_.Name)..."

    # Use Python to run ocrmypdf
    py -m ocrmypdf --force-ocr --output-type pdf "$SrcFile" "$DstFile"
}

Write-Host "Done. Processed files are in $OutputFolder"