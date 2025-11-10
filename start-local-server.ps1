# Local Development Server for Equipment King
# This starts a simple HTTP server to test image loading locally

Write-Host "=== Equipment King Local Development Server ===" -ForegroundColor Cyan
Write-Host "Starting local server to test image loading..." -ForegroundColor Yellow

# Check if Python is available for simple HTTP server
$pythonAvailable = $false
try {
    $pythonVersion = python --version 2>$null
    if ($pythonVersion) {
        $pythonAvailable = $true
        Write-Host "Python detected: $pythonVersion" -ForegroundColor Green
    }
} catch {
    Write-Host "Python not found" -ForegroundColor Yellow
}

# Check if Node.js is available
$nodeAvailable = $false
try {
    $nodeVersion = node --version 2>$null
    if ($nodeVersion) {
        $nodeAvailable = $true
        Write-Host "Node.js detected: $nodeVersion" -ForegroundColor Green
    }
} catch {
    Write-Host "Node.js not found" -ForegroundColor Yellow
}

Write-Host "`n=== Local Server Options ===" -ForegroundColor Cyan

if ($pythonAvailable) {
    Write-Host "Option 1: Python HTTP Server" -ForegroundColor Green
    Write-Host "  Run: python -m http.server 8000" -ForegroundColor White
    Write-Host "  Then visit: http://localhost:8000" -ForegroundColor White
}

if ($nodeAvailable) {
    Write-Host "Option 2: Node.js HTTP Server (if http-server is installed)" -ForegroundColor Green
    Write-Host "  Install: npm install -g http-server" -ForegroundColor White
    Write-Host "  Run: http-server -p 8000" -ForegroundColor White
    Write-Host "  Then visit: http://localhost:8000" -ForegroundColor White
}

Write-Host "Option 3: VS Code Live Server Extension" -ForegroundColor Green
Write-Host "  Install Live Server extension in VS Code" -ForegroundColor White
Write-Host "  Right-click index.html -> 'Open with Live Server'" -ForegroundColor White

Write-Host "`n=== Testing URLs ===" -ForegroundColor Cyan
Write-Host "Main site: http://localhost:8000/index.html" -ForegroundColor White
Write-Host "Image test: http://localhost:8000/image-test.html" -ForegroundColor White
Write-Host "Trucks page: http://localhost:8000/trucks.html" -ForegroundColor White

Write-Host "`n=== Common Issues & Solutions ===" -ForegroundColor Yellow
Write-Host "1. If images don't load:" -ForegroundColor White
Write-Host "   - Make sure you're using a local server (not file://) " -ForegroundColor Gray
Write-Host "   - Check browser console for 404 errors" -ForegroundColor Gray
Write-Host "   - Verify file paths are correct" -ForegroundColor Gray

Write-Host "2. If CSS doesn't load:" -ForegroundColor White  
Write-Host "   - Check Network tab in DevTools" -ForegroundColor Gray
Write-Host "   - Ensure no CORS issues with local server" -ForegroundColor Gray

Write-Host "`nStarting Python server now..." -ForegroundColor Green

if ($pythonAvailable) {
    Write-Host "Server starting at http://localhost:8000" -ForegroundColor Green
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    python -m http.server 8000
} else {
    Write-Host "Python not available. Please use one of the options above." -ForegroundColor Red
}