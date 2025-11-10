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
    
    try {
        // Load header
        const headerResponse = await fetch(basePath + 'resources/header.html');
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
        }
        
        // Load footer
        const footerResponse = await fetch(basePath + 'resources/footer.html');
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
        }
    } catch (error) {
        console.error('Error loading header/footer:', error);
    }
}

// Load header and footer when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadHeaderFooter);
} else {
    loadHeaderFooter();
}