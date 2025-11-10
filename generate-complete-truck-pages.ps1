# Comprehensive Truck Page Generator with Image Galleries and Full Content

Write-Host "=== GENERATING COMPLETE TRUCK PAGES WITH IMAGE GALLERIES ===" -ForegroundColor Green
Write-Host ""

# Function to get images for a truck type
function Get-TruckImages {
    param($truckType)
    
    $imagePaths = @()
    $truckFolder = ""
    
    # Map truck types to folder names
    switch -Regex ($truckType) {
        "E9.*Van" { $truckFolder = "e9vantrucks" }
        "E9.*Dump" { $truckFolder = "e9dumptruck" }
        "E9.*Refrigerated" { $truckFolder = "e9refrigeratedtrucks" }
        "E9.*Kitchen.*Waste" { $truckFolder = "e9kitchenwastefoodgarbagetrucks" }
        "X9.*Tow" { $truckFolder = "x9towtrucks" }
        "X9.*4x4.*Dump|X9.*4X4.*Dump" { $truckFolder = "x94x4dumptrucks" }
        "X9.*Aerial" { $truckFolder = "x9aerialplatformtrucks" }
        "X9.*Dump" { $truckFolder = "x9dumptrucks" }
        "X9.*Van" { $truckFolder = "x9vantrucks" }
        "X9.*Garbage" { $truckFolder = "x9garbagetrucks" }
        "X9.*Refrigerated" { $truckFolder = "x9refrigeratedtrucks" }
        "X9.*Fuel.*Tanker" { $truckFolder = "x9fueltankertrucks" }
        "E6.*Van" { $truckFolder = "e6vantrucks" }
        "E6.*Dump" { $truckFolder = "e6dumptrucks" }
        "E6.*Cement.*Mixer" { $truckFolder = "e6cementmixertrucks" }
        "E6.*Refrigerated" { $truckFolder = "e6refrigeratedtruck" }
        "E6.*Sprinkler" { $truckFolder = "e6sprinklertrucks" }
        "E6.*Stake" { $truckFolder = "e6staketrucks" }
        "E6.*Crane|E6.*Truck.*Mounted.*Crane" { $truckFolder = "e6truckmountedcrane" }
        "X6.*AWD" { $truckFolder = "x6awdcargotrucks" }
        "X6.*Cargo" { $truckFolder = "x6cargotrucks" }
        "X6.*Dropside" { $truckFolder = "x6dropsidetrucks" }
        "X6.*Dump" { $truckFolder = "x6dumptrucks" }
        "X6.*Cement.*Mixer" { $truckFolder = "x6cementmixertsucks" }
        "X6.*Concrete.*Mixer" { $truckFolder = "x6concretemixertrucks" }
        "X6.*Flatbed" { $truckFolder = "x6flatbeds" }
        "X6.*Fuel.*Tanker" { $truckFolder = "x6fueltanker" }
        "X6.*Garbage" { $truckFolder = "x6garbagetrucks" }
        "X6.*Loading.*Crane" { $truckFolder = "x6loadingcranerecoverytruck" }
        "X6.*Sprinkler" { $truckFolder = "x6sprinklertrucks" }
        "X6.*Truck.*Mounted.*Crane" { $truckFolder = "x6truckmountedcranes" }
        "X6.*Van" { $truckFolder = "x6vantrucks" }
        "X6.*Dust.*Suppression" { $truckFolder = "x6dustsuppressiontrucks" }
        "X7.*Concrete.*Mixer" { $truckFolder = "x7concretemixertrucks" }
        "X7.*Dump" { $truckFolder = "x7dumptrucks" }
        "X7.*Flatbed" { $truckFolder = "x7flatbedtrucks" }
        "X7.*Sprinkler" { $truckFolder = "x7sprinklertrucks" }
        "X7.*Truck.*Mounted.*Crane" { $truckFolder = "x7truckmountedcrane" }
        "i9" { $truckFolder = "i9" }
        default { $truckFolder = "" }
    }
    
    if ($truckFolder -and (Test-Path "assets\trucks\$truckFolder")) {
        $images = Get-ChildItem "assets\trucks\$truckFolder\*" -Include *.webp, *.jpg, *.png, *.jpeg
        foreach ($img in $images) {
            $imagePaths += "../assets/trucks/$truckFolder/$($img.Name)"
        }
    }
    
    # If no images found, use placeholder
    if ($imagePaths.Count -eq 0) {
        $imagePaths += "../assets/back2.jpeg"
    }
    
    return $imagePaths
}

