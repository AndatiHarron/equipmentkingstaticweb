# Equipment King Static Website

## How Header and Footer Work

The header and footer are loaded using a **pure client-side JavaScript solution** that works without any build step or server. The templates are embedded directly in `js/header-footer-loader.js`, so:

✅ **Works with `file://` protocol** - You can open HTML files directly  
✅ **No build step required** - Just open the files in your browser  
✅ **No server needed** - Works completely offline  
✅ **Fully static** - No framework dependencies  

### How It Works

1. The header and footer HTML templates are embedded as strings in `js/header-footer-loader.js`
2. When a page loads, the script:
   - Determines the correct base path (empty for root, `../` for subdirectories)
   - Replaces `{{BASE_PATH}}` placeholders with the correct path
   - Injects the header and footer into the page

### File Structure

- `resources/header.html` - Source template (for reference/editing)
- `resources/footer.html` - Source template (for reference/editing)
- `js/header-footer-loader.js` - **Active loader** with embedded templates
- All HTML files include: `<script src="js/header-footer-loader.js"></script>` or `<script src="../js/header-footer-loader.js"></script>`

### Updating Header/Footer

If you need to update the header or footer:

1. Edit `resources/header.html` or `resources/footer.html`
2. Copy the updated HTML into the corresponding template string in `js/header-footer-loader.js`
3. Make sure to escape any backticks or template literals if needed

### Development

You can open any HTML file directly in your browser - no server needed! However, if you want to use a local server for testing:

```bash
npm run dev
```

This starts a server at `http://localhost:8080` (optional, not required).

## Project Structure

- `resources/header.html` - Header template source
- `resources/footer.html` - Footer template source
- `js/header-footer-loader.js` - Active loader with embedded templates
- `index.html` - Home page
- `trucks.html` - Trucks listing page
- `trucks_html/` - Individual truck detail pages

