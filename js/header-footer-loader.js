// Universal Header and Footer Loader
// Automatically determines the correct base path and loads header/footer

function getBasePath() {
    const path = window.location.pathname;
    
    // If we're in a subdirectory like trucks_html/ or main_trucks_detailed/
    if (path.includes('/trucks_html/') || path.includes('/main_trucks_detailed/')) {
        return '../';
    }
    
    // If we're in the root directory
    return '';
}

async function loadHeaderFooter() {
    const basePath = getBasePath();
    
    // Check if running on file:// protocol (development without server)
    if (window.location.protocol === 'file:') {
        console.error('⚠️ Header/Footer cannot load: You are opening files directly (file:// protocol).');
        console.error('💡 Solution: Run a local server instead.');
        console.error('   Option 1: Run "npm run dev" (requires Node.js)');
        console.error('   Option 2: Use Python: "python -m http.server 8080"');
        console.error('   Option 3: Use VS Code Live Server extension');
        return;
    }
    
    try {
        // Load header
        const headerUrl = basePath + 'resources/header.html';
        const headerResponse = await fetch(headerUrl);
        if (headerResponse.ok) {
            let headerContent = await headerResponse.text();
            // Replace {{BASE_PATH}} placeholders with actual base path
            headerContent = headerContent.replace(/\{\{BASE_PATH\}\}/g, basePath);
            
            // Find header placeholder or insert at beginning of body
            const headerPlaceholder = document.getElementById('header-placeholder');
            if (headerPlaceholder) {
                headerPlaceholder.innerHTML = headerContent;
            } else {
                // Insert at the beginning of body
                document.body.insertAdjacentHTML('afterbegin', headerContent);
            }
        } else {
            console.error(`Failed to load header: ${headerResponse.status} ${headerResponse.statusText} from ${headerUrl}`);
        }
        
        // Load footer
        const footerUrl = basePath + 'resources/footer.html';
        const footerResponse = await fetch(footerUrl);
        if (footerResponse.ok) {
            let footerContent = await footerResponse.text();
            // Replace {{BASE_PATH}} placeholders with actual base path
            footerContent = footerContent.replace(/\{\{BASE_PATH\}\}/g, basePath);
            
            // Find footer placeholder or insert at end of body
            const footerPlaceholder = document.getElementById('footer-placeholder');
            if (footerPlaceholder) {
                footerPlaceholder.innerHTML = footerContent;
            } else {
                // Insert at the end of body
                document.body.insertAdjacentHTML('beforeend', footerContent);
            }
        } else {
            console.error(`Failed to load footer: ${footerResponse.status} ${footerResponse.statusText} from ${footerUrl}`);
        }
    } catch (error) {
        console.error('Error loading header/footer:', error);
        if (error.message.includes('fetch')) {
            console.error('💡 Make sure you are running a local development server, not opening files directly.');
        }
    }
}

// Load header and footer when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadHeaderFooter);
} else {
    loadHeaderFooter();
}