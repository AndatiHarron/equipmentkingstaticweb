# PowerShell script to replace headers and footers across all HTML files
Write-Host "🔄 Starting Header/Footer Centralization Process..." -ForegroundColor Yellow

$rootDir = Get-Location
$processedFiles = 0
$skippedFiles = 0

# Function to get the appropriate CSS path based on file location
function Get-CSSPath {
    param($filePath)
    $relativePath = [System.IO.Path]::GetRelativePath($rootDir, $filePath)
    
    if ($relativePath -match "trucks_html\\|main_trucks_detailed\\") {
        return "../css/styles.css"
    }
    return "css/styles.css"
}

# Function to process HTML files
function Process-HTMLFile {
    param($filePath)
    try {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        $originalContent = $content
        
        # Skip if file is too small or doesn't contain proper HTML
        if ($content.Length -lt 100 -or $content -notmatch "<!DOCTYPE|<html") {
            Write-Host "⚠️  Skipped $filePath (not a valid HTML file)" -ForegroundColor Yellow
            return $false
        }
        
        # Determine CSS path
        $cssPath = Get-CSSPath $filePath
        $jsPath = $cssPath -replace 'css/styles.css', 'js/header-footer-loader.js'
        
        # Remove existing header (everything from <header> to </header> and its scripts)
        $content = $content -replace '(?s)<header>.*?</header>', ''
        
        # Remove header-related scripts
        $content = $content -replace '(?s)<script>[\s\S]*?trucks.*?dropdown.*?</script>', ''
        
        # Remove existing footer (everything from <footer> to </footer>)
        $content = $content -replace '(?s)<footer>.*?</footer>', ''
        
        # Remove footer-related scripts and font awesome links in footer area
        $content = $content -replace '(?s)<!-- Load Font Awesome Icons -->.*?</script>', ''
        
        # Extract title if exists
        $titleMatch = [regex]::Match($content, '<title>(.*?)</title>')
        $title = if ($titleMatch.Success) { $titleMatch.Groups[1].Value } else { "Equipment King" }
        
        # Create new head section
        $headSection = @"
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title</title>
    <link rel="stylesheet" href="$cssPath" />
    <script src="$jsPath"></script>
</head>
"@
        
        # Replace existing head section
        if ($content -match '(?s)<head>.*?</head>') {
            $content = $content -replace '(?s)<head>.*?</head>', $headSection
        }
        
        # Add placeholders for header and footer if <body> exists
        if ($content -match '<body[^>]*>') {
            # Add header placeholder right after body tag
            $content = $content -replace '(<body[^>]*>)', '$1`n    <div id="header-placeholder"></div>'
            
            # Add footer placeholder before closing body tag
            $content = $content -replace '(</body>)', '    <div id="footer-placeholder"></div>`n$1'
        }
        
        # Clean up extra whitespace and newlines
        $content = $content -replace '\r?\n\s*\r?\n\s*\r?\n', "`n`n"
        
        # Only write if content actually changed
        if ($content -ne $originalContent) {
            Set-Content $filePath -Value $content -Encoding UTF8
            Write-Host "✅ Updated: $filePath" -ForegroundColor Green
            return $true
        } else {
            Write-Host "⚠️  No changes needed: $filePath" -ForegroundColor Yellow
            return $false
        }
        
    } catch {
        Write-Host "❌ Error processing $filePath : $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Process main directory HTML files
Write-Host "`n📁 Processing main directory files..." -ForegroundColor Cyan
Get-ChildItem -Path $rootDir -Filter "*.html" | ForEach-Object {
    if (Process-HTMLFile $_.FullName) { $processedFiles++ } else { $skippedFiles++ }
}

# Process trucks_html directory
$trucksHtmlDir = Join-Path $rootDir "trucks_html"
if (Test-Path $trucksHtmlDir) {
    Write-Host "`n📁 Processing trucks_html directory..." -ForegroundColor Cyan
    Get-ChildItem -Path $trucksHtmlDir -Filter "*.html" | ForEach-Object {
        if (Process-HTMLFile $_.FullName) { $processedFiles++ } else { $skippedFiles++ }
    }
}

# Process main_trucks_detailed directory
$mainTrucksDir = Join-Path $rootDir "main_trucks_detailed"
if (Test-Path $mainTrucksDir) {
    Write-Host "`n📁 Processing main_trucks_detailed directory..." -ForegroundColor Cyan
    Get-ChildItem -Path $mainTrucksDir -Filter "*.html" | ForEach-Object {
        if (Process-HTMLFile $_.FullName) { $processedFiles++ } else { $skippedFiles++ }
    }
}

Write-Host "`n🎉 Header/Footer Centralization Complete!" -ForegroundColor Green
Write-Host "✅ Processed: $processedFiles files" -ForegroundColor Green
Write-Host "⚠️  Skipped: $skippedFiles files" -ForegroundColor Yellow
Write-Host "`n📋 Next Steps:" -ForegroundColor Cyan
Write-Host "  1. Test a few pages to ensure header/footer load correctly"
Write-Host "  2. Commit changes to git"
Write-Host "  3. Deploy to Vercel for testing"