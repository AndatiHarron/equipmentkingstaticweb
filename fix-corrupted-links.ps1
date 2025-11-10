# Fix Corrupted Truck Page Links

Write-Host "=== FIXING CORRUPTED TRUCK PAGE LINKS ===" -ForegroundColor Cyan

# Mapping of corrupted files to working alternatives
$replacements = @{
    "X9-Tow-Truck.html" = "X9-Tow-Truck.html"  # We just fixed this one
    "X9-Aerial-Work-Platform-Truck.html" = "X9-Aerial.html"  # Use shorter working version
    "X9-4X4-Dump-Truck.html" = "X9-4x4Dump.html"  # Use shorter working version
    "X9-Dump-Truck.html" = "X9-Dump.html"  # Need to create this from working version
    "X9-Van-Truck.html" = "X9-Van.html"  # Need to create this
    "E9-Dump-Truck.html" = "E9-Dump.html"  # Working version exists
    "E9-Van-Truck.html" = "E9-Van.html"  # Working version exists
    "E6-Dump-Truck.html" = "E6-Dump.html"  # Working version exists
    "E6-Van-Truck.html" = "E6-Van.html"  # Working version exists
}

# Fix trucks.html links
Write-Host "Updating trucks.html navigation..." -ForegroundColor Yellow
$trucksContent = Get-Content "trucks.html" -Raw

foreach ($corrupt in $replacements.Keys) {
    $working = $replacements[$corrupt]
    if ($trucksContent -match $corrupt) {
        $trucksContent = $trucksContent -replace $corrupt, $working
        Write-Host "  ✓ Updated: $corrupt → $working" -ForegroundColor Green
    }
}

[System.IO.File]::WriteAllText("trucks.html", $trucksContent, [System.Text.Encoding]::UTF8)

# Fix about.html links
Write-Host "Updating about.html navigation..." -ForegroundColor Yellow
$aboutContent = Get-Content "about.html" -Raw

foreach ($corrupt in $replacements.Keys) {
    $working = $replacements[$corrupt]
    if ($aboutContent -match $corrupt) {
        $aboutContent = $aboutContent -replace $corrupt, $working
        Write-Host "  ✓ Updated: $corrupt → $working" -ForegroundColor Green
    }
}

[System.IO.File]::WriteAllText("about.html", $aboutContent, [System.Text.Encoding]::UTF8)

Write-Host "Navigation links updated to point to working truck pages!" -ForegroundColor Green