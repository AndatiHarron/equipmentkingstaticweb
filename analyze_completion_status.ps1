# Comprehensive analysis of truck page completion status
param([string]$JsonFile = "truck-data-template.json")

# Read JSON data
$jsonContent = Get-Content $JsonFile -Raw | ConvertFrom-Json

# Get all existing HTML files
$existingFiles = Get-ChildItem "trucks_html\*.html" | ForEach-Object { $_.Name }

Write-Host "=" * 80 -ForegroundColor Cyan
Write-Host "EQUIPMENT KING TRUCK PAGES - COMPLETION STATUS ANALYSIS" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan

# Initialize counters
$completedFromJSON = @()
$missingFromJSON = @()
$extraFiles = @()

# Process JSON-defined trucks
Write-Host "`n📊 ANALYZING JSON-DEFINED TRUCKS..." -ForegroundColor Yellow

foreach ($category in $jsonContent.trucks.PSObject.Properties) {
    $categoryData = $category.Value
    Write-Host "`n🏗️  $($categoryData.category)" -ForegroundColor Green
    
    foreach ($series in $categoryData.series.PSObject.Properties) {
        $seriesData = $series.Value
        Write-Host "   └─ $($seriesData.seriesName)" -ForegroundColor Cyan
        
        foreach ($truck in $seriesData.models) {
            if ($truck.fileName) {
                if ($existingFiles -contains $truck.fileName) {
                    Write-Host "     ✅ $($truck.fileName)" -ForegroundColor Green
                    $completedFromJSON += $truck.fileName
                } else {
                    Write-Host "     ❌ $($truck.fileName) - MISSING!" -ForegroundColor Red
                    $missingFromJSON += $truck.fileName
                }
            }
        }
    }
}

# Find extra files not in JSON
$extraFiles = $existingFiles | Where-Object { 
    ($_ -notin $completedFromJSON) -and 
    ($_ -ne "test-uniform.html") 
}

Write-Host "`n" + "=" * 80 -ForegroundColor Cyan
Write-Host "📈 COMPLETION SUMMARY" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan

Write-Host "`n✅ COMPLETED JSON-DEFINED TRUCKS: $($completedFromJSON.Count)" -ForegroundColor Green
if ($completedFromJSON.Count -gt 0) {
    $completedFromJSON | Sort-Object | ForEach-Object { Write-Host "   • $_" -ForegroundColor Green }
}

Write-Host "`n❌ MISSING JSON-DEFINED TRUCKS: $($missingFromJSON.Count)" -ForegroundColor Red
if ($missingFromJSON.Count -gt 0) {
    $missingFromJSON | Sort-Object | ForEach-Object { Write-Host "   • $_" -ForegroundColor Red }
}

Write-Host "`n📁 EXTRA FILES (Not in JSON): $($extraFiles.Count)" -ForegroundColor Yellow
if ($extraFiles.Count -gt 0) {
    Write-Host "   These files exist but are not defined in the JSON data:" -ForegroundColor Gray
    $extraFiles | Sort-Object | ForEach-Object { 
        Write-Host "   • $_" -ForegroundColor Yellow
    }
}

Write-Host "`n" + "=" * 80 -ForegroundColor Cyan
Write-Host "🎯 STATUS BREAKDOWN" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan

$totalJSONTrucks = $completedFromJSON.Count + $missingFromJSON.Count
$completionPercentage = if ($totalJSONTrucks -gt 0) { [math]::Round(($completedFromJSON.Count / $totalJSONTrucks) * 100, 1) } else { 0 }

Write-Host "`n📊 JSON-Defined Trucks Completion: $completionPercentage% ($($completedFromJSON.Count)/$totalJSONTrucks)" -ForegroundColor Cyan
Write-Host "📁 Total HTML Files in trucks_html/: $($existingFiles.Count)" -ForegroundColor Cyan
Write-Host "🎨 Professional JSON-Styled Pages: $($completedFromJSON.Count)" -ForegroundColor Green
Write-Host "📝 Legacy/Non-JSON Pages: $($extraFiles.Count)" -ForegroundColor Yellow

Write-Host "`n" + "=" * 80 -ForegroundColor Cyan
Write-Host "🚀 NEXT STEPS RECOMMENDATIONS" -ForegroundColor Cyan
Write-Host "=" * 80 -ForegroundColor Cyan

if ($missingFromJSON.Count -gt 0) {
    Write-Host "`n⚠️  You have $($missingFromJSON.Count) trucks defined in JSON but missing HTML files!" -ForegroundColor Red
    Write-Host "   Run: .\generate_all_truck_pages.ps1 to generate missing pages" -ForegroundColor Yellow
}

if ($extraFiles.Count -gt 0) {
    Write-Host "`nConsider creating JSON data for the $($extraFiles.Count) legacy truck pages to:" -ForegroundColor Yellow
    Write-Host "   • Apply consistent professional styling" -ForegroundColor Gray
    Write-Host "   • Add detailed technical specifications" -ForegroundColor Gray
    Write-Host "   • Ensure uniform navigation and branding" -ForegroundColor Gray
}

Write-Host "`nCurrent Status: You have a solid foundation with $($completedFromJSON.Count) professionally styled truck pages!" -ForegroundColor Green

Write-Host "`n" + "=" * 80 -ForegroundColor Cyan