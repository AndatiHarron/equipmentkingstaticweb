# Modern Truck Pages Generator - Black & White Design
# Reads from truck-data.json and creates modern pages for all trucks

$jsonContent = Get-Content -Path "truck-data.json" -Raw | ConvertFrom-Json
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

    /* Exterior Images Gallery */
    .exterior-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin: 30px 0;
    }

    .exterior-item {
      background: #ffffff;
      border: 1px solid #e5e5e7;
      border-radius: 12px;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .exterior-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .exterior-item img {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }

    .exterior-caption {
      padding: 15px;
      font-size: 0.9rem;
      color: #666;
      text-align: center;
      font-weight: 500;
    }

    /* Interior Images Gallery */
    .interior-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin: 30px 0;
    }

    .interior-item {
      background: #ffffff;
      border: 1px solid #e5e5e7;
      border-radius: 12px;
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .interior-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .interior-item img {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }

    .interior-caption {
      padding: 15px;
      font-size: 0.9rem;
      color: #666;
      text-align: center;
      font-weight: 500;
    }

    /* Specifications Grid */
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

    .features-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .features-list li {
      padding: 12px 0;
      padding-left: 20px;
      position: relative;
      color: #666;
      line-height: 1.5;
      border-bottom: 1px solid #f8f9fa;
    }

    .features-list li:last-child {
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

    .applications-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .applications-list li {
      padding: 12px 0;
      padding-left: 20px;
      position: relative;
      color: #666;
      line-height: 1.5;
      border-bottom: 1px solid #f8f9fa;
    }

    .applications-list li:last-child {
      border-bottom: none;
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
        {TRUCK_DESCRIPTION}
      </p>
    </section>

    <!-- Exterior Images Section -->
    <div class="content-section">
      <h2 class="section-title">Exterior Views</h2>
      <div class="exterior-gallery">
        {EXTERIOR_IMAGES}
      </div>
    </div>

    <!-- Interior Images Section -->
    <div class="content-section">
      <h2 class="section-title">Interior Features</h2>
      <div class="interior-gallery">
        {INTERIOR_IMAGES}
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
    // Trucks dropdown hover functionality
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

# Function to generate exterior images HTML
function Generate-ExteriorImages($truck, $mainImage) {
    $exteriorImages = @()
    
    # Always include the main image as first exterior view
    $exteriorImages += @"
        <div class="exterior-item">
          <img src="$mainImage" alt="$($truck.name) - Front View">
          <div class="exterior-caption">Front View</div>
        </div>
"@
    
    # Add more exterior views (using gallery images or duplicating main image with different captions)
    if ($truck.gallery -and $truck.gallery.Count -gt 1) {
        for ($i = 1; $i -lt [Math]::Min($truck.gallery.Count, 4); $i++) {
            $captions = @("Side Profile", "Rear View", "Working Position")
            $caption = if ($i-1 -lt $captions.Count) { $captions[$i-1] } else { "Additional View" }
            $exteriorImages += @"
        <div class="exterior-item">
          <img src="$($truck.gallery[$i])" alt="$($truck.name) - $caption">
          <div class="exterior-caption">$caption</div>
        </div>
"@
        }
    } else {
        # Use main image with different captions for multiple views
        $captions = @("Side Profile", "Rear View", "Working Position")
        foreach ($caption in $captions) {
            $exteriorImages += @"
        <div class="exterior-item">
          <img src="$mainImage" alt="$($truck.name) - $caption">
          <div class="exterior-caption">$caption</div>
        </div>
"@
        }
    }
    
    return ($exteriorImages -join "`n")
}

# Function to generate interior images HTML  
function Generate-InteriorImages($truck, $mainImage) {
    $interiorCaptions = @("Driver Cabin", "Dashboard & Controls", "Operator Area", "Control Panel")
    $interiorImages = @()
    
    foreach ($caption in $interiorCaptions) {
        $interiorImages += @"
        <div class="interior-item">
          <img src="$mainImage" alt="$($truck.name) - $caption">
          <div class="interior-caption">$caption</div>
        </div>
"@
    }
    
    return ($interiorImages -join "`n")
}

# Function to generate specifications HTML
function Generate-Specifications($specs) {
    if (!$specs) { return "" }
    
    $specItems = @()
    $specs.PSObject.Properties | ForEach-Object {
        $label = ($_.Name -creplace '([a-z])([A-Z])', '$1 $2') -replace '^.', { $_.Value.ToString().ToUpper() }
        $specItems += @"
          <div class="spec-item">
            <span class="spec-label">$label</span>
            <span class="spec-value">$($_.Value)</span>
          </div>
"@
    }
    
    return ($specItems -join "`n")
}

# Function to generate features HTML
function Generate-Features($features) {
    if (!$features) { return "" }
    
    $featureItems = @()
    $features | ForEach-Object {
        $featureItems += "<li>$_</li>"
    }
    
    return ($featureItems -join "`n            ")
}

# Function to generate applications HTML
function Generate-Applications($applications) {
    if (!$applications) { return "" }
    
    $applicationItems = @()
    $applications | ForEach-Object {
        $applicationItems += "<li>$_</li>"
    }
    
    return ($applicationItems -join "`n            ")
}

# Process each category
$jsonContent.trucks.PSObject.Properties | ForEach-Object {
    $categoryKey = $_.Name
    $category = $_.Value
    
    # Process each series in category
    $category.series.PSObject.Properties | ForEach-Object {
        $seriesKey = $_.Name
        $series = $_.Value
        
        # Process each model in series
        $series.models | ForEach-Object {
            $truck = $_
            
            Write-Host "Generating page for: $($truck.name)"
            
            # Prepare template variables
            $categoryName = $category.category
            $seriesName = $series.seriesName
            $truckName = $truck.name
            $fileName = $truck.fileName
            $mainImage = $truck.mainImage
            $description = if ($truck.description) { $truck.description } else { $series.description }
            
            # Generate content sections
            $exteriorImages = Generate-ExteriorImages $truck $mainImage
            $interiorImages = Generate-InteriorImages $truck $mainImage
            $specifications = Generate-Specifications $truck.specifications
            $features = Generate-Features $truck.features
            $applications = Generate-Applications $truck.applications
            
            # Category anchors and names for navigation
            $categoryAnchor = switch ($categoryKey) {
                "light-duty" { "light-duty"; break }
                "medium-duty" { "medium-duty"; break }
                "heavy-duty" { "heavy-duty"; break }
                default { $categoryKey }
            }
            
            $categoryUpper = $categoryName.ToUpper()
            $seriesAnchor = "$seriesKey-series".ToLower()
            
            # Replace template placeholders
            $pageContent = $baseTemplate
            $pageContent = $pageContent -replace '\{TRUCK_NAME\}', $truckName
            $pageContent = $pageContent -replace '\{CATEGORY_NAME\}', $categoryName
            $pageContent = $pageContent -replace '\{CATEGORY_UPPER\}', $categoryUpper
            $pageContent = $pageContent -replace '\{CATEGORY_ANCHOR\}', $categoryAnchor
            $pageContent = $pageContent -replace '\{SERIES_NAME\}', $seriesName
            $pageContent = $pageContent -replace '\{SERIES_ANCHOR\}', $seriesAnchor
            $pageContent = $pageContent -replace '\{FILE_NAME\}', $fileName
            $pageContent = $pageContent -replace '\{TRUCK_DESCRIPTION\}', $description
            $pageContent = $pageContent -replace '\{EXTERIOR_IMAGES\}', $exteriorImages
            $pageContent = $pageContent -replace '\{INTERIOR_IMAGES\}', $interiorImages
            $pageContent = $pageContent -replace '\{SPECIFICATIONS\}', $specifications
            $pageContent = $pageContent -replace '\{FEATURES\}', $features
            $pageContent = $pageContent -replace '\{APPLICATIONS\}', $applications
            
            # Write the file
            $outputPath = "trucks_html\$fileName"
            Set-Content -Path $outputPath -Value $pageContent -Encoding UTF8
            
            Write-Host "Created: $outputPath"
        }
    }
}

Write-Host "All truck pages generated successfully with modern black & white design!"