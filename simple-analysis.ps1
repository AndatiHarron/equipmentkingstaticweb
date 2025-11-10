# Simple analysis of truck pages status

Write-Host "=== TRUCK PAGES ANALYSIS ===" -ForegroundColor Green
Write-Host ""

$totalFiles = (Get-ChildItem "trucks_html\*.html").Count
Write-Host "Total HTML files in trucks_html: $totalFiles" -ForegroundColor Yellow
Write-Host ""

# Count what we generated from your JSON data (15 pages)
$generatedFromYourData = 15
Write-Host "Pages generated from your JSON data: $generatedFromYourData" -ForegroundColor Cyan

# Count what exists in the template file (approximate based on structure)
$templateEstimate = 23  # Based on the visible structure in the template
Write-Host "Estimated pages in template file: $templateEstimate" -ForegroundColor Cyan
Write-Host ""

Write-Host "BREAKDOWN:" -ForegroundColor Magenta
Write-Host "  From your comprehensive JSON: $generatedFromYourData pages ✓" -ForegroundColor Green
Write-Host "  Additional template data: ~$($templateEstimate - $generatedFromYourData) pages" -ForegroundColor Yellow
Write-Host "  Other existing files: $($totalFiles - $templateEstimate) pages" -ForegroundColor White
Write-Host ""

Write-Host "REMAINING WORK:" -ForegroundColor Red
$remaining = $totalFiles - $generatedFromYourData
Write-Host "  Still need data for: $remaining truck models" -ForegroundColor Yellow
Write-Host "  Your JSON covered: $(($generatedFromYourData / $totalFiles * 100).ToString('F1'))% of total trucks" -ForegroundColor Cyan
Write-Host ""

Write-Host "NEXT STEPS:" -ForegroundColor Blue
Write-Host "  1. Complete the template file with remaining $($totalFiles - $templateEstimate) trucks" -ForegroundColor White
Write-Host "  2. Generate pages for all remaining trucks using the template" -ForegroundColor White
Write-Host "  3. Update navigation to include all truck models" -ForegroundColor White

# Show some files that still need data
Write-Host ""
Write-Host "SAMPLE FILES NEEDING DATA:" -ForegroundColor Red
Get-ChildItem trucks_html\*.html | Where-Object { 
    $_.Name -notin @("E9-Van.html", "E9-Dump.html", "X9-Tow.html", "X9-4x4Dump.html", "X9-Aerial.html", "i9.html", "E6-Dump.html", "E6-Van.html", "E6-Crane.html", "X6-Dropside.html", "X6-AWD.html", "E1st-Tractor.html", "Z3-Tractor.html", "E3-Van.html", "E3-Tractor.html")
} | Select-Object -First 10 | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor Gray
}