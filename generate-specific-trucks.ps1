# Generate specific truck pages from your list
# This will create all the key truck models with modern black & white design

$specificTrucks = @(
    @{
        name = "3 Series Cement Mixer Truck"
        fileName = "3-Series-Cement-Mixer-Truck.html"
        category = "Light Duty Trucks"
        series = "3 Series"
        image = "../assets/trucks/Additional Trucks/3 series truck mounted crane/Screenshot 2025-10-30 152846.webp"
        specs = @{
            "gvw" = "Under 25T"
            "mixingCapacity" = "3-6 cubic meters"
            "engine" = "Diesel"
            "transmission" = "Manual"
        }
        features = @("Compact design", "Easy maneuvering", "Reliable mixing", "Urban applications")
        applications = @("Small construction sites", "Urban concrete delivery", "Residential projects", "Road maintenance")
    },
    @{
        name = "6 Series Cement Mixer Truck"
        fileName = "6-Series-Cement-Mixer-Truck.html"
        category = "Medium Duty Trucks"
        series = "6 Series"
        image = "../assets/trucks/Additional Trucks/6 series cement mixer trucks/Screenshot 2025-11-04 235704.webp"
        specs = @{
            "gvw" = "25T-40T"
            "mixingCapacity" = "6-10 cubic meters"
            "engine" = "High-power Diesel"
            "transmission" = "Manual/Automatic"
        }
        features = @("High capacity mixing", "Robust construction", "Efficient operation", "Commercial grade")
        applications = @("Large construction projects", "Commercial concrete delivery", "Infrastructure development", "Industrial applications")
    },
    @{
        name = "6 Series Garbage Truck"
        fileName = "6-Series-Garbage-Truck.html"
        category = "Medium Duty Trucks"
        series = "6 Series"
        image = "../assets/trucks/Additional Trucks/6 Series Garbage Trucks/Screenshot 2025-11-04 235506.webp"
        specs = @{
            "gvw" = "25T-40T"
            "loadCapacity" = "8-15 cubic meters"
            "engine" = "Diesel"
            "compressionRatio" = "3:1"
        }
        features = @("Hydraulic compaction", "Easy loading", "Efficient collection", "Durable construction")
        applications = @("Municipal waste collection", "Commercial waste management", "Industrial waste disposal", "Recycling collection")
    },
    @{
        name = "9 Series Tow Truck"
        fileName = "9-Series-Tow-Truck.html"
        category = "Heavy Duty Trucks"
        series = "9 Series"
        image = "../assets/trucks/Additional Trucks/9 Series Tow Truck/Screenshot 2025-11-05 000318.webp"
        specs = @{
            "gvw" = "40T+"
            "towingCapacity" = "Up to 50T"
            "engine" = "Heavy-duty Diesel"
            "winchCapacity" = "25T"
        }
        features = @("Heavy-duty towing", "Advanced recovery systems", "All-terrain capability", "Professional grade")
        applications = @("Heavy vehicle recovery", "Commercial towing", "Emergency services", "Industrial equipment transport")
    },
    @{
        name = "E3 Cement Mixer Truck"
        fileName = "E3-Cement-Mixer-Truck.html"
        category = "Light Duty Trucks"
        series = "E3 Series"
        image = "../assets/trucks/Additional Trucks/E3 cement mixer trucks/Screenshot 2025-11-05 000715.webp"
        specs = @{
            "gvw" = "Under 25T"
            "mixingCapacity" = "3-5 cubic meters"
            "engine" = "Efficient Diesel"
            "fuelConsumption" = "Low"
        }
        features = @("Fuel efficient", "Compact mixing drum", "Easy operation", "Cost effective")
        applications = @("Small to medium projects", "Urban delivery", "Residential construction", "Maintenance work")
    }
)