# Function to create truck data with specifications, features, and applications
function Get-TruckData {
    param($fileName)
    
    $truckData = @{}
    
    switch -Regex ($fileName) {
        "9-Series-Sweeper" {
            $truckData = @{
                name = "9 Series Sweeper"
                category = "Heavy Duty Trucks"
                series = "9 Series"
                specifications = @{
                    "Model" = "SX5160TSLE3"
                    "GVW" = "≤16T"
                    "Engine Power" = "180-220 HP"
                    "Sweeping Width" = "3200mm"
                    "Hopper Capacity" = "8-12 cubic meters"
                    "Water Tank" = "2000L"
                    "Fuel Tank" = "200L Steel"
                }
                features = @(
                    "Four rotating brushes system",
                    "High-efficiency vacuum suction",
                    "Hydraulic lifting hopper",
                    "Water spray dust suppression",
                    "LED warning lights",
                    "Automatic brush pressure adjustment",
                    "Left and right side brushes"
                )
                applications = @(
                    "Municipal street cleaning",
                    "Highway maintenance", 
                    "Airport runway cleaning",
                    "Industrial site sweeping",
                    "Construction debris removal"
                )
            }
        }
        "6-Series-Sweeper" {
            $truckData = @{
                name = "6 Series Sweeper"
                category = "Heavy Duty Trucks"
                series = "6 Series"
                specifications = @{
                    "Model" = "SX5120TSLE3"
                    "GVW" = "≤12T"
                    "Engine Power" = "140-180 HP"
                    "Sweeping Width" = "2800mm"
                    "Hopper Capacity" = "6-8 cubic meters"
                    "Water Tank" = "1500L"
                    "Fuel Tank" = "150L Steel"
                }
                features = @(
                    "Compact design for urban areas",
                    "Efficient brush system",
                    "Dust suppression system",
                    "Easy maintenance access",
                    "Hydraulic operation"
                )
                applications = @(
                    "City street cleaning",
                    "Residential area maintenance",
                    "Small road cleaning",
                    "Parking lot sweeping"
                )
            }
        }
        "9-Series-Garbage-Truck" {
            $truckData = @{
                name = "9 Series Garbage Truck"
                category = "Heavy Duty Trucks"
                series = "9 Series"
                specifications = @{
                    "Model" = "SX5160ZYSE3"
                    "GVW" = "≤16T"
                    "Engine Power" = "180-220 HP"
                    "Loading Capacity" = "12-16 cubic meters"
                    "Compression Ratio" = "3:1"
                    "Fuel Tank" = "200L Steel"
                }
                features = @(
                    "Rear loading system",
                    "Hydraulic compression",
                    "Automated loading cycle",
                    "Leak-proof body design",
                    "Safety backup systems"
                )
                applications = @(
                    "Municipal waste collection",
                    "Commercial garbage pickup",
                    "Industrial waste management",
                    "Recyclable material collection"
                )
            }
        }
        "X6-Dust-Suppression-Truck" {
            $truckData = @{
                name = "X6 Dust Suppression Truck"
                category = "Medium Duty Trucks"
                series = "X6 Series"
                specifications = @{
                    "Model" = "SX5140TDYE3"
                    "GVW" = "≤14T"
                    "Engine Power" = "160-200 HP"
                    "Water Tank" = "8000-12000L"
                    "Spray Range" = "20-50 meters"
                    "Pump Flow Rate" = "100-200 L/min"
                }
                features = @(
                    "High-pressure mist cannon",
                    "360-degree rotating nozzle",
                    "Remote control operation",
                    "Adjustable spray angle",
                    "Large capacity water tank"
                )
                applications = @(
                    "Construction site dust control",
                    "Mining dust suppression",
                    "Demolition site cleaning",
                    "Air quality improvement"
                )
            }
        }
        default {
            # Generic truck data based on series and type
            $name = ($fileName -replace "\.html", "") -replace "-", " "
            $series = ""
            $category = "Commercial Trucks"
            
            if ($fileName -match "^(E3|E6|E9|X6|X7|X9|Z3|i9)") {
                $series = $matches[1] + " Series"
                if ($matches[1] -in @("E3", "E6", "E9")) {
                    $category = if ($matches[1] -eq "E9") { "Light Duty Trucks" } 
                              elseif ($matches[1] -eq "E6") { "Medium Duty Trucks" } 
                              else { "Heavy Duty Trucks" }
                } elseif ($matches[1] -in @("X6", "X7")) {
                    $category = "Medium Duty Trucks"
                } elseif ($matches[1] -eq "X9") {
                    $category = "Light Duty Trucks"
                } else {
                    $category = "Heavy Duty Trucks"
                }
            } elseif ($fileName -match "^(3|6|9)-Series") {
                $series = $matches[1] + " Series"
                $category = "Heavy Duty Trucks"
            }
            
            $truckData = @{
                name = $name
                category = $category
                series = $series
                specifications = @{
                    "Model" = "Standard Configuration"
                    "Engine Type" = "Turbocharged Diesel"
                    "Transmission" = "Manual/Automatic"
                    "Drive Type" = "4x2/6x4"
                    "Fuel Tank" = "Standard Capacity"
                }
                features = @(
                    "Reliable performance",
                    "Efficient operation",
                    "Easy maintenance",
                    "Safety systems",
                    "Comfortable cab"
                )
                applications = @(
                    "Commercial transport",
                    "Industrial operations",
                    "Construction work",
                    "Municipal services"
                )
            }
        }
    }
    
    return $truckData
}

