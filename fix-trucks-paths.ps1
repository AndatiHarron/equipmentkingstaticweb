$content = Get-Content "trucks.html" -Raw

# Fix all the incorrect truck_html paths
$content = $content -replace '\.\./equipmentking/trucks_html/', 'trucks_html/'

[System.IO.File]::WriteAllText("trucks.html", $content, [System.Text.Encoding]::UTF8)
Write-Host "Fixed all truck paths in trucks.html" -ForegroundColor Green