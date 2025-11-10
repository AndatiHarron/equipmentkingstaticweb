# Simple truck page completion analysis
$jsonContent = Get-Content "truck-data-template.json" -Raw | ConvertFrom-Json
$existingFiles = Get-ChildItem "trucks_html\*.html" | ForEach-Object { $_.Name }

Write-Host "EQUIPMENT KING TRUCK PAGES - COMPLETION STATUS" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

# Collect all JSON-defined trucks
$completedFromJSON = @()
$missingFromJSON = @()
$allJSONTrucks = @()

foreach ($category in $jsonContent.trucks.PSObject.Properties) {
    $categoryData = $category.Value
    Write-Host "`n$($categoryData.category)" -ForegroundColor Green
    
    foreach ($series in $categoryData.series.PSObject.Properties) {
        $seriesData = $series.Value
        Write-Host "  $($seriesData.seriesName)" -ForegroundColor Yellow
        
        foreach ($truck in $seriesData.models) {
            if ($truck.fileName) {
                $allJSONTrucks += $truck.fileName
                if ($existingFiles -contains $truck.fileName) {
                    Write-Host "    ✅ $($truck.fileName)" -ForegroundColor Green
                    $completedFromJSON += $truck.fileName
                } else {
                    Write-Host "    ❌ $($truck.fileName) - MISSING!" -ForegroundColor Red
                    $missingFromJSON += $truck.fileName
                }
            }
        }
    }
}

# Find extra files
$extraFiles = $existingFiles | Where-Object { ($_ -notin $allJSONTrucks) -and ($_ -ne "test-uniform.html") }

Write-Host "`n" + "=" * 60 -ForegroundColor Cyan
Write-Host "SUMMARY" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

Write-Host "`nCOMPLETED JSON TRUCKS: $($completedFromJSON.Count)" -ForegroundColor Green
Write-Host "MISSING JSON TRUCKS: $($missingFromJSON.Count)" -ForegroundColor Red
Write-Host "LEGACY FILES (not in JSON): $($extraFiles.Count)" -ForegroundColor Yellow

if ($missingFromJSON.Count -gt 0) {
    Write-Host "`nMISSING TRUCKS:" -ForegroundColor Red
    $missingFromJSON | ForEach-Object { Write-Host "  • $_" -ForegroundColor Red }
}

if ($extraFiles.Count -gt 0) {
    Write-Host "`nLEGACY FILES (need JSON data):" -ForegroundColor Yellow
    $extraFiles | Sort-Object | ForEach-Object { Write-Host "  • $_" -ForegroundColor Yellow }
}

Write-Host "`nTOTAL FILES: $($existingFiles.Count)" -ForegroundColor Cyan
Write-Host "JSON COMPLETION: $([math]::Round(($completedFromJSON.Count / $allJSONTrucks.Count) * 100, 1))%" -ForegroundColor Cyan