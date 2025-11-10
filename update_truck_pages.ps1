# PowerShell script to update all truck pages with dropdown navigation
$rootPath = "c:\Users\HP\Desktop\equipmentking"
$truckPagesPath = "$rootPath\trucks_html"

# Get all HTML files in trucks_html directory
$htmlFiles = Get-ChildItem -Path $truckPagesPath -Filter "*.html"

# Counter for progress tracking
$count = 0
$total = $htmlFiles.Count

Write-Host "Found $total truck pages to update..."

foreach ($file in $htmlFiles) {
    $count++
    Write-Host "[$count/$total] Updating: $($file.Name)"
    
    $filePath = $file.FullName
    $content = Get-Content -Path $filePath -Raw
    
    # Check if file already has dropdown navigation
    if ($content -match 'class="trucks-dropdown"') {
        Write-Host "  - Already has dropdown navigation, skipping..."
        continue
    }
    
    # Replace the basic navigation with dropdown navigation
    $oldNav = @"
    <nav>
      <a href="../index.html">Home</a>
      <a href="../trucks.html">Trucks</a>
      <a href="../about.html">About</a>
      <a href="../application.html">Application</a>

      <button class="contact-btn" onclick="location.href=''">Contact Us</button>
    </nav>
"@

    $newNav = @"
    <nav>
      <a href="../index.html">Home</a>
      <div class="trucks-dropdown">
        <a href="../trucks.html">Trucks</a>
        <div class="dropdown-menu">
          <div class="dropdown-category">
            <h3>Light Duty (4.5T≤GCW≤25T)</h3>
            <div class="dropdown-subcategory">
              <h4>E3 Series</h4>
              <div class="dropdown-links">
                <a href="E3-Cement-Mixer-Truck.html">E3 Cement Mixer Truck</a>
                <a href="E3-Dump-Truck.html">E3 Dump Truck</a>
                <a href="E3-Muck-Truck.html">E3 Muck Truck</a>
                <a href="E3-Sewage-Suction-Truck.html">E3 Sewage Suction Truck</a>
                <a href="E3-Stake-Truck.html">E3 Stake Truck</a>
                <a href="E3-Tractor-Truck.html">E3 Tractor Truck</a>
                <a href="E3-Van-Truck.html">E3 Van Truck</a>
                <a href="E3-Compactor-Garbage-Truck.html">E3 Compactor Garbage Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>E6 Series</h4>
              <div class="dropdown-links">
                <a href="E6-Cement-Mixer-Truck.html">E6 Cement Mixer Truck</a>
                <a href="E6-Dump-Truck.html">E6 Dump Truck</a>
                <a href="E6-Refrigerated-Truck.html">E6 Refrigerated Truck</a>
                <a href="E6-Sprinkler-Truck.html">E6 Sprinkler Truck</a>
                <a href="E6-Stake-Truck.html">E6 Stake Truck</a>
                <a href="E6-Truck-Mounted-Crane.html">E6 Truck Mounted Crane</a>
                <a href="E6-Van-Truck.html">E6 Van Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>E9 Series</h4>
              <div class="dropdown-links">
                <a href="E9-Dump-Truck.html">E9 Dump Truck</a>
                <a href="E9-Flatbed-Truck.html">E9 Flatbed Truck</a>
                <a href="E9-Kitchen-Waste-Food-Garbage-Truck.html">E9 Kitchen Waste Food Garbage Truck</a>
                <a href="E9-Refrigerated-Truck.html">E9 Refrigerated Truck</a>
                <a href="E9-Stake-Truck.html">E9 Stake Truck</a>
                <a href="E9-Van-Truck.html">E9 Van Truck</a>
              </div>
            </div>
          </div>
          <div class="dropdown-category">
            <h3>Medium Duty (12T≤GCW≤60T)</h3>
            <div class="dropdown-subcategory">
              <h4>X6 Series</h4>
              <div class="dropdown-links">
                <a href="X6-AWD-Cargo-Truck.html">X6 AWD Cargo Truck</a>
                <a href="X6-Cargo-Truck.html">X6 Cargo Truck</a>
                <a href="X6-Cement-Mixer-Truck.html">X6 Cement Mixer Truck</a>
                <a href="X6-Concrete-Mixer-Truck.html">X6 Concrete Mixer Truck</a>
                <a href="X6-Dropside-Truck.html">X6 Dropside Truck</a>
                <a href="X6-Dump-Truck.html">X6 Dump Truck</a>
                <a href="X6-Dust-Suppression-Truck.html">X6 Dust Suppression Truck</a>
                <a href="X6-Flatbed.html">X6 Flatbed</a>
                <a href="X6-Fuel-Tanker.html">X6 Fuel Tanker</a>
                <a href="X6-Garbage-Truck.html">X6 Garbage Truck</a>
                <a href="X6-Loading-Crane-Recovery-Truck.html">X6 Loading Crane Recovery Truck</a>
                <a href="X6-Sprinkler-Truck.html">X6 Sprinkler Truck</a>
                <a href="X6-Truck-Mounted-Crane.html">X6 Truck Mounted Crane</a>
                <a href="X6-Van-Truck.html">X6 Van Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>X7 Series</h4>
              <div class="dropdown-links">
                <a href="X7-Concrete-Mixer-Truck.html">X7 Concrete Mixer Truck</a>
                <a href="X7-Dump-Truck.html">X7 Dump Truck</a>
                <a href="X7-Flatbed-Truck.html">X7 Flatbed Truck</a>
                <a href="X7-Sprinkler-Truck.html">X7 Sprinkler Truck</a>
                <a href="X7-Truck-Mounted-Crane.html">X7 Truck Mounted Crane</a>
              </div>
            </div>
          </div>
          <div class="dropdown-category">
            <h3>Heavy Duty (18T≤GCW≤100T)</h3>
            <div class="dropdown-subcategory">
              <h4>X9 Series</h4>
              <div class="dropdown-links">
                <a href="X9-4x4-Dump-Truck.html">X9 4x4 Dump Truck</a>
                <a href="X9-Aerial-Platform-Truck.html">X9 Aerial Platform Truck</a>
                <a href="X9-Dump-Truck.html">X9 Dump Truck</a>
                <a href="X9-Fuel-Tanker-Truck.html">X9 Fuel Tanker Truck</a>
                <a href="X9-Garbage-Truck.html">X9 Garbage Truck</a>
                <a href="X9-Refrigerated-Truck.html">X9 Refrigerated Truck</a>
                <a href="X9-Tow-Truck.html">X9 Tow Truck</a>
                <a href="X9-Van-Truck.html">X9 Van Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>F9 Series</h4>
              <div class="dropdown-links">
                <a href="F9-Flatbed-Truck.html">F9 Flatbed Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>I9 Series</h4>
              <div class="dropdown-links">
                <a href="I9-Truck.html">I9 Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>9 Series Special</h4>
              <div class="dropdown-links">
                <a href="9-Series-Aerial-Work-Platform.html">9 Series Aerial Work Platform</a>
                <a href="9-Series-Cement-Mixer-Truck.html">9 Series Cement Mixer Truck</a>
                <a href="9-Series-Garbage-Truck.html">9 Series Garbage Truck</a>
                <a href="9-Series-Sweeper.html">9 Series Sweeper</a>
                <a href="9-Series-Tow-Truck.html">9 Series Tow Truck</a>
                <a href="9-Series-Truck-Mounted-Crane.html">9 Series Truck Mounted Crane</a>
              </div>
            </div>
          </div>
          <div class="dropdown-category">
            <h3>Off-Road & Special</h3>
            <div class="dropdown-subcategory">
              <h4>Z3 Series</h4>
              <div class="dropdown-links">
                <a href="Z3-Tractor-Truck-4.html">Z3 Tractor Truck (4×4)</a>
                <a href="Z3-Tractor-Truck-6.html">Z3 Tractor Truck (6×6)</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>E1st Series</h4>
              <div class="dropdown-links">
                <a href="E1st-Tractor.html">E1st Tractor</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>X3s Series</h4>
              <div class="dropdown-links">
                <a href="X3s-Truck.html">X3s Truck</a>
              </div>
            </div>
            <div class="dropdown-subcategory">
              <h4>Additional Models</h4>
              <div class="dropdown-links">
                <a href="3-Series-Truck-Mounted-Crane.html">3 Series Truck Mounted Crane</a>
                <a href="6-Series-Cement-Mixer-Truck.html">6 Series Cement Mixer Truck</a>
                <a href="6-Series-Garbage-Truck.html">6 Series Garbage Truck</a>
                <a href="6-Series-Sweeper.html">6 Series Sweeper</a>
                <a href="6-Series-Truck-Mounted-Crane.html">6 Series Truck Mounted Crane</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a href="../about.html">About</a>
      <a href="../application.html">Application</a>

      <button class="contact-btn" onclick="location.href=''">Contact Us</button>
    </nav>
"@

    # Replace navigation
    $updatedContent = $content -replace [regex]::Escape($oldNav), $newNav
    
    # Add JavaScript functionality before closing body tag
    $jsCode = @"
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
              }, 300); // 300ms delay before hiding
          });
      }
"@

    # Check if JavaScript is already present
    if ($updatedContent -notmatch "Trucks dropdown hover functionality") {
        # Find the existing script tag and add our code before the closing script tag
        $updatedContent = $updatedContent -replace '(\s+)// auto-update footer year', "`$1// auto-update footer year`r`n`r`n$jsCode`r`n"
    }
    
    # Write updated content back to file
    Set-Content -Path $filePath -Value $updatedContent -Encoding UTF8
    Write-Host "  - Updated successfully!"
}

Write-Host "`nCompleted updating all $total truck pages!"
Write-Host "All pages now have the dropdown navigation with hover functionality."