# Vercel CSS Deployment Checklist

## Issues Fixed:

✅ CSS path corrections in index.html and trucks.html
✅ Created css-test.html for diagnostics

## Common Vercel CSS Problems & Solutions:

### 1. Case Sensitivity

- Vercel is case-sensitive
- Check: css/styles.css vs CSS/styles.css vs Css/styles.css
- Solution: Use lowercase consistently

### 2. File Structure

Current structure (correct):

```
/
├── css/
│   └── styles.css
├── index.html (href="css/styles.css")
├── trucks.html (href="css/styles.css")
└── trucks_html/
    └── *.html (href="../css/styles.css")
```

### 3. MIME Type Issues

Add to vercel.json (if needed):

```json
{
  "headers": [
    {
      "source": "/(.*).css",
      "headers": [
        {
          "key": "Content-Type",
          "value": "text/css"
        }
      ]
    }
  ]
}
```

### 4. Build Configuration

Create vercel.json in root:

```json
{
  "buildCommand": null,
  "outputDirectory": ".",
  "installCommand": null
}
```

### 5. Cache Issues

- Clear browser cache
- Use hard refresh (Ctrl+F5)
- Check Network tab in DevTools

### 6. File Permissions

- Ensure css/styles.css is committed to git
- Check file exists in Vercel deployment

## Testing Steps:

1. Visit css-test.html on Vercel
2. Check browser DevTools Network tab
3. Verify css/styles.css loads with 200 status
4. Test individual truck pages

## Debugging Commands:

```bash
# Check if CSS file exists in deployment
curl https://yoursite.vercel.app/css/styles.css

# Check MIME type
curl -I https://yoursite.vercel.app/css/styles.css
```
