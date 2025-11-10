# Comprehensive truck page generator with complete specifications

$truckData = @{
    "X6-Dust-Suppression-Truck.html" = @{
        Name = "X6 Dust Suppression Truck"
        Category = "Environmental Control Vehicle"
        Specs = @{
            "Engine" = "Turbocharged Diesel 6.7L"
            "Transmission" = "6-Speed Manual"
            "Drive Type" = "6x4"
            "Water Tank" = "8,000-12,000L"
            "Spray Range" = "50-80 meters"
            "Working Speed" = "5-15 km/h"
        }
        Features = @(
            "High-pressure water spray system",
            "Adjustable spray nozzles",
            "Remote control operation",
            "Large capacity water tank",
            "Anti-corrosion treatment",
            "Environmental monitoring system"
        )
        Applications = @(
            "Construction site dust control",
            "Road cleaning and maintenance",
            "Mining operations",
            "Demolition site management",
            "Air quality improvement",
            "Environmental protection"
        )
    }
    "E6-Compactor-Garbage-Truck.html" = @{
        Name = "E6 Compactor Garbage Truck"
        Category = "Waste Management Vehicle"
        Specs = @{
            "Engine" = "Turbocharged Diesel 7.2L"
            "Transmission" = "6-Speed Manual/AMT"
            "Drive Type" = "6x4"
            "Loading Capacity" = "12-18 cubic meters"
            "Compaction Ratio" = "1:3 to 1:4"
            "Hydraulic System" = "High-pressure 210 bar"
        }
        Features = @(
            "Advanced compaction system",
            "Automated loading mechanism",
            "Leak-proof sealed body",
            "Safety lockout systems",
            "Easy maintenance access",
            "Efficient hydraulic controls"
        )
        Applications = @(
            "Municipal waste collection",
            "Commercial waste management",
            "Residential garbage pickup",
            "Industrial waste handling",
            "Recycling operations",
            "Urban sanitation services"
        )
    }
    "Z3-Tractor-Truck.html" = @{
        Name = "Z3 Tractor Truck"
        Category = "Heavy-Duty Transport Vehicle"
        Specs = @{
            "Engine" = "Turbocharged Diesel 11.0L"
            "Transmission" = "12-Speed Manual"
            "Drive Type" = "6x4"
            "Max GVW" = "40-49 tons"
            "Towing Capacity" = "80-100 tons"
            "Fuel Tank" = "400-600L"
        }
        Features = @(
            "Heavy-duty fifth wheel coupling",
            "Air suspension system",
            "Advanced braking system",
            "Spacious driver cabin",
            "GPS navigation ready",
            "Fleet management compatible"
        )
        Applications = @(
            "Long-haul transportation",
            "Container hauling",
            "Heavy equipment transport",
            "Trailer operations",
            "Logistics and distribution",
            "Interstate commerce"
        )
    }
    "E3-Muck-Truck.html" = @{
        Name = "E3 Muck Truck"
        Category = "Specialized Construction Vehicle"
        Specs = @{
            "Engine" = "Turbocharged Diesel 5.9L"
            "Transmission" = "5-Speed Manual"
            "Drive Type" = "4x4/6x6"
            "Load Capacity" = "8-12 cubic meters"
            "Dumping Height" = "2.5-3.5 meters"
            "Ground Clearance" = "350-450mm"
        }
        Features = @(
            "All-terrain capability",
            "High ground clearance",
            "Reinforced dump body",
            "Hydraulic tilting system",
            "Rugged chassis design",
            "Easy loading access"
        )
        Applications = @(
            "Construction material transport",
            "Mining operations",
            "Quarry work",
            "Road construction",
            "Site preparation",
            "Heavy material handling"
        )
    }
}

