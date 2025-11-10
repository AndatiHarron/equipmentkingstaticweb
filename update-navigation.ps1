# Update all truck pages with complete navigation and hover functionality

$completeNavigation = @'
      <div class="trucks-dropdown">
        <a href="../trucks.html" class="trucks-btn">Trucks</a>
        <div class="dropdown-menu">
          <ul>
            <!-- LIGHT DUTY TRUCKS -->
            <li>
              <a href="../trucks.html#light-duty">LIGHT DUTY TRUCKS</a>
              <ul class="sub-dropdown">
                <li>
                  <a href="../trucks.html#x9-series">X9 Series</a>
                  <ul class="truck-links">
                    <li><a href="X9-Tow-Truck.html">X9 Tow Truck</a></li>
                    <li><a href="X9-Aerial-Work-Platform-Truck.html">X9 Aerial Work Platform Truck</a></li>
                    <li><a href="X9-4X4-Dump-Truck.html">X9 4X4 Dump Truck</a></li>
                    <li><a href="X9-Dump-Truck.html">X9 Dump Truck</a></li>
                    <li><a href="X9-Van-Truck.html">X9 Van Truck</a></li>
                    <li><a href="X9-Fuel-Tanker-Truck.html">X9 Fuel Tanker Truck</a></li>
                    <li><a href="X9-Garbage-Truck.html">X9 Garbage Truck</a></li>
                    <li><a href="X9-Refrigerated-Truck.html">X9 Refrigerated Truck</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#e9-series">E9 Series</a>
                  <ul class="truck-links">
                    <li><a href="E9-Refrigerated-Truck.html">E9 Refrigerated Truck</a></li>
                    <li><a href="E9-Dump-Truck.html">E9 Dump Truck</a></li>
                    <li><a href="E9-Van-Truck.html">E9 Van Truck</a></li>
                    <li><a href="E9-Kitchen-Waste-Garbage-Truck.html">E9 Kitchen Waste Garbage Truck</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#x7-series">X7 Series</a>
                  <ul class="truck-links">
                    <li><a href="X7-Concrete-Mixer-Truck.html">X7 Concrete Mixer Truck</a></li>
                    <li><a href="X7-Flatbed-Truck.html">X7 Flatbed Truck</a></li>
                    <li><a href="X7-Sprinkler-Truck.html">X7 Sprinkler Truck</a></li>
                    <li><a href="X7-Dump-Truck.html">X7 Dump Truck</a></li>
                    <li><a href="X7-Truck-Mounted-Crane.html">X7 Truck Mounted Crane</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#e3-series">E3 Series</a>
                  <ul class="truck-links">
                    <li><a href="E3-Cement-Mixer-Truck.html">E3 Cement Mixer Truck</a></li>
                    <li><a href="E3-Dump-Truck.html">E3 Dump Truck</a></li>
                    <li><a href="E3-Muck-Truck.html">E3 Muck Truck</a></li>
                    <li><a href="E3-Sewage-Suction-Truck.html">E3 Sewage Suction Truck</a></li>
                    <li><a href="E3-Stake-Truck.html">E3 Stake Truck</a></li>
                    <li><a href="E3-Tractor-Truck.html">E3 Tractor Truck</a></li>
                    <li><a href="E3-Van-Truck.html">E3 Van Truck</a></li>
                    <li><a href="E3-Compactor-Garbage-Truck.html">E3 Compactor Garbage Truck</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <!-- MEDIUM DUTY TRUCKS -->
            <li>
              <a href="../trucks.html#medium-duty">MEDIUM DUTY TRUCKS</a>
              <ul class="sub-dropdown">
                <li>
                  <a href="../trucks.html#x6-series">X6 Series</a>
                  <ul class="truck-links">
                    <li><a href="X6-AWD-Cargo-Truck.html">X6 AWD Cargo Truck</a></li>
                    <li><a href="X6-Cargo-Truck.html">X6 Cargo Truck</a></li>
                    <li><a href="X6-Cement-Mixer-Truck.html">X6 Cement Mixer Truck</a></li>
                    <li><a href="X6-Concrete-Mixer-Truck.html">X6 Concrete Mixer Truck</a></li>
                    <li><a href="X6-Dropside-Truck.html">X6 Dropside Truck</a></li>
                    <li><a href="X6-Dump-Truck.html">X6 Dump Truck</a></li>
                    <li><a href="X6-Dust-Suppression-Truck.html">X6 Dust Suppression Truck</a></li>
                    <li><a href="X6-Flatbed-Truck.html">X6 Flatbed Truck</a></li>
                    <li><a href="X6-Fuel-Tanker-Truck.html">X6 Fuel Tanker Truck</a></li>
                    <li><a href="X6-Garbage-Truck.html">X6 Garbage Truck</a></li>
                    <li><a href="X6-Loading-Crane-Recovery-Truck.html">X6 Loading Crane Recovery Truck</a></li>
                    <li><a href="X6-Sprinkler-Truck.html">X6 Sprinkler Truck</a></li>
                    <li><a href="X6-Truck-Mounted-Crane.html">X6 Truck Mounted Crane</a></li>
                    <li><a href="X6-Van-Truck.html">X6 Van Truck</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#e6-series">E6 Series</a>
                  <ul class="truck-links">
                    <li><a href="E6-Cement-Mixer-Truck.html">E6 Cement Mixer Truck</a></li>
                    <li><a href="E6-Dump-Truck.html">E6 Dump Truck</a></li>
                    <li><a href="E6-Refrigerated-Truck.html">E6 Refrigerated Truck</a></li>
                    <li><a href="E6-Sprinkler-Truck.html">E6 Sprinkler Truck</a></li>
                    <li><a href="E6-Stake-Truck.html">E6 Stake Truck</a></li>
                    <li><a href="E6-Truck-Mounted-Crane.html">E6 Truck Mounted Crane</a></li>
                    <li><a href="E6-Van-Truck.html">E6 Van Truck</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <!-- HEAVY DUTY TRUCKS -->
            <li>
              <a href="../trucks.html#heavy-duty">HEAVY DUTY TRUCKS</a>
              <ul class="sub-dropdown">
                <li>
                  <a href="../trucks.html#9-series">9 Series</a>
                  <ul class="truck-links">
                    <li><a href="9-Series-Cement-Mixer-Truck.html">9 Series Cement Mixer Truck</a></li>
                    <li><a href="9-Series-Garbage-Truck.html">9 Series Garbage Truck</a></li>
                    <li><a href="9-Series-Sweeper.html">9 Series Sweeper</a></li>
                    <li><a href="9-Series-Tow-Truck.html">9 Series Tow Truck</a></li>
                    <li><a href="9-Series-Truck-Mounted-Crane.html">9 Series Truck Mounted Crane</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#6-series">6 Series</a>
                  <ul class="truck-links">
                    <li><a href="6-Series-Cement-Mixer-Truck.html">6 Series Cement Mixer Truck</a></li>
                    <li><a href="6-Series-Garbage-Truck.html">6 Series Garbage Truck</a></li>
                    <li><a href="6-Series-Sweeper.html">6 Series Sweeper</a></li>
                    <li><a href="6-Series-Truck-Mounted-Crane.html">6 Series Truck Mounted Crane</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#3-series">3 Series</a>
                  <ul class="truck-links">
                    <li><a href="3-Series-Cement-Mixer-Truck.html">3 Series Cement Mixer Truck</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#z3-series">Z3 Series</a>
                  <ul class="truck-links">
                    <li><a href="Z3-Dump-Truck.html">Z3 Dump Truck</a></li>
                  </ul>
                </li>
                <li>
                  <a href="../trucks.html#i9-series">i9 Series</a>
                  <ul class="truck-links">
                    <li><a href="i9-New-Series.html">i9 New Series</a></li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
'@

$truckFiles = Get-ChildItem -Path "trucks_html\*.html" | Where-Object { $_.Name -notlike "*generate*" -and $_.Name -notlike "*update*" }

foreach ($file in $truckFiles) {
    Write-Host "Updating navigation for: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # Find and replace the trucks-dropdown section
    $pattern = '(?s)<div class="trucks-dropdown">.*?</div>'
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $completeNavigation
        
        # Ensure proper hover functionality script is included
        $hoverScript = @'
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
'@
        
        # Replace existing hover script or add it before closing body tag
        if ($content -match '(?s)// Trucks dropdown hover functionality.*?</script>') {
            $content = $content -replace '(?s)// Trucks dropdown hover functionality.*?</script>', $hoverScript.Trim()
        } else {
            $content = $content -replace '</body>', "$hoverScript`n</body>"
        }
        
        # Save the updated content
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        
        Write-Host "Updated: $($file.Name)"
    } else {
        Write-Host "Could not find trucks-dropdown in: $($file.Name)"
    }
}

Write-Host "All truck pages navigation updated successfully!"
Write-Host "- Complete navigation with all truck links"
Write-Host "- Proper hover functionality added"
Write-Host "- Links point to respective truck pages"