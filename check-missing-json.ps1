# Compare existing truck HTML files with truck-data.json content

$jsonContent = Get-Content -Path "truck-data.json" -Raw | ConvertFrom-Json

# Get all truck HTML files (excluding script files)
$existingFiles = Get-ChildItem -Path "trucks_html\*.html" | Where-Object { 
    $_.Name -notlike "*generate*" -and 
    $_.Name -notlike "*update*" 
} | Select-Object -ExpandProperty Name

Write-Host "=== TRUCK FILES NOT COVERED BY JSON DATA ===" -ForegroundColor Red
Write-Host ""

# Extract all truck models from JSON
$jsonTrucks = @()
$jsonContent.trucks.PSObject.Properties | ForEach-Object {
    $category = $_.Value
    $category.series.PSObject.Properties | ForEach-Object {
        $series = $_.Value
        $series.models | ForEach-Object {
            $jsonTrucks += $_.fileName
        }
    }
}

# Find files that don't have JSON data
$missingFromJson = @()
foreach ($file in $existingFiles) {
    if ($file -notin $jsonTrucks) {
        $missingFromJson += $file
    }
}

Write-Host "Files that exist but have no JSON data:" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Yellow
$missingFromJson | Sort-Object | ForEach-Object {
    Write-Host "❌ $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "Total files missing from JSON: $($missingFromJson.Count)" -ForegroundColor Cyan

Write-Host ""
Write-Host "=== JSON DEFINED TRUCKS ===" -ForegroundColor Green
Write-Host ""
Write-Host "Files that HAVE JSON data:" -ForegroundColor Yellow
Write-Host "================================" -ForegroundColor Yellow
$jsonTrucks | Sort-Object | ForEach-Object {
    Write-Host "✅ $_" -ForegroundColor Green
}

Write-Host ""
Write-Host "Total files with JSON data: $($jsonTrucks.Count)" -ForegroundColor Cyan

Write-Host ""
Write-Host "=== SUMMARY ===" -ForegroundColor Magenta
Write-Host "Total HTML files: $($existingFiles.Count)" -ForegroundColor White
Write-Host "Files with JSON data: $($jsonTrucks.Count)" -ForegroundColor Green
Write-Host "Files missing JSON data: $($missingFromJson.Count)" -ForegroundColor Red

# Categorize the missing files by series
Write-Host ""
Write-Host "=== MISSING FILES BY CATEGORY ===" -ForegroundColor Yellow

# Light Duty
$lightDutyMissing = $missingFromJson | Where-Object { 
    $_ -like "X9-*" -or $_ -like "E9-*" -or $_ -like "X7-*" -or $_ -like "E3-*" 
}
if ($lightDutyMissing.Count -gt 0) {
    Write-Host ""
    Write-Host "Light Duty Trucks Missing JSON:" -ForegroundColor Cyan
    $lightDutyMissing | Sort-Object | ForEach-Object { Write-Host "  • $_" }
}

# Medium Duty
$mediumDutyMissing = $missingFromJson | Where-Object { 
    $_ -like "X6-*" -or $_ -like "E6-*" 
}
if ($mediumDutyMissing.Count -gt 0) {
    Write-Host ""
    Write-Host "Medium Duty Trucks Missing JSON:" -ForegroundColor Cyan
    $mediumDutyMissing | Sort-Object | ForEach-Object { Write-Host "  • $_" }
}

# Heavy Duty
$heavyDutyMissing = $missingFromJson | Where-Object { 
    $_ -like "9-Series-*" -or $_ -like "6-Series-*" -or $_ -like "3-Series-*" -or $_ -like "Z3-*" -or $_ -like "i9-*" -or $_ -like "E1st-*"
}
if ($heavyDutyMissing.Count -gt 0) {
    Write-Host ""
    Write-Host "Heavy Duty Trucks Missing JSON:" -ForegroundColor Cyan
    $heavyDutyMissing | Sort-Object | ForEach-Object { Write-Host "  • $_" }
}