$baseTemplate = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/styles.css">
  <title>{TRUCK_NAME} - Equipment King</title>
  
  <style>
    /* Modern Black & White Truck Page Styling */
    body {
      background: #ffffff;
      color: #1d1d1f;
      margin: 0;
      padding: 0;
    }

    .page-wrapper {
      max-width: 1200px;
      margin: 0 auto;
      padding: 80px 20px 0;
      min-height: 100vh;
      background: #ffffff;
    }

    .breadcrumb {
      margin: 80px 0 20px;
      color: #666;
      font-size: 0.9rem;
    }

    .breadcrumb a {
      color: #1d1d1f;
      text-decoration: none;
    }

    .breadcrumb a:hover {
      text-decoration: underline;
    }

    .truck-hero {
      background: #ffffff;
      padding: 40px 0;
      text-align: center;
      border-bottom: 1px solid #e5e5e7;
      margin-bottom: 40px;
    }

    .truck-category {
      display: inline-block;
      background: #f5f5f7;
      color: #1d1d1f;
      padding: 6px 12px;
      border-radius: 16px;
      font-size: 0.85rem;
      font-weight: 500;
      margin-bottom: 20px;
    }

    .truck-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: #1d1d1f;
      margin-bottom: 10px;
      letter-spacing: -0.5px;
    }

    .truck-series {
      font-size: 1.1rem;
      color: #666;
      margin-bottom: 15px;
      font-weight: 500;
    }

    .truck-description {
      color: #666;
      max-width: 600px;
      margin: 0 auto;
      line-height: 1.5;
      font-size: 1rem;
    }

    .content-section {
      margin: 50px 0;
    }

    .section-title {
      font-size: 1.8rem;
      font-weight: 600;
      color: #1d1d1f;
      margin-bottom: 30px;
      text-align: center;
      position: relative;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 2px;
      background: #1d1d1f;
    }

    .exterior-gallery,
    .interior-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin: 30px 0;
    }

    .exterior-item,
    .interior-item {
      background: #ffffff;
      border: 1px solid #e5e5e7;
      border-radius: 12px;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .exterior-item:hover,
    .interior-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .exterior-item img,
    .interior-item img {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }

    .exterior-caption,
    .interior-caption {
      padding: 15px;
      font-size: 0.9rem;
      color: #666;
      text-align: center;
      font-weight: 500;
    }

    .specs-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 30px;
      margin: 40px 0;
    }

    .spec-card {
      background: #ffffff;
      border: 1px solid #e5e5e7;
      border-radius: 12px;
      padding: 25px;
    }

    .spec-card h3 {
      font-size: 1.3rem;
      font-weight: 600;
      color: #1d1d1f;
      margin-bottom: 20px;
      border-bottom: 1px solid #f0f0f0;
      padding-bottom: 10px;
    }

    .spec-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 0;
      border-bottom: 1px solid #f8f9fa;
    }

    .spec-item:last-child {
      border-bottom: none;
    }

    .spec-label {
      font-weight: 500;
      color: #666;
    }

    .spec-value {
      font-weight: 600;
      color: #1d1d1f;
    }

    .features-list,
    .applications-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .features-list li,
    .applications-list li {
      padding: 12px 0;
      padding-left: 20px;
      position: relative;
      color: #666;
      line-height: 1.5;
      border-bottom: 1px solid #f8f9fa;
    }

    .features-list li:last-child,
    .applications-list li:last-child {
      border-bottom: none;
    }

    .features-list li::before {
      content: '●';
      position: absolute;
      left: 0;
      top: 12px;
      color: #1d1d1f;
      font-weight: bold;
    }

    .applications-list li::before {
      content: '→';
      position: absolute;
      left: 0;
      top: 12px;
      color: #1d1d1f;
      font-weight: bold;
    }

    .cta-section {
      background: #f8f9fa;
      padding: 40px;
      border-radius: 12px;
      text-align: center;
      margin: 50px 0;
      border: 1px solid #e5e5e7;
    }

    .cta-title {
      font-size: 1.6rem;
      font-weight: 600;
      color: #1d1d1f;
      margin-bottom: 15px;
    }

    .cta-subtitle {
      color: #666;
      margin-bottom: 25px;
      font-size: 1rem;
    }

    .cta-button {
      background: #1d1d1f;
      color: white;
      padding: 12px 30px;
      border: none;
      border-radius: 20px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      margin: 0 8px 8px 0;
      text-decoration: none;
      display: inline-block;
    }

    .cta-button:hover {
      background: #000;
      transform: translateY(-2px);
    }

    .cta-button.secondary {
      background: transparent;
      color: #1d1d1f;
      border: 2px solid #1d1d1f;
    }

    .cta-button.secondary:hover {
      background: #1d1d1f;
      color: white;
    }

    @media (max-width: 768px) {
      .page-wrapper {
        padding: 70px 15px 0;
      }
      
      .truck-title {
        font-size: 2rem;
      }

      .exterior-gallery,
      .interior-gallery {
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 15px;
      }

      .specs-grid {
        grid-template-columns: 1fr;
        gap: 20px;
      }
    }
  </style>
