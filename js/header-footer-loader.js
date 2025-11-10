// IMPORTANT: Universal Header and Footer Loader - ENHANCED FOR RELIABILITY
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

// IMPORTANT: Enhanced error handling and retry mechanism
let loadAttempts = 0;
const maxAttempts = 3;

// IMPORTANT: Enhanced async loader with retry and fallback - CRITICAL
async function loadHeaderFooter() {
    const basePath = getBasePath();
    loadAttempts++;
    
    console.log(`IMPORTANT: Loading header/footer attempt ${loadAttempts}`);
    
    try {
        // IMPORTANT: Load header with enhanced error handling
        const headerResponse = await fetch(basePath + 'resources/header.html');
        if (headerResponse.ok) {
            let headerContent = await headerResponse.text();
            // Replace {{BASE_PATH}} placeholders with actual base path
            headerContent = headerContent.replace(/\{\{BASE_PATH\}\}/g, basePath);
            
            // Find header placeholder or insert at beginning of body
            const headerPlaceholder = document.getElementById('header-placeholder');
            if (headerPlaceholder) {
                headerPlaceholder.innerHTML = headerContent;
                console.log('IMPORTANT: Header loaded successfully via placeholder');
                
                // IMPORTANT: Force CSS to apply to loaded header
                setTimeout(() => {
                    const dropdown = headerPlaceholder.querySelector('.dropdown-menu');
                    if (dropdown) {
                        console.log('IMPORTANT: Dropdown found, applying styles');
                        dropdown.style.display = 'none';
                        dropdown.style.position = 'absolute';
                        dropdown.style.zIndex = '9999';
                    }
                }, 100);
            } else {
                // Insert at the beginning of body
                document.body.insertAdjacentHTML('afterbegin', headerContent);
                console.log('IMPORTANT: Header loaded via body insertion');
            }
        } else {
            throw new Error(`Header fetch failed: ${headerResponse.status}`);
        }
        
        // IMPORTANT: Load footer with enhanced error handling
        const footerResponse = await fetch(basePath + 'resources/footer.html');
        if (footerResponse.ok) {
            let footerContent = await footerResponse.text();
            // Replace {{BASE_PATH}} placeholders with actual base path
            footerContent = footerContent.replace(/\{\{BASE_PATH\}\}/g, basePath);
            
            // Find footer placeholder or insert at end of body
            const footerPlaceholder = document.getElementById('footer-placeholder');
            if (footerPlaceholder) {
                footerPlaceholder.innerHTML = footerContent;
                console.log('IMPORTANT: Footer loaded successfully');
            } else {
                // Insert at the end of body
                document.body.insertAdjacentHTML('beforeend', footerContent);
            }
        }
        
        console.log('IMPORTANT: Header/Footer loading completed successfully');
        
    } catch (error) {
        console.error('IMPORTANT: Error loading header/footer:', error);
        
        // IMPORTANT: Retry mechanism
        if (loadAttempts < maxAttempts) {
            console.log(`IMPORTANT: Retrying... attempt ${loadAttempts + 1}/${maxAttempts}`);
            setTimeout(() => loadHeaderFooter(), 1000);
        } else {
            console.error('IMPORTANT: All attempts failed, header/footer not loaded');
        }
    }
}

// Load header and footer when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadHeaderFooter);
} else {
    loadHeaderFooter();
}