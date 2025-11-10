# Fix All Image Paths in trucks.html

Write-Host "=== FIXING TRUCKS.HTML IMAGE PATHS ===" -ForegroundColor Cyan

# Read the trucks.html file
$content = Get-Content "trucks.html" -Raw

# Count broken paths before fixing
$brokenCount = ($content | Select-String "../equipmentking/" -AllMatches).Matches.Count
Write-Host "Found $brokenCount broken image paths to fix..." -ForegroundColor Yellow

# Fix all the ../equipmentking/ paths in image sources
$content = $content -replace 'src="../equipmentking/assets/', 'src="assets/'
$content = $content -replace 'href="../equipmentking/assets/', 'href="assets/'

# Also fix any remaining navigation paths
$content = $content -replace 'href="../equipmentking/trucks\.html', 'href="trucks.html'
$content = $content -replace 'href="../equipmentking/index\.html', 'href="index.html'

# Save the fixed content
[System.IO.File]::WriteAllText("trucks.html", $content, [System.Text.Encoding]::UTF8)

# Count remaining broken paths
$stillBrokenCount = ($content | Select-String "../equipmentking/" -AllMatches).Matches.Count

Write-Host "✅ FIXED: Changed $($brokenCount - $stillBrokenCount) image paths" -ForegroundColor Green
if ($stillBrokenCount -gt 0) {
    Write-Host "⚠️  WARNING: $stillBrokenCount paths still need manual review" -ForegroundColor Yellow
} else {
    Write-Host "🎉 ALL IMAGE PATHS FIXED!" -ForegroundColor Green
}

Write-Host "`n=== VERIFICATION ===" -ForegroundColor Cyan
Write-Host "Now test locally with:" -ForegroundColor White
Write-Host "  python -m http.server 8000" -ForegroundColor Gray
Write-Host "  Visit: http://localhost:8000/trucks.html" -ForegroundColor Gray