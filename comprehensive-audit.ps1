# Comprehensive Link Audit and Fix Script for Equipment King

Write-Host "=== EQUIPMENT KING PROJECT AUDIT ===" -ForegroundColor Cyan

# Fix index.html paths
Write-Host "1. Fixing index.html navigation paths..." -ForegroundColor Yellow
$indexContent = Get-Content "index.html" -Raw

# Fix all the ../equipmentking/ paths in index.html
$indexContent = $indexContent -replace "location\.href='\.\.\/equipmentking\/", "location.href='"
$indexContent = $indexContent -replace 'href="\.\.\/equipmentking\/', 'href="'
$indexContent = $indexContent -replace "href='\.\.\/equipmentking\/", "href='"

[System.IO.File]::WriteAllText("index.html", $indexContent, [System.Text.Encoding]::UTF8)
Write-Host "   ✓ Fixed index.html navigation paths" -ForegroundColor Green

# Check if CSS and JS files exist
Write-Host "2. Verifying core assets..." -ForegroundColor Yellow
if (Test-Path "css\styles.css") {
    Write-Host "   ✓ css/styles.css exists" -ForegroundColor Green
} else {
    Write-Host "   ✗ css/styles.css MISSING" -ForegroundColor Red
}

if (Test-Path "js\scripts.js") {
    Write-Host "   ✓ js/scripts.js exists" -ForegroundColor Green
} else {
    Write-Host "   ✗ js/scripts.js MISSING" -ForegroundColor Red
}

# Check main HTML files
Write-Host "3. Checking main HTML files..." -ForegroundColor Yellow
$mainFiles = @("index.html", "trucks.html", "about.html", "application.html")
foreach ($file in $mainFiles) {
    if (Test-Path $file) {
        Write-Host "   ✓ $file exists" -ForegroundColor Green
    } else {
        Write-Host "   ✗ $file MISSING" -ForegroundColor Red
    }
}

# Check trucks_html directory
Write-Host "4. Checking truck pages..." -ForegroundColor Yellow
if (Test-Path "trucks_html") {
    $truckFiles = Get-ChildItem "trucks_html" -Filter "*.html"
    Write-Host "   ✓ trucks_html directory exists with $($truckFiles.Count) pages" -ForegroundColor Green
    
    # List all truck pages
    foreach ($truck in $truckFiles) {
        Write-Host "     - $($truck.Name)" -ForegroundColor Gray
    }
} else {
    Write-Host "   ✗ trucks_html directory MISSING" -ForegroundColor Red
}

# Check key image assets
Write-Host "5. Checking critical image assets..." -ForegroundColor Yellow
$criticalImages = @(
    "assets\hero_section\front1.webp",
    "assets\hero_section\truck-hero-bg.jpg", 
    "assets\back2.jpeg",
    "assets\trucks\x6dustsuppressiontrucks\Screenshot 2025-11-05 002130.webp"
)

foreach ($img in $criticalImages) {
    if (Test-Path $img) {
        Write-Host "   ✓ $img exists" -ForegroundColor Green
    } else {
        Write-Host "   ✗ $img MISSING" -ForegroundColor Red
    }
}

Write-Host "`n=== AUDIT COMPLETE ===" -ForegroundColor Cyan
Write-Host "Please review any red ✗ items above for issues to fix." -ForegroundColor White