# Function to create complete HTML with image gallery
function Create-CompleteHTML {
    param($fileName, $truckData, $images)
    
    # Build image gallery HTML
    $mainImage = $images[0]
    $galleryHtml = ""
    $thumbnailsHtml = ""
    
    for ($i = 0; $i -lt $images.Count; $i++) {
        $isActive = if ($i -eq 0) { "active" } else { "" }
        $thumbnailsHtml += "<div class='gallery-thumbnail $isActive' onclick='changeMainImage(""$($images[$i])"", $i)'><img src='$($images[$i])' alt='$($truckData.name) view $($i+1)'></div>"
    }
    
    # Build specifications HTML
    $specsHtml = ""
    $truckData.specifications.GetEnumerator() | ForEach-Object {
        $specsHtml += "<tr><td><strong>$($_.Key)</strong></td><td>$($_.Value)</td></tr>"
    }
    
    # Build features HTML
    $featuresHtml = ""
    $truckData.features | ForEach-Object {
        $featuresHtml += "<li>$_</li>"
    }
    
    # Build applications HTML
    $applicationsHtml = ""
    $truckData.applications | ForEach-Object {
        $applicationsHtml += "<li>$_</li>"
    }

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($truckData.name) - Equipment King</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="truck-page-container">
        <!-- Header -->
        <header class="main-header">
            <div class="header-container">
                <div class="logo">
                    <h2>Equipment King</h2>
                </div>
                <nav class="main-nav">
                    <div class="nav-item">
                        <a href="../index.html">Home</a>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="../trucks.html">Trucks ▼</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-category">
                                <h4>Light Duty</h4>
                                <div class="dropdown-series">
                                    <div class="series-header">X9 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="X9-Tow.html">X9 Tow Truck</a>
                                        <a href="X9-4x4Dump.html">X9 4X4 Dump Truck</a>
                                        <a href="X9-Aerial.html">X9 Aerial Work Platform</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">E9 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="E9-Van.html">E9 Van Truck</a>
                                        <a href="E9-Dump.html">E9 Dump Truck</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">i9 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="i9.html">i9 New Energy Truck</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-category">
                                <h4>Medium Duty</h4>
                                <div class="dropdown-series">
                                    <div class="series-header">E6 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="E6-Dump.html">E6 Dump Truck</a>
                                        <a href="E6-Van.html">E6 Van Truck</a>
                                        <a href="E6-Crane.html">E6 Truck Mounted Crane</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">X6 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="X6-Dropside.html">X6 Dropside Truck</a>
                                        <a href="X6-AWD.html">X6 AWD Cargo Truck</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-category">
                                <h4>Heavy Duty</h4>
                                <div class="dropdown-series">
                                    <div class="series-header">E1st Series &gt;</div>
                                    <div class="series-models">
                                        <a href="E1st-Tractor.html">E1st Tractor</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">Z3 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="Z3-Tractor.html">Z3 Tractor Truck</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">E3 Series &gt;</div>
                                    <div class="series-models">
                                        <a href="E3-Van.html">E3 Van Truck</a>
                                        <a href="E3-Tractor.html">E3 Tractor Truck</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="nav-item">
                        <a href="../about.html">About</a>
                    </div>
                    <div class="nav-item">
                        <a href="../contact.html">Contact</a>
                    </div>
                    <div class="nav-item">
                        <a href="../application.html">Application</a>
                    </div>
                </nav>
            </div>
        </header>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Truck Hero Section -->
            <section class="truck-hero">
                <div class="hero-container">
                    <div class="hero-image">
                        <div class="image-gallery">
                            <div class="main-image-container">
                                <img id="mainImage" src="$mainImage" alt="$($truckData.name)" class="truck-main-image">
                            </div>
                            <div class="gallery-thumbnails">
                                $thumbnailsHtml
                            </div>
                        </div>
                    </div>
                    <div class="hero-content">
                        <div class="breadcrumb">
                            <span>$($truckData.category)</span> | <span>$($truckData.series)</span>
                        </div>
                        <h1 class="truck-title">$($truckData.name)</h1>
                        <div class="truck-category">$($truckData.category)</div>
                    </div>
                </div>
            </section>

            <!-- Truck Details -->
            <section class="truck-details">
                <div class="details-container">
                    <div class="details-grid">
                        <!-- Specifications -->
                        <div class="detail-section">
                            <h2>Technical Specifications</h2>
                            <div class="specs-table">
                                <table>
                                    <tbody>
                                        $specsHtml
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Features -->
                        <div class="detail-section">
                            <h2>Key Features</h2>
                            <ul class="features-list">
                                $featuresHtml
                            </ul>
                        </div>

                        <!-- Applications -->
                        <div class="detail-section">
                            <h2>Applications</h2>
                            <ul class="applications-list">
                                $applicationsHtml
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="main-footer">
            <div class="footer-container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>Equipment King</h3>
                        <p>Your trusted partner for commercial vehicles and equipment solutions.</p>
                    </div>
                    <div class="footer-section">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="../index.html">Home</a></li>
                            <li><a href="../trucks.html">Trucks</a></li>
                            <li><a href="../about.html">About</a></li>
                            <li><a href="../contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <div class="footer-section">
                        <h4>Contact Info</h4>
                        <p>📞 +1 (555) 123-4567</p>
                        <p>📧 info@equipmentking.com</p>
                        <p>📍 123 Industrial Ave, City, State 12345</p>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2024 Equipment King. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>

    <script>
        function changeMainImage(imageSrc, index) {
            document.getElementById('mainImage').src = imageSrc;
            
            // Remove active class from all thumbnails
            document.querySelectorAll('.gallery-thumbnail').forEach(thumb => {
                thumb.classList.remove('active');
            });
            
            // Add active class to clicked thumbnail
            document.querySelectorAll('.gallery-thumbnail')[index].classList.add('active');
        }
    </script>
</body>
</html>
"@

    return $html
}

