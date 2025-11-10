# Simple truck analysis

Write-Host "=== TRUCK PAGES ANALYSIS ===" -ForegroundColor Green
Write-Host ""

$totalFiles = (Get-ChildItem "trucks_html\*.html").Count
$generatedFromYourData = 15

Write-Host "CURRENT STATUS:" -ForegroundColor Yellow
Write-Host "  Total HTML files: $totalFiles" -ForegroundColor White
Write-Host "  Generated from your JSON: $generatedFromYourData" -ForegroundColor Green
Write-Host "  Remaining to complete: $($totalFiles - $generatedFromYourData)" -ForegroundColor Red
Write-Host ""

$percentComplete = ($generatedFromYourData / $totalFiles * 100)
Write-Host "PROGRESS:" -ForegroundColor Cyan
Write-Host "  Completed: $($percentComplete.ToString('F1'))%" -ForegroundColor Green
Write-Host "  Remaining: $((100 - $percentComplete).ToString('F1'))%" -ForegroundColor Red
Write-Host ""

Write-Host "YOUR JSON DATA GENERATED:" -ForegroundColor Green
$completedFiles = @("E9-Van.html", "E9-Dump.html", "X9-Tow.html", "X9-4x4Dump.html", "X9-Aerial.html", "i9.html", "E6-Dump.html", "E6-Van.html", "E6-Crane.html", "X6-Dropside.html", "X6-AWD.html", "E1st-Tractor.html", "Z3-Tractor.html", "E3-Van.html", "E3-Tractor.html")
$completedFiles | ForEach-Object { Write-Host "  ✓ $_" -ForegroundColor White }

Write-Host ""
Write-Host "CONCLUSION:" -ForegroundColor Magenta
Write-Host "  You need to add JSON data for $($totalFiles - $generatedFromYourData) more truck models" -ForegroundColor Yellow
Write-Host "  to complete the entire Equipment King truck catalog." -ForegroundColor Yellow