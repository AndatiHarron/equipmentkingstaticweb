# PowerShell script to generate truck pages from user-provided JSON data with proper character handling

# User-provided JSON data with fixed special characters
$userJsonData = @'
{
  "trucks": {
    "LIGHT DUTY TRUCKS": {
      "category": "Light Duty Trucks",
      "description": "Compact trucks for city transport, logistics, and utility applications.",
      "series": {
        "E9 Series": {
          "seriesName": "E9 Series",
          "description": "Smart, city-friendly trucks with efficient performance for logistics and delivery.",
          "models": [
            {
              "id": "E9-VAN",
              "name": "E9 Van Truck",
              "fileName": "E9-Van.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX1046E3N13Q3310",
                "Driving Type": "4x2",
                "GVW": "≤8T",
                "Engine Power": "126-150 HP",
                "Wheelbase": "3300 mm",
                "Transmission": "5 Forward MT + 1 Reverse",
                "Tyres": "7.00R16 LT/8PR",
                "Fuel Tank": "130L Iron"
              },
              "features": [
                "Power steering",
                "Clutch booster",
                "Electric windows",
                "Central lock",
                "Remote key",
                "Air conditioner",
                "ABS"
              ],
              "applications": [
                "Transportation",
                "Commercial logistics",
                "Urban cargo delivery"
              ]
            },
            {
              "id": "E9-DUMP",
              "name": "E9 Dump Truck",
              "fileName": "E9-Dump.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX3123NP341",
                "Driving Type": "4x2",
                "GVW": "≤12T",
                "Engine Power": "140-160 HP",
                "Wheelbase": "3420 / 3800 mm",
                "Tyres": "8.25R20",
                "Fuel Tank": "130L Iron"
              },
              "features": [
                "High-strength chassis",
                "Airline seat",
                "Full steel cab",
                "Reinforced tyres"
              ],
              "applications": [
                "Commercial transport",
                "Construction logistics"
              ]
            }
          ]
        },
        "X9 Series": {
          "seriesName": "X9 Series",
          "description": "Versatile light trucks for specialized and off-road applications.",
          "models": [
            {
              "id": "X9-TOW",
              "name": "X9 Tow Truck",
              "fileName": "X9-Tow.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX5123TQZE2Y12B3310",
                "Driving Type": "4x2",
                "GVW": "≤12T",
                "Engine Power": "120 HP",
                "Wheelbase": "3300 mm",
                "Tyres": "8.25R16 / 16PR",
                "Fuel Tank": "130L Iron"
              },
              "features": [
                "Power steering",
                "Clutch booster",
                "Air conditioner",
                "ABS"
              ],
              "applications": [
                "Towing and recovery operations",
                "Municipal transport"
              ]
            },
            {
              "id": "X9-4X4DUMP",
              "name": "X9 4X4 Dump Truck",
              "fileName": "X9-4x4Dump.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX3163E2Y13B3620",
                "Driving Type": "4x4",
                "GVW": "≤16T",
                "Engine Power": "130 HP",
                "Wheelbase": "3600 mm",
                "Tyres": "9.00R20",
                "Fuel Tank": "130L Iron"
              },
              "features": [
                "All-wheel drive",
                "Leaf-spring suspension",
                "High reliability",
                "Damped suspension"
              ],
              "applications": [
                "Construction transport",
                "All-terrain logistics"
              ]
            },
            {
              "id": "X9-AERIAL",
              "name": "X9 Aerial Work Platform Truck",
              "fileName": "X9-Aerial.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX5123TQZE2Y14B3311",
                "Driving Type": "4x2",
                "GVW": "≤18T",
                "Engine Power": "140 HP",
                "Wheelbase": "3300 mm"
              },
              "features": [
                "Telescopic arms",
                "Fast lifting speed",
                "Safety protection systems"
              ],
              "applications": [
                "Aerial maintenance",
                "Utility services"
              ]
            }
          ]
        },
        "i9 Series": {
          "seriesName": "i9 (New Energy) Series",
          "description": "Electric/Hybrid next-generation trucks for sustainable transport.",
          "models": [
            {
              "id": "I9-NEW",
              "name": "i9 New Energy Truck",
              "fileName": "i9.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Range": "430 km",
                "Charging Time": "65 min (120 kW fast charge)",
                "Battery": "CATL 86.55/100.46 kWh",
                "Powertrain": "INOVANCE 3rd Gen Controller",
                "GVW": "6-8T"
              },
              "features": [
                "Electric Power Steering",
                "Brake energy recovery",
                "Fast charging technology"
              ],
              "applications": [
                "Urban logistics",
                "Low-emission transport"
              ]
            }
          ]
        }
      }
    },
    "MEDIUM DUTY TRUCKS": {
      "category": "Medium Duty Trucks",
      "description": "Durable mid-size trucks for logistics, construction, and transport.",
      "series": {
        "E6 Series": {
          "seriesName": "E6 Series",
          "description": "High-performance medium-duty trucks with strong load-bearing capacity.",
          "models": [
            {
              "id": "E6-DUMP",
              "name": "E6 Dump Truck",
              "fileName": "E6-Dump.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX3316K2Y35Q2360",
                "Driving Type": "8x4",
                "GVW": "≤35T",
                "Engine Power": "350-360 HP",
                "Wheelbase": "1950-2375+1350 mm",
                "Fuel Tank": "300L Aluminum"
              },
              "features": [
                "Airbag seat",
                "Automatic AC",
                "LCD instrument panel"
              ],
              "applications": [
                "Heavy transport",
                "Construction"
              ]
            },
            {
              "id": "E6-VAN",
              "name": "E6 Van Truck",
              "fileName": "E6-Van.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX1186K2Y24B5010",
                "Driving Type": "4x2",
                "GVW": "≤18T",
                "Engine Power": "220-270 HP",
                "Wheelbase": "5000-5600 mm",
                "Fuel Tank": "400L Aluminum"
              },
              "features": [
                "Oil-water separator",
                "Air Processing Unit",
                "Power steering",
                "ABS"
              ],
              "applications": [
                "Cargo logistics",
                "Urban transport"
              ]
            },
            {
              "id": "E6-CRANE",
              "name": "E6 Truck Mounted Crane",
              "fileName": "E6-Crane.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX5256JSQK2K26B5840",
                "Driving Type": "6x4",
                "GVW": "≤35T",
                "Engine Power": "260-300 HP",
                "Wheelbases": "5800+1300 mm",
                "Crane Lifting Capacity": "12 T"
              },
              "features": [
                "Power steering",
                "Remote key",
                "Air conditioner",
                "ABS"
              ],
              "applications": [
                "Construction",
                "Heavy lifting logistics"
              ]
            }
          ]
        },
        "X6 Series": {
          "seriesName": "X6 Series",
          "description": "Versatile medium-duty trucks with excellent off-road capabilities.",
          "models": [
            {
              "id": "X6-DROPSIDE",
              "name": "X6 Dropside Truck",
              "fileName": "X6-Dropside.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX1182GP5",
                "Driving Type": "4x2",
                "GCW": "≤18T",
                "Engine Power": "220 HP",
                "Wheelbase": "5600 mm"
              },
              "features": [
                "Airbag seat",
                "Low-rolling tires",
                "Optimized transmission"
              ],
              "applications": [
                "Transport",
                "Construction delivery"
              ]
            },
            {
              "id": "X6-AWD",
              "name": "X6 AWD Cargo Truck",
              "fileName": "X6-AWD.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX1186K2Y24B5010",
                "Driving Type": "4x4",
                "Engine Power": "210 HP",
                "Wheelbase": "5000 mm"
              },
              "features": [
                "All-wheel drive",
                "High-strength chassis",
                "Durable suspension"
              ],
              "applications": [
                "Off-road cargo transport",
                "Heavy logistics"
              ]
            }
          ]
        }
      }
    },
    "HEAVY DUTY TRUCKS": {
      "category": "Heavy Duty Trucks",
      "description": "High-power trucks for long-haul and industrial transport.",
      "series": {
        "E1st Series": {
          "seriesName": "E1st Series",
          "description": "Next-generation tractors with advanced technology and driver comfort.",
          "models": [
            {
              "id": "E1ST-TRACTOR",
              "name": "E1st Tractor",
              "fileName": "E1st-Tractor.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Engine": "Cummins 560 HP",
                "Transmission": "Eaton 16-speed AMT",
                "Axles": "Hande HDZ73/HDZ440",
                "Max Speed": "120 km/h",
                "GCW": "≤48,000 kg"
              },
              "features": [
                "ABS, ESC, AEBS",
                "360° view system",
                "LCD display",
                "Heated air seat"
              ],
              "applications": [
                "Long-haul transport",
                "Heavy logistics"
              ]
            }
          ]
        },
        "Z3 Series": {
          "seriesName": "Z3 Series",
          "description": "Tractor trucks with safety, comfort, and advanced control.",
          "models": [
            {
              "id": "Z3-TRACTOR",
              "name": "Z3 Tractor Truck",
              "fileName": "Z3-Tractor.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX4255C1M56B4540",
                "Driving Type": "6x4",
                "GCW": "≤49T",
                "Engine Power": "560 HP",
                "Fuel Tank": "700L + 300L Aluminum"
              },
              "features": [
                "AEBS, ESC",
                "Blind spot monitoring",
                "Heated air seat",
                "LED lights"
              ],
              "applications": [
                "Freight",
                "Heavy logistics"
              ]
            }
          ]
        },
        "E3 Series": {
          "seriesName": "E3 Series",
          "description": "Reliable heavy-duty models for cargo and towing applications.",
          "models": [
            {
              "id": "E3-VAN",
              "name": "E3 Van Truck",
              "fileName": "E3-Van.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX1186G3K29Q7010",
                "Driving Type": "4x2",
                "GVW": "≤18T",
                "Engine Power": "290 HP",
                "Fuel Tank": "400L Aluminum"
              },
              "features": [
                "Airbag seat",
                "Automatic AC",
                "LED headlights"
              ],
              "applications": [
                "Commercial logistics",
                "Freight delivery"
              ]
            },
            {
              "id": "E3-TRACTOR",
              "name": "E3 Tractor Truck",
              "fileName": "E3-Tractor.html",
              "mainImage": "../assets/back2.jpeg",
              "specifications": {
                "Model": "SX4256G3M44Q3240",
                "Driving Type": "6x4",
                "GVW": "≤49T",
                "Engine Power": "440-470 HP",
                "Fuel Tank": "600L/800L Aluminum"
              },
              "features": [
                "Airbag seat",
                "LED lights",
                "LCD instrument"
              ],
              "applications": [
                "Long-distance hauling",
                "Industrial logistics"
              ]
            }
          ]
        }
      }
    }
  }
}
'@