# Get all HTML files that need content
$allHtmlFiles = Get-ChildItem "trucks_html\*.html" | Where-Object { 
    $_.Name -notin @("E9-Van.html", "E9-Dump.html", "X9-Tow.html", "X9-4x4Dump.html", "X9-Aerial.html", "i9.html", "E6-Dump.html", "E6-Van.html", "E6-Crane.html", "X6-Dropside.html", "X6-AWD.html", "E1st-Tractor.html", "Z3-Tractor.html", "E3-Van.html", "E3-Tractor.html") -and
    $_.Name -notlike "*.ps1"
}

Write-Host "Found $($allHtmlFiles.Count) files to regenerate with complete content and image galleries" -ForegroundColor Cyan
Write-Host ""

# Generate first batch of priority trucks
$priorityTrucks = @("9-Series-Sweeper.html", "6-Series-Sweeper.html", "9-Series-Garbage-Truck.html", "X6-Dust-Suppression-Truck.html", "E3-Muck-Truck.html", "E3-Sewage-Suction-Truck.html")

foreach ($fileName in $priorityTrucks) {
    if (Test-Path "trucks_html\$fileName") {
        Write-Host "Generating: $fileName" -ForegroundColor Yellow
        
        $truckData = Get-TruckData $fileName
        $images = Get-TruckImages $truckData.name
        $htmlContent = Create-CompleteHTML $fileName $truckData $images
        
        [System.IO.File]::WriteAllText("trucks_html\$fileName", $htmlContent, [System.Text.Encoding]::UTF8)
        Write-Host "  ✓ Generated with $($images.Count) images" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Priority truck pages generated successfully!" -ForegroundColor Green
Write-Host "These include image galleries, proper specifications, features, and applications." -ForegroundColor Cyan