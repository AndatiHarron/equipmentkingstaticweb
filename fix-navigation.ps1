# Fix Navigation Links Script

$truckFiles = @(
    "X6-Dust-Suppression-Truck.html",
    "E6-Compactor-Garbage-Truck.html", 
    "Z3-Tractor-Truck.html",
    "9-Series-Sweeper.html",
    "6-Series-Sweeper.html",
    "9-Series-Garbage-Truck.html"
)

foreach ($file in $truckFiles) {
    Write-Host "Fixing navigation in: $file" -ForegroundColor Yellow
    
    $content = Get-Content "trucks_html\$file" -Raw
    
    # Fix dropdown navigation to point to working truck pages instead of main_trucks_detailed
    $content = $content -replace 'href="../main_trucks_detailed/E6.html"', 'href="../trucks_html/E6-Compactor-Garbage-Truck.html"'
    $content = $content -replace 'href="../main_trucks_detailed/E9.html"', 'href="../trucks.html#e9-series"'
    $content = $content -replace 'href="../main_trucks_detailed/X6.html"', 'href="../trucks_html/X6-Dust-Suppression-Truck.html"'
    $content = $content -replace 'href="../main_trucks_detailed/X9.html"', 'href="../trucks.html#x9-series"'
    $content = $content -replace 'href="../main_trucks_detailed/i9.html"', 'href="../trucks.html#i9-series"'
    $content = $content -replace 'href="../main_trucks_detailed/Z3_6.html"', 'href="../trucks_html/Z3-Tractor-Truck.html"'
    $content = $content -replace 'href="../main_trucks_detailed/E3.html"', 'href="../trucks.html#e3-series"'
    $content = $content -replace 'href="../main_trucks_detailed/E1st.html"', 'href="../trucks.html#e1-series"'
    
    [System.IO.File]::WriteAllText("trucks_html\$file", $content, [System.Text.Encoding]::UTF8)
    Write-Host "  Updated navigation links" -ForegroundColor Green
}

Write-Host "All truck page navigation links updated!" -ForegroundColor Green