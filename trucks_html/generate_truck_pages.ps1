# Truck names list
$truckNames = @(
    "X9 Dump Truck",
    "X9 Van Truck",
    "X9 Fuel Tanker Truck",
    "X9 Garbage Truck",
    "X9 Refrigerated Truck",
    "E9 Refrigerated Truck",
    "E9 Dump Truck",
    "E9 Van Truck",
    "E9 Kitchen Waste Garbage Truck",
    "X7 Concrete Mixer Truck",
    "X7 Flatbed Truck",
    "X7 Sprinkler Truck",
    "X7 Truck Mounted Crane",
    "X7 Dump Truck",
    "i9 New Series",
    "E6 Dump Truck",
    "E6 Stake Truck",
    "E6 Van Truck",
    "E6 Refrigerated Truck",
    "E6 Sprinkler Truck",
    "E6 Truck Mounted Crane",
    "E6 Cement Mixer Truck",
    "X6 Dump Truck",
    "X6 Flatbed Truck",
    "X6 Van Truck",
    "X6 Truck Mounted Crane",
    "X6 Cargo Truck",
    "X6 AWD Cargo Truck",
    "X6 Dropside Truck",
    "X6 Cement Mixer Truck",
    "X6 Concrete Mixer Truck",
    "X6 Loading Crane Recovery Truck",
    "X6 Sprinkler Truck",
    "X6 Dust Suppression Truck",
    "X6 Garbage Truck",
    "X6 Fuel Tanker Truck",
    "Z3 Dump Truck",
    "E1st Tractor",
    "E3 Muck Truck",
    "E3 Tractor Truck",
    "E3 Van Truck",
    "E3 Dump Truck",
    "E3 Cement Mixer Truck",
    "E3 Compactor Garbage Truck",
    "E3 Stake Truck",
    "E3 Sewage Suction Truck",
    "9 Series Sweeper",
    "9 Series Garbage Truck",
    "9 Series Tow Truck",
    "9 Series Truck Mounted Crane",
    "9 Series Cement Mixer Truck",
    "6 Series Sweeper",
    "6 Series Garbage Truck",
    "6 Series Truck Mounted Crane",
    "6 Series Cement Mixer Truck",
    "3 Series Cement Mixer Truck"
)

# HTML template
$htmlTemplate = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/styles.css">
  <title>{0} - Equipment King</title>
</head>
<body>
  <header>
    <a>
      <div class="logo" onclick="location.href='\'../index.html\'">
        <img src="../assets/companylogo.webp" alt="Equipment King Logo" />
        Equipment King
      </div>
    </a>

    <nav>
      <a href="../index.html">Home</a>
      <a href="../trucks.html">Trucks</a>
      <a href="../about.html">About</a>
      <a href="../application.html">Application</a>

      <button class="contact-btn" onclick="location.href=\'\'">Contact Us</button>
    </nav>
  </header>

  <main style="padding: 80px 20px 40px; max-width: 1200px; margin: 0 auto;">
    <h1>{0}</h1>
    <p>Detailed information about the {0} will be available here soon.</p>
  </main>

  <footer>
    <!-- Load Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <div class="footer-container">
      <div>
        <h4>PRODUCTS</h4>
        <ul>
          <li><a href="../trucks.html#ldt">Light Duty Truck (4.5TGCW25T)</a></li>
          <li><a href="../trucks.html#mdt">Medium Duty Truck (12TGCW60T)</a></li>
          <li><a href="../trucks.html#hdt">Heavy Duty Truck (18TGCW100T)</a></li>
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
      <div> <span id="year">2025</span> Equipment King. All rights reserved.</div>
      <div>
        <a href="#">Privacy Policy</a> |
        <a href="#">Terms of Use</a> |
        <a href="#">Site Map</a>
      </div>
    </div>

    <script>
      // auto-update footer year
      document.getElementById("year").textContent = new Date().getFullYear();
    </script>
  </footer>
</body>
</html>
'@

# Generate HTML files
foreach ($truckName in $truckNames) {
    # Create filename by replacing spaces and special characters
    $fileName = $truckName -replace '[^\w\s-]', '' -replace '\s+', '-' -replace '--+', '-'
    $fileName = $fileName.Trim('-') + '.html'
    
    # Generate HTML content
    $htmlContent = $htmlTemplate -f $truckName
    
    # Write to file
    Set-Content -Path $fileName -Value $htmlContent -Encoding UTF8
    Write-Host "Created: $fileName"
}

Write-Host "All HTML files created successfully!"
