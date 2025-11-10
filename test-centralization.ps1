# Simple Header/Footer Centralization Script
Write-Host "🔄 Starting Header/Footer Centralization..." -ForegroundColor Yellow

# Test on index.html first
$testFile = "index.html"
if (Test-Path $testFile) {
    Write-Host "📝 Processing $testFile..." -ForegroundColor Cyan
    
    $content = Get-Content $testFile -Raw -Encoding UTF8
    $originalContent = $content
    
    # Remove existing header
    $content = $content -replace '(?s)<header>.*?</header>', ''
    
    # Remove existing footer  
    $content = $content -replace '(?s)<footer>.*?</footer>', ''
    
    # Remove header/footer scripts
    $content = $content -replace '(?s)<script>[\s\S]*?dropdown.*?</script>', ''
    
    # Replace head section
    $title = "Equipment King"
    if ($content -match '<title>(.*?)</title>') {
        $title = $matches[1]
    }
    
    $newHead = @"
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="css/styles.css" />
    <script src="js/header-footer-loader.js"></script>
</head>
"@
    
    $content = $content -replace '(?s)<head>.*?</head>', $newHead
    
    # Add placeholders
    $content = $content -replace '(<body[^>]*>)', '$1`n    <div id="header-placeholder"></div>'
    $content = $content -replace '(</body>)', '    <div id="footer-placeholder"></div>`n$1'
    
    # Write back
    Set-Content $testFile -Value $content -Encoding UTF8
    Write-Host "✅ Updated $testFile" -ForegroundColor Green
}

Write-Host "✅ Test complete! Check index.html" -ForegroundColor Green