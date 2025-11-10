# Script to generate all truck pages from JSON data
param([string]$JsonFile = "truck-data-template.json")

# Read JSON data
$jsonContent = Get-Content $JsonFile -Raw | ConvertFrom-Json

# Function to generate HTML for each truck
function Generate-TruckHTML {
    param(
        [object]$truck,
        [string]$series,
        [string]$seriesDescription,
        [string]$category
    )
    
    # Determine color scheme based on series
    $colorScheme = switch ($series) {
        "X9" { @{primary = "#007bff"; secondary = "#0056b3"; gradient = "linear-gradient(135deg, #007bff, #0056b3)" } }
        "E9" { @{primary = "#28a745"; secondary = "#20c997"; gradient = "linear-gradient(135deg, #28a745, #20c997)" } }
        "X7" { @{primary = "#fd7e14"; secondary = "#e63946"; gradient = "linear-gradient(135deg, #fd7e14, #e63946)" } }
        "E6" { @{primary = "#6f42c1"; secondary = "#e83e8c"; gradient = "linear-gradient(135deg, #6f42c1, #e83e8c)" } }
        "X6" { @{primary = "#0dcaf0"; secondary = "#0d6efd"; gradient = "linear-gradient(135deg, #0dcaf0, #0d6efd)" } }
        "E3" { @{primary = "#dc3545"; secondary = "#c82333"; gradient = "linear-gradient(135deg, #dc3545, #c82333)" } }
        "E1st" { @{primary = "#6c757d"; secondary = "#5a6268"; gradient = "linear-gradient(135deg, #6c757d, #5a6268)" } }
        "Z3" { @{primary = "#495057"; secondary = "#343a40"; gradient = "linear-gradient(135deg, #495057, #343a40)" } }
        "i9" { @{primary = "#17a2b8"; secondary = "#138496"; gradient = "linear-gradient(135deg, #17a2b8, #138496)" } }
        "AerialWork" { @{primary = "#ffc107"; secondary = "#e0a800"; gradient = "linear-gradient(135deg, #ffc107, #e0a800)" } }
        "Recovery" { @{primary = "#fd7e14"; secondary = "#e63946"; gradient = "linear-gradient(135deg, #fd7e14, #e63946)" } }
        "4x4Series" { @{primary = "#795548"; secondary = "#5d4037"; gradient = "linear-gradient(135deg, #795548, #5d4037)" } }
        "3Series" { @{primary = "#9c27b0"; secondary = "#7b1fa2"; gradient = "linear-gradient(135deg, #9c27b0, #7b1fa2)" } }
        "6Series" { @{primary = "#3f51b5"; secondary = "#303f9f"; gradient = "linear-gradient(135deg, #3f51b5, #303f9f)" } }
        "9Series" { @{primary = "#ff5722"; secondary = "#d84315"; gradient = "linear-gradient(135deg, #ff5722, #d84315)" } }
        "E3Legacy" { @{primary = "#8bc34a"; secondary = "#689f38"; gradient = "linear-gradient(135deg, #8bc34a, #689f38)" } }
        "E6Legacy" { @{primary = "#ff9800"; secondary = "#f57c00"; gradient = "linear-gradient(135deg, #ff9800, #f57c00)" } }
        "X6Legacy" { @{primary = "#00bcd4"; secondary = "#0097a7"; gradient = "linear-gradient(135deg, #00bcd4, #0097a7)" } }
        default { @{primary = "#007bff"; secondary = "#0056b3"; gradient = "linear-gradient(135deg, #007bff, #0056b3)" } }
    }
    
    # Build specifications table
    $specRows = ""
    foreach ($spec in $truck.specifications.PSObject.Properties) {
        $label = $spec.Name -replace "([A-Z])", " `$1" -replace "^(.)", { $_.Value.ToUpper() }
        $specRows += "<tr><td style='padding: 8px 0; border-bottom: 1px solid #eee; font-weight: bold;'>$($label):</td><td style='padding: 8px 0; border-bottom: 1px solid #eee;'>$($spec.Value)</td></tr>`n"
    }
    
    # Create HTML content
    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/header-footer-loader.js"></script>
    <title>$($truck.name) - Equipment King</title>
    <meta name="description" content="$($truck.name) - $($truck.description)">
</head>
<body>
    <div id="header-placeholder"></div>

    <main style="padding: 80px 20px 40px; max-width: 1200px; margin: 0 auto; background: white;">
        <!-- Breadcrumb Navigation -->
        <nav style="margin-bottom: 20px; font-size: 14px; color: #666;">
            <a href="../index.html" style="color: #007bff; text-decoration: none;">Home</a> > 
            <a href="../trucks.html" style="color: #007bff; text-decoration: none;">Trucks</a> > 
            <span style="color: #333;">$($truck.name)</span>
        </nav>

        <!-- Hero Section -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 40px; align-items: center;">
            <div>
                <h1 style="color: #333; margin-bottom: 15px; font-size: 2.5em; line-height: 1.2;">$($truck.name)</h1>
                <div style="background: $($colorScheme.gradient); color: white; padding: 20px; border-radius: 8px; margin-bottom: 20px;">
                    <h2 style="margin: 0 0 10px 0; font-size: 1.3em;">$($series) Series - $($category)</h2>
                    <p style="margin: 0; opacity: 0.9; line-height: 1.6;">$($seriesDescription)</p>
                </div>
            </div>
            <div style="text-align: center;">
                <img src="$($truck.mainImage)" alt="$($truck.name)" 
                     style="max-width: 100%; height: auto; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);"
                     onerror="this.src='../assets/back2.jpeg'">
            </div>
        </div>

        <!-- Description Section -->
        <section style="margin-bottom: 40px; background: #f8f9fa; padding: 30px; border-radius: 10px;">
            <h2 style="color: #333; margin-bottom: 20px; font-size: 1.8em; border-bottom: 3px solid $($colorScheme.primary); padding-bottom: 10px;">Product Description</h2>
            <p style="font-size: 1.1em; line-height: 1.7; color: #555; margin: 0;">
                $($truck.description)
            </p>
        </section>

        <!-- Specifications Section -->
        <section style="margin-bottom: 40px;">
            <h2 style="color: #333; margin-bottom: 25px; font-size: 1.8em; border-bottom: 3px solid $($colorScheme.primary); padding-bottom: 10px;">Technical Specifications</h2>
            <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); max-width: 600px;">
                <h3 style="color: $($colorScheme.primary); margin-bottom: 15px; font-size: 1.3em;">Specifications</h3>
                <table style="width: 100%; border-collapse: collapse;">
                    $specRows
                </table>
            </div>
        </section>

        <!-- Call-to-Action Section -->
        <section style="background: $($colorScheme.gradient); color: white; padding: 40px; border-radius: 15px; text-align: center;">
            <h2 style="margin-bottom: 20px; font-size: 2em;">Interested in the $($truck.name)?</h2>
            <p style="font-size: 1.2em; margin-bottom: 30px; opacity: 0.9;">Contact our team for detailed specifications, pricing, and availability.</p>
            <div style="display: flex; gap: 20px; justify-content: center; flex-wrap: wrap;">
                <a href="../application.html" 
                   style="background: #28a745; color: white; padding: 15px 30px; border-radius: 25px; text-decoration: none; font-weight: bold; display: inline-block; transition: all 0.3s ease;">
                   Request Quote
                </a>
                <a href="../about.html" 
                   style="background: transparent; color: white; padding: 15px 30px; border: 2px solid white; border-radius: 25px; text-decoration: none; font-weight: bold; display: inline-block; transition: all 0.3s ease;">
                   Learn More
                </a>
            </div>
        </section>
    </main>

    <div id="footer-placeholder"></div>

    <script>
        // Auto-update footer year
        if(document.getElementById('year')) {
            document.getElementById('year').textContent = new Date().getFullYear();
        }
    </script>