# Parse JSON data
$data = $userJsonData | ConvertFrom-Json

# Function to clean special characters for HTML
function Clean-HTMLText {
    param($text)
    return $text -replace "×", "x" -replace "–", "-" -replace "≤", "&le;" -replace "°", "&deg;"
}

# Function to create HTML content for truck page
function Create-TruckHTML {
    param($truck, $categoryName, $seriesName)
    
    # Convert specifications object to HTML
    $specsHtml = ""
    if ($truck.specifications) {
        $truck.specifications.PSObject.Properties | ForEach-Object {
            $cleanValue = Clean-HTMLText $_.Value
            $specsHtml += "                                        <tr><td><strong>$($_.Name)</strong></td><td>$cleanValue</td></tr>`n"
        }
    }
    
    # Convert features array to HTML
    $featuresHtml = ""
    if ($truck.features) {
        $truck.features | ForEach-Object {
            $featuresHtml += "                                <li>$_</li>`n"
        }
    }
    
    # Convert applications array to HTML
    $applicationsHtml = ""
    if ($truck.applications) {
        $truck.applications | ForEach-Object {
            $applicationsHtml += "                                <li>$_</li>`n"
        }
    }

    return @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($truck.name) - Equipment King</title>
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
                                    <div class="series-header">X9 Series ></div>
                                    <div class="series-models">
                                        <a href="X9-Tow.html">X9 Tow Truck</a>
                                        <a href="X9-4x4Dump.html">X9 4X4 Dump Truck</a>
                                        <a href="X9-Aerial.html">X9 Aerial Work Platform</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">E9 Series ></div>
                                    <div class="series-models">
                                        <a href="E9-Van.html">E9 Van Truck</a>
                                        <a href="E9-Dump.html">E9 Dump Truck</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">i9 Series ></div>
                                    <div class="series-models">
                                        <a href="i9.html">i9 New Energy Truck</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-category">
                                <h4>Medium Duty</h4>
                                <div class="dropdown-series">
                                    <div class="series-header">E6 Series ></div>
                                    <div class="series-models">
                                        <a href="E6-Dump.html">E6 Dump Truck</a>
                                        <a href="E6-Van.html">E6 Van Truck</a>
                                        <a href="E6-Crane.html">E6 Truck Mounted Crane</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">X6 Series ></div>
                                    <div class="series-models">
                                        <a href="X6-Dropside.html">X6 Dropside Truck</a>
                                        <a href="X6-AWD.html">X6 AWD Cargo Truck</a>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-category">
                                <h4>Heavy Duty</h4>
                                <div class="dropdown-series">
                                    <div class="series-header">E1st Series ></div>
                                    <div class="series-models">
                                        <a href="E1st-Tractor.html">E1st Tractor</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">Z3 Series ></div>
                                    <div class="series-models">
                                        <a href="Z3-Tractor.html">Z3 Tractor Truck</a>
                                    </div>
                                </div>
                                <div class="dropdown-series">
                                    <div class="series-header">E3 Series ></div>
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
                        <img src="$($truck.mainImage)" alt="$($truck.name)" class="truck-main-image">
                    </div>
                    <div class="hero-content">
                        <div class="breadcrumb">
                            <span>$categoryName</span> | <span>$seriesName</span>
                        </div>
                        <h1 class="truck-title">$($truck.name)</h1>
                        <div class="truck-category">$categoryName</div>
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
</body>
</html>
"@
}

# Generate HTML files for each truck
Write-Host "Generating truck pages from user data..." -ForegroundColor Green

$data.trucks.PSObject.Properties | ForEach-Object {
    $categoryKey = $_.Name
    $category = $_.Value
    $categoryName = $category.category
    
    Write-Host "Processing category: $categoryName" -ForegroundColor Yellow
    
    $category.series.PSObject.Properties | ForEach-Object {
        $seriesKey = $_.Name
        $series = $_.Value
        $seriesName = $series.seriesName
        
        Write-Host "  Processing series: $seriesName" -ForegroundColor Cyan
        
        $series.models | ForEach-Object {
            $truck = $_
            $fileName = $truck.fileName
            $filePath = "trucks_html\$fileName"
            
            Write-Host "    Creating: $fileName" -ForegroundColor White
            
            $htmlContent = Create-TruckHTML -truck $truck -categoryName $categoryName -seriesName $seriesName
            [System.IO.File]::WriteAllText($filePath, $htmlContent, [System.Text.Encoding]::UTF8)
        }
    }
}

Write-Host "Truck page generation completed!" -ForegroundColor Green
Write-Host "Generated pages for all trucks specified in the user data." -ForegroundColor Yellow