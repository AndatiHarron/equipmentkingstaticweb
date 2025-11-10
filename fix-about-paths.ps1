# Fix About.html Paths Script

Write-Host "=== FIXING ABOUT.HTML PATHS ===" -ForegroundColor Cyan

$content = Get-Content "about.html" -Raw

# Count broken paths
$brokenCount = ($content | Select-String "../equipmentking/" -AllMatches).Matches.Count
Write-Host "Found $brokenCount broken paths in about.html..." -ForegroundColor Yellow

# Fix all the ../equipmentking/ paths
$content = $content -replace '../equipmentking/', ''

# Save the fixed content
[System.IO.File]::WriteAllText("about.html", $content, [System.Text.Encoding]::UTF8)

Write-Host "✅ FIXED: All $brokenCount paths in about.html" -ForegroundColor Green