</body>
</html>
"@
    
    return $html
}

# Process all truck series
Write-Host "Generating truck pages from JSON data..." -ForegroundColor Green

$totalTrucks = 0
foreach ($category in $jsonContent.trucks.PSObject.Properties) {
    $categoryData = $category.Value
    Write-Host "`nProcessing $($categoryData.category)..." -ForegroundColor Yellow
    
    foreach ($series in $categoryData.series.PSObject.Properties) {
        $seriesData = $series.Value
        Write-Host "  Processing $($seriesData.seriesName)..." -ForegroundColor Cyan
        
        foreach ($truck in $seriesData.models) {
            if ($truck.fileName) {
                $filePath = "trucks_html\$($truck.fileName)"
                $html = Generate-TruckHTML -truck $truck -series $series.Name -seriesDescription $seriesData.description -category $categoryData.category
                
                # Write HTML file
                Set-Content -Path $filePath -Value $html -Encoding UTF8
                Write-Host "    ✅ Generated: $($truck.fileName)" -ForegroundColor Green
                $totalTrucks++
            }
        }
    }
}

Write-Host "`n🎉 Successfully generated $totalTrucks truck pages!" -ForegroundColor Green
Write-Host "All pages have uniform headers, footers, and styling based on your JSON data." -ForegroundColor Yellow