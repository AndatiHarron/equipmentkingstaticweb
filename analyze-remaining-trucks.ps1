# Script to analyze remaining trucks needed

Write-Host "=== ANALYZING REMAINING TRUCK PAGES ===" -ForegroundColor Green
Write-Host ""

# Get all existing HTML files in trucks_html
$existingFiles = Get-ChildItem "trucks_html\*.html" | Where-Object { $_.Name -ne "generate_truck_pages.ps1" -and $_.Name -ne "update_truck_pages.ps1" }
$totalExisting = $existingFiles.Count

Write-Host "CURRENT STATUS:" -ForegroundColor Yellow
Write-Host "  Total HTML files in trucks_html: $totalExisting" -ForegroundColor White
Write-Host ""

# Count what we have from the template
$templateData = Get-Content "complete-truck-data-template.json" -Raw | ConvertFrom-Json

$templateCount = 0
$categories = @("light-duty", "medium-duty", "heavy-duty")

Write-Host "TEMPLATE DATA ANALYSIS:" -ForegroundColor Cyan
foreach ($categoryKey in $categories) {
    $category = $templateData.trucks.$categoryKey
    $categoryName = $category.category
    $seriesCount = 0
    $modelsInCategory = 0
    
    Write-Host "  ${categoryName}:" -ForegroundColor Yellow
    
    $category.series.PSObject.Properties | ForEach-Object {
        $seriesName = $_.Value.seriesName
        $modelCount = $_.Value.models.Count
        $modelsInCategory += $modelCount
        $seriesCount++
        
        Write-Host "    - ${seriesName}: $modelCount models" -ForegroundColor White
    }
    
    Write-Host "    Total in category: $modelsInCategory models" -ForegroundColor Cyan
    $templateCount += $modelsInCategory
    Write-Host ""
}

Write-Host "SUMMARY:" -ForegroundColor Green
Write-Host "  Models in template: $templateCount" -ForegroundColor White
Write-Host "  Total HTML files: $totalExisting" -ForegroundColor White
Write-Host "  Difference: $($totalExisting - $templateCount)" -ForegroundColor Yellow
Write-Host ""

# List some files that might not be in template
Write-Host "SAMPLE OF EXISTING FILES:" -ForegroundColor Cyan
$existingFiles | Select-Object -First 10 | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}
if ($totalExisting -gt 10) {
    Write-Host "  ... and $($totalExisting - 10) more files" -ForegroundColor Gray
}
Write-Host ""

Write-Host "ESTIMATION:" -ForegroundColor Magenta
if ($totalExisting -gt $templateCount) {
    Write-Host "  You have MORE files ($totalExisting) than template models ($templateCount)" -ForegroundColor Yellow
    Write-Host "  This suggests the template needs more data to cover all existing trucks" -ForegroundColor Yellow
} else {
    Write-Host "  Template has $templateCount models, files exist: $totalExisting" -ForegroundColor White
    Write-Host "  Missing: $($templateCount - $totalExisting) pages need generation" -ForegroundColor Red
}