foreach ($fileName in $truckData.Keys) {
    $truck = $truckData[$fileName]
    Write-Host "Creating: $($truck.Name)" -ForegroundColor Yellow
    
    # Build specifications table
    $specsHtml = ""
    foreach ($spec in $truck.Specs.GetEnumerator()) {
        $specsHtml += "<tr><td><strong>$($spec.Key)</strong></td><td>$($spec.Value)</td></tr>"
    }
    
    # Build features list
    $featuresHtml = ""
    foreach ($feature in $truck.Features) {
        $featuresHtml += "<li>$feature</li>"
    }
    
    # Build applications list
    $applicationsHtml = ""
    foreach ($application in $truck.Applications) {
        $applicationsHtml += "<li>$application</li>"
    }
    
    $html = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{0} - Equipment King</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="truck-page-container">
        <header class="main-header">
            <div class="header-container">
                <div class="logo"><h2>Equipment King</h2></div>
                <nav class="main-nav">
                    <div class="nav-item"><a href="../index.html">Home</a></div>
                    <div class="nav-item dropdown">
                        <a href="../trucks.html" class="dropdown-toggle">Trucks</a>
                        <div class="dropdown-content">
                            <a href="../main_trucks_detailed/E6.html">E6 Series</a>
                            <a href="../main_trucks_detailed/E9.html">E9 Series</a>
                            <a href="../main_trucks_detailed/X6.html">X6 Series</a>
                            <a href="../main_trucks_detailed/X9.html">X9 Series</a>
                            <a href="../main_trucks_detailed/i9.html">i9 Series</a>
                            <a href="../main_trucks_detailed/Z3_6.html">Z3 Series</a>
                            <a href="../main_trucks_detailed/E3.html">E3 Series</a>
                            <a href="../main_trucks_detailed/E1st.html">E1 Series</a>
                        </div>
                    </div>
                    <div class="nav-item"><a href="../about.html">About</a></div>
                    <div class="nav-item"><a href="../application.html">Contact</a></div>
                </nav>
            </div>
        </header>

        <main class="main-content">
            <section class="truck-hero">
                <div class="hero-container">
                    <div class="hero-image">
                        <div class="image-gallery">
                            <div class="main-image-container">
                                <img id="mainImage" src="../assets/back2.jpeg" alt="{0}" class="truck-main-image">
                            </div>
                            <div class="gallery-thumbnails">
                                <div class="gallery-thumbnail active" onclick="changeMainImage('../assets/back2.jpeg', 0)">
                                    <img src="../assets/back2.jpeg" alt="{0} exterior view">
                                </div>
                                <div class="gallery-thumbnail" onclick="changeMainImage('../assets/hero_section/truck-hero-bg.jpg', 1)">
                                    <img src="../assets/hero_section/truck-hero-bg.jpg" alt="{0} side view">
                                </div>
                                <div class="gallery-thumbnail" onclick="changeMainImage('../assets/trucks/e6vantrucks/1.webp', 2)">
                                    <img src="../assets/trucks/e6vantrucks/1.webp" alt="{0} interior view">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hero-content">
                        <div class="breadcrumb"><span>Heavy Duty Trucks</span> | <span>{1}</span> | <span>Equipment King</span></div>
                        <h1 class="truck-title">{0}</h1>
                        <div class="truck-category">{1}</div>
                        <div class="truck-description">
                            <p>Professional grade commercial vehicle engineered for superior performance and reliability in demanding operations.</p>
                        </div>
                        <div class="hero-buttons">
                            <a href="../application.html" class="btn btn-primary">Request Quote</a>
                            <a href="#specifications" class="btn btn-secondary">View Specs</a>
                        </div>
                    </div>
                </div>
            </section>

            <section id="specifications" class="truck-details">
                <div class="details-container">
                    <div class="details-grid">
                        <div class="detail-section">
                            <h2>Technical Specifications</h2>
                            <div class="specs-table">
                                <table>
                                    <tbody>
                                        {2}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="detail-section">
                            <h2>Key Features</h2>
                            <ul class="features-list">
                                {3}
                            </ul>
                        </div>
                        
                        <div class="detail-section">
                            <h2>Applications</h2>
                            <ul class="applications-list">
                                {4}
                            </ul>
                        </div>
                    </div>
                </div>
            </section>

            <section class="additional-info">
                <div class="info-container">
                    <div class="info-grid">
                        <div class="info-card">
                            <h3>Quality Assurance</h3>
                            <p>All vehicles undergo rigorous testing and quality control to ensure optimal performance and safety standards.</p>
                        </div>
                        <div class="info-card">
                            <h3>Technical Support</h3>
                            <p>Comprehensive technical support and maintenance services available nationwide for all our commercial vehicles.</p>
                        </div>
                        <div class="info-card">
                            <h3>Customization</h3>
                            <p>Custom configurations available to meet specific operational requirements and industry standards.</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer class="main-footer">
            <div class="footer-container">
                <div class="footer-content">
                    <div class="footer-section">
                        <h3>Equipment King</h3>
                        <p>Your trusted partner for commercial vehicles and heavy-duty equipment solutions.</p>
                    </div>
                    <div class="footer-section">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="../index.html">Home</a></li>
                            <li><a href="../trucks.html">Trucks</a></li>
                            <li><a href="../about.html">About Us</a></li>
                            <li><a href="../application.html">Contact</a></li>
                        </ul>
                    </div>
                    <div class="footer-section">
                        <h4>Contact Info</h4>
                        <p>Professional commercial vehicle solutions</p>
                        <p>Nationwide service and support</p>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2024 Equipment King. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>

    <script>
        function changeMainImage(src, index) {
            const mainImg = document.getElementById('mainImage');
            mainImg.src = src;
            
            // Remove active class from all thumbnails
            document.querySelectorAll('.gallery-thumbnail').forEach(thumbnail => {
                thumbnail.classList.remove('active');
            });
            
            // Add active class to clicked thumbnail
            const thumbnails = document.querySelectorAll('.gallery-thumbnail');
            if (thumbnails[index]) {
                thumbnails[index].classList.add('active');
            }
        }

        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });
    </script>
</body>
</html>
'@ -f $truck.Name, $truck.Category, $specsHtml, $featuresHtml, $applicationsHtml
    
    [System.IO.File]::WriteAllText("trucks_html\$fileName", $html, [System.Text.Encoding]::UTF8)
    Write-Host "  Generated successfully" -ForegroundColor Green
}

Write-Host "All truck pages generated with complete specifications and image galleries!" -ForegroundColor Green