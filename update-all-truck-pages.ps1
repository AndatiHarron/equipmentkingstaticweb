# Update all truck pages with reduced margins, "|" bullets, and back2.jpeg images

$truckFiles = Get-ChildItem -Path "trucks_html\*.html" | Where-Object { $_.Name -notlike "*generate*" -and $_.Name -notlike "*update*" }

foreach ($file in $truckFiles) {
    Write-Host "Updating: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # Update margins (reduce by 70%)
    $content = $content -replace 'padding: 80px 20px 0;', 'padding: 80px 6px 0;'
    $content = $content -replace 'padding: 70px 15px 0;', 'padding: 70px 4px 0;'
    
    # Update bullets from ● to |
    $content = $content -replace "content: '●';", "content: '|';"
    
    # Update bullets from → to |
    $content = $content -replace "content: '→';", "content: '|';"
    
    # Update all truck images to use back2.jpeg (but keep company logo)
    $content = $content -replace 'src="../assets/trucks/[^"]*"', 'src="../assets/back2.jpeg"'
    
    # Save the updated content
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    
    Write-Host "Updated: $($file.Name)"
}

Write-Host "All truck pages updated successfully!"
Write-Host "- Margins reduced by 70%"
Write-Host "- Bullets changed to '|'"  
Write-Host "- All truck images changed to back2.jpeg"