</head>
<body>
  <header>
    <a>
      <div class="logo" onclick="location.href='../index.html'">
        <img src="../assets/companylogo.webp" alt="Equipment King Logo" />
        Equipment King
      </div>
    </a>

    <nav>
      <a href="../index.html">Home</a>
      
      <div class="trucks-dropdown">
        <a href="../trucks.html" class="trucks-btn">Trucks</a>
        <div class="dropdown-menu">
          <ul>
            <li>
              <a href="../trucks.html#{CATEGORY_ANCHOR}">{CATEGORY_UPPER}</a>
              <ul class="sub-dropdown">
                <li>
                  <a href="../trucks.html#{SERIES_ANCHOR}">{SERIES_NAME}</a>
                  <ul class="truck-links">
                    <li><a href="{FILE_NAME}">{TRUCK_NAME}</a></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      
      <a href="../about.html">About</a>
      <a href="../application.html">Application</a>
      
      <button class="contact-btn" onclick="location.href='../contact.html'">Contact Us</button>
    </nav>
  </header>

  <div class="page-wrapper">
    <nav class="breadcrumb">
      <a href="../index.html">Home</a> &gt; 
      <a href="../trucks.html">Trucks</a> &gt; 
      <a href="../trucks.html#{CATEGORY_ANCHOR}">{CATEGORY_NAME}</a> &gt; 
      <span>{TRUCK_NAME}</span>
    </nav>

    <section class="truck-hero">
      <div class="truck-category">{CATEGORY_NAME}</div>
      <h1 class="truck-title">{TRUCK_NAME}</h1>
      <div class="truck-series">{SERIES_NAME}</div>
      <p class="truck-description">
        Professional {TRUCK_NAME} designed for reliable performance and efficiency in commercial applications.
      </p>
    </section>

    <!-- Exterior Images Section -->
    <div class="content-section">
      <h2 class="section-title">Exterior Views</h2>
      <div class="exterior-gallery">
        <div class="exterior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Front View">
          <div class="exterior-caption">Front View</div>
        </div>
        <div class="exterior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Side Profile">
          <div class="exterior-caption">Side Profile</div>
        </div>
        <div class="exterior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Rear View">
          <div class="exterior-caption">Rear View</div>
        </div>
        <div class="exterior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Working Position">
          <div class="exterior-caption">Working Position</div>
        </div>
      </div>
    </div>

    <!-- Interior Images Section -->
    <div class="content-section">
      <h2 class="section-title">Interior Features</h2>
      <div class="interior-gallery">
        <div class="interior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Driver Cabin">
          <div class="interior-caption">Driver Cabin</div>
        </div>
        <div class="interior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Dashboard">
          <div class="interior-caption">Dashboard & Controls</div>
        </div>
        <div class="interior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Operator Area">
          <div class="interior-caption">Operator Area</div>
        </div>
        <div class="interior-item">
          <img src="{MAIN_IMAGE}" alt="{TRUCK_NAME} - Control Panel">
          <div class="interior-caption">Control Panel</div>
        </div>
      </div>
    </div>

    <!-- Specifications Section -->
    <div class="content-section">
      <h2 class="section-title">Specifications & Features</h2>
      <div class="specs-grid">
        <div class="spec-card">
          <h3>Technical Specifications</h3>
          {SPECIFICATIONS}
        </div>

        <div class="spec-card">
          <h3>Key Features</h3>
          <ul class="features-list">
            {FEATURES}
          </ul>
        </div>

        <div class="spec-card">
          <h3>Applications</h3>
          <ul class="applications-list">
            {APPLICATIONS}
          </ul>
        </div>
      </div>
    </div>

    <section class="cta-section">
      <h2 class="cta-title">Ready to Learn More?</h2>
      <p class="cta-subtitle">Contact our team to discuss your specific requirements and get a customized quote.</p>
      <a href="../contact.html" class="cta-button">Get Quote</a>
      <a href="../trucks.html" class="cta-button secondary">View All Trucks</a>
    </section>
  </div>

  <footer>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <div class="footer-container">
      <div>
        <h4>PRODUCTS</h4>
        <ul>
          <li><a href="../trucks.html#ldt">Light Duty Truck (4.5T≤GCW≤25T)</a></li>
          <li><a href="../trucks.html#mdt">Medium Duty Truck (12T≤GCW≤60T)</a></li>
          <li><a href="../trucks.html#hdt">Heavy Duty Truck (18T≤GCW≤100T)</a></li>
          <li><a href="../trucks.html#ldt">Off-road Truck</a></li>
        </ul>
      </div>
      <div>
        <h4>APPLICATIONS</h4>
        <ul>
          <li><a href="#">Tractor</a></li>
          <li><a href="#">Dump Truck</a></li>
          <li><a href="#">Cargo Truck</a></li>
          <li><a href="#special-vehicle">Special Vehicle</a></li>
          <li><a href="#">Off-road Truck</a></li>
        </ul>
      </div>
      <div>
        <h4>FOLLOW US</h4>
        <div class="social-links">
          <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
          <a href="#" title="Twitter / X"><i class="fab fa-x-twitter"></i></a>
          <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
          <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
          <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <div>&copy; <span id="year">2025</span> Equipment King. All rights reserved.</div>
      <div>
        <a href="#">Privacy Policy</a> |
        <a href="#">Terms of Use</a> |
        <a href="#">Site Map</a>
      </div>
    </div>
    <script>
      document.getElementById("year").textContent = new Date().getFullYear();
    </script>
  </footer>
  <script>
    const trucksDropdown = document.querySelector('.trucks-dropdown');
    if (trucksDropdown) {
      const dropdownMenu = trucksDropdown.querySelector('.dropdown-menu');
      let hoverTimeout;
      trucksDropdown.addEventListener('mouseenter', () => {
        clearTimeout(hoverTimeout);
        dropdownMenu.style.display = 'block';
      });
      trucksDropdown.addEventListener('mouseleave', () => {
        hoverTimeout = setTimeout(() => {
          dropdownMenu.style.display = 'none';
        }, 300);
      });
    }
  </script>
</body>
</html>
"@

foreach ($truck in $specificTrucks) {
    Write-Host "Generating page for: $($truck.name)"
    
    # Generate specifications HTML
    $specItems = @()
    $truck.specs.GetEnumerator() | ForEach-Object {
        $label = ($_.Key -creplace '([a-z])([A-Z])', '$1 $2') -replace '^.', { $_.Value.ToString().ToUpper() }
        $specItems += @"
          <div class="spec-item">
            <span class="spec-label">$label</span>
            <span class="spec-value">$($_.Value)</span>
          </div>
"@
    }
    $specifications = $specItems -join "`n"
    
    # Generate features HTML
    $featureItems = @()
    $truck.features | ForEach-Object {
        $featureItems += "<li>$_</li>"
    }
    $features = $featureItems -join "`n            "
    
    # Generate applications HTML
    $applicationItems = @()
    $truck.applications | ForEach-Object {
        $applicationItems += "<li>$_</li>"
    }
    $applications = $applicationItems -join "`n            "
    
    # Category anchors
    $categoryAnchor = switch ($truck.category) {
        "Light Duty Trucks" { "light-duty"; break }
        "Medium Duty Trucks" { "medium-duty"; break }
        "Heavy Duty Trucks" { "heavy-duty"; break }
        default { "light-duty" }
    }
    
    $categoryUpper = $truck.category.ToUpper()
    $seriesAnchor = "$($truck.series.Replace(' ', '-').ToLower())"
    
    # Replace template placeholders
    $pageContent = $baseTemplate
    $pageContent = $pageContent -replace '\{TRUCK_NAME\}', $truck.name
    $pageContent = $pageContent -replace '\{CATEGORY_NAME\}', $truck.category
    $pageContent = $pageContent -replace '\{CATEGORY_UPPER\}', $categoryUpper
    $pageContent = $pageContent -replace '\{CATEGORY_ANCHOR\}', $categoryAnchor
    $pageContent = $pageContent -replace '\{SERIES_NAME\}', $truck.series
    $pageContent = $pageContent -replace '\{SERIES_ANCHOR\}', $seriesAnchor
    $pageContent = $pageContent -replace '\{FILE_NAME\}', $truck.fileName
    $pageContent = $pageContent -replace '\{MAIN_IMAGE\}', $truck.image
    $pageContent = $pageContent -replace '\{SPECIFICATIONS\}', $specifications
    $pageContent = $pageContent -replace '\{FEATURES\}', $features
    $pageContent = $pageContent -replace '\{APPLICATIONS\}', $applications
    
    # Write the file
    $outputPath = "trucks_html\$($truck.fileName)"
    Set-Content -Path $outputPath -Value $pageContent -Encoding UTF8
    
    Write-Host "Created: $outputPath"
}

Write-Host "All specific truck pages generated with modern black & white design!"