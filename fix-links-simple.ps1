Write-Host "=== FIXING CORRUPTED TRUCK PAGE LINKS ===" -ForegroundColor Cyan

# Fix the main navigation links manually
$content = Get-Content "trucks.html" -Raw

# Replace corrupted links with working ones
$content = $content -replace 'X9-Aerial-Work-Platform-Truck\.html', 'X9-Aerial.html'
$content = $content -replace 'X9-4X4-Dump-Truck\.html', 'X9-4x4Dump.html'

[System.IO.File]::WriteAllText("trucks.html", $content, [System.Text.Encoding]::UTF8)

# Fix about.html links
$aboutContent = Get-Content "about.html" -Raw
$aboutContent = $aboutContent -replace 'X9-Aerial-Work-Platform-Truck\.html', 'X9-Aerial.html'
[System.IO.File]::WriteAllText("about.html", $aboutContent, [System.Text.Encoding]::UTF8)

Write-Host "Fixed navigation links!" -ForegroundColor Green