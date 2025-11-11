# Equipment King Static Website

## Development Setup

### Why the header doesn't show in development

The header.html file is loaded using JavaScript's `fetch()` API, which **doesn't work** when you open HTML files directly using the `file://` protocol (double-clicking HTML files). This is a browser security restriction.

**Solution: Use a local development server**

### Quick Start

1. **Option 1: Using npm (Recommended)**
   ```bash
   npm install
   npm run dev
   ```
   This will start a server at `http://localhost:8080` and open it in your browser.

2. **Option 2: Using Python (if you have Python installed)**
   ```bash
   python -m http.server 8080
   ```
   Then open `http://localhost:8080` in your browser.

3. **Option 3: Using VS Code Live Server Extension**
   - Install the "Live Server" extension in VS Code
   - Right-click on `index.html` and select "Open with Live Server"

### Why it works in production

In production (Vercel), files are served over HTTP/HTTPS, so `fetch()` works perfectly. The browser's security restrictions only apply to the `file://` protocol.

## Project Structure

- `resources/header.html` - Header component (loaded dynamically)
- `resources/footer.html` - Footer component (loaded dynamically)
- `js/header-footer-loader.js` - Script that loads header/footer
- `index.html` - Home page
- `trucks.html` - Trucks listing page
- `trucks_html/` - Individual truck detail pages

