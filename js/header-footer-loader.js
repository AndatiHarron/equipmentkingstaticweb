// Universal Header and Footer Loader - Static Version
// Works with file:// protocol - no fetch() needed
// Templates are embedded directly in this file

function getBasePath() {
    const path = window.location.pathname;
    
    // If we're in a subdirectory like trucks_html/ or main_trucks_detailed/
    if (path.includes('/trucks_html/') || path.includes('/main_trucks_detailed/')) {
        return '../';
    }
    
    // If we're in the root directory
    return '';
}

// Header template with {{BASE_PATH}} placeholder
const headerTemplate = `<!-- Universal Header Component -->
<header>
   <a>
    <div class="logo" onclick="location.href='{{BASE_PATH}}index.html'">
      <img src="{{BASE_PATH}}assets/companylogo.webp" alt="Equipment King Logo" />
      Equipment King
    </div>
  </a>

  <!-- Mobile Menu Toggle -->
  <button class="mobile-menu-toggle" onclick="toggleMobileMenu()" aria-label="Toggle Menu">
    ☰
  </button>

  <nav id="main-nav">
    <a href="{{BASE_PATH}}index.html">Home</a>
    
    <!-- Trucks Dropdown - IMPORTANT: YOUR WORKING CASCADE SYSTEM -->
    <div class="trucks-dropdown">
      <a href="{{BASE_PATH}}trucks.html" class="trucks-btn">Trucks</a>
      <ul class="dropdown-menu">
          <!-- LIGHT DUTY TRUCKS -->
          <li>
            <a href="{{BASE_PATH}}trucks.html#light-duty">LIGHT DUTY TRUCKS</a>
            <ul class="sub-dropdown">
              <li>
                <a href="{{BASE_PATH}}trucks.html#x9-series">X9 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Tow-Truck.html">X9 Tow Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Aerial-Work-Platform-Truck.html">X9 Aerial Work Platform Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-4X4-Dump-Truck.html">X9 4X4 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Dump-Truck.html">X9 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Van-Truck.html">X9 Van Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Fuel-Tanker-Truck.html">X9 Fuel Tanker Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Garbage-Truck.html">X9 Garbage Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X9-Refrigerated-Truck.html">X9 Refrigerated Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#e9-series">E9 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/E9-Refrigerated-Truck.html">E9 Refrigerated Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E9-Dump-Truck.html">E9 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E9-Van-Truck.html">E9 Van Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E9-Kitchen-Waste-Garbage-Truck.html">E9 Kitchen Waste Garbage Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#x7-series">X7 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/X7-Concrete-Mixer-Truck.html">X7 Concrete Mixer Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X7-Flatbed-Truck.html">X7 Flatbed Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X7-Sprinkler-Truck.html">X7 Sprinkler Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X7-Truck-Mounted-Crane.html">X7 Truck Mounted Crane</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X7-Dump-Truck.html">X7 Dump Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#i9-series">i9 Series (New Energy)</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/i9-New-Energy-Truck.html">i9 (New Series) - Electric/Hybrid Technology</a></li>
                </ul>
              </li>
            </ul>
          </li>

          <!-- MEDIUM DUTY TRUCKS -->
          <li>
            <a href="{{BASE_PATH}}trucks.html#medium-duty">MEDIUM DUTY TRUCKS</a>
            <ul class="sub-dropdown">
              <li>
                <a href="{{BASE_PATH}}trucks.html#e6-series">E6 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Dump-Truck.html">E6 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Stake-Truck.html">E6 Stake Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Van-Truck.html">E6 Van Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Refrigerated-Truck.html">E6 Refrigerated Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Sprinkler-Truck.html">E6 Sprinkler Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Truck-Mounted-Crane.html">E6 Truck Mounted Crane</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E6-Cement-Mixer-Truck.html">E6 Cement Mixer Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#x6-series">X6 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Dump-Truck.html">X6 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Flatbed-Truck.html">X6 Flatbed Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Van-Truck.html">X6 Van Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Truck-Mounted-Crane.html">X6 Truck Mounted Crane</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Cargo-Truck.html">X6 Cargo Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-AWD-Cargo-Truck.html">X6 AWD Cargo Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Dropside-Truck.html">X6 Dropside Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Cement-Mixer-Truck.html">X6 Cement Mixer Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Concrete-Mixer-Truck.html">X6 Concrete Mixer Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Loading-Crane-Recovery-Truck.html">X6 Loading Crane Recovery Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Sprinkler-Truck.html">X6 Sprinkler Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Dust-Suppression-Truck.html">X6 Dust Suppression Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Garbage-Truck.html">X6 Garbage Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/X6-Fuel-Tanker-Truck.html">X6 Fuel Tanker Truck</a></li>
                </ul>
              </li>
            </ul>
          </li>

          <!-- HEAVY DUTY TRUCKS -->
          <li>
            <a href="{{BASE_PATH}}trucks.html#heavy-duty">HEAVY DUTY TRUCKS</a>
            <ul class="sub-dropdown">
              <li>
                <a href="{{BASE_PATH}}trucks.html#z3-series">Z3 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/Z3-Dump-Truck.html">Z3 Dump Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#e1st-series">E1st Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/E1st-Tractor.html">E1st Tractor</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#e3-series">E3 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Muck-Truck.html">E3 Muck Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Tractor-Truck.html">E3 Tractor Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Van-Truck.html">E3 Van Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Dump-Truck.html">E3 Dump Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Cement-Mixer-Truck.html">E3 Cement Mixer Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Compactor-Garbage-Truck.html">E3 Compactor Garbage Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Stake-Truck.html">E3 Stake Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/E3-Sewage-Suction-Truck.html">E3 Sewage Suction Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#9-series">9 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/9-Series-Sweeper.html">9 Series Sweeper</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/9-Series-Garbage-Truck.html">9 Series Garbage Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/9-Series-Tow-Truck.html">9 Series Tow Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/9-Series-Truck-Mounted-Crane.html">9 Series Truck Mounted Crane</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/9-Series-Cement-Mixer-Truck.html">9 Series Cement Mixer Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#6-series">6 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/6-Series-Sweeper.html">6 Series Sweeper</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/6-Series-Garbage-Truck.html">6 Series Garbage Truck</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/6-Series-Truck-Mounted-Crane.html">6 Series Truck Mounted Crane</a></li>
                  <li><a href="{{BASE_PATH}}trucks_html/6-Series-Cement-Mixer-Truck.html">6 Series Cement Mixer Truck</a></li>
                </ul>
              </li>
              <li>
                <a href="{{BASE_PATH}}trucks.html#3-series">3 Series</a>
                <ul class="truck-links">
                  <li><a href="{{BASE_PATH}}trucks_html/3-Series-Cement-Mixer-Truck.html">3 Series Cement Mixer Truck</a></li>
                </ul>
              </li>
            </ul>
          </li>
      </ul>
    </div>
    
    <a href="{{BASE_PATH}}about.html">About</a>

    <button class="contact-btn" onclick="location.href='{{BASE_PATH}}contact.html'">Contact Us</button>
  <button class="contact-btn" id="lang-toggle-btn" onclick="toggleLanguage()">Français</button>
  </nav>
</header>

<!-- Header JavaScript -->
<script>
// DROPDOWN SYSTEM NOW HANDLED BY PURE CSS - NO JAVASCRIPT NEEDED
// CSS handles: :hover states for .trucks-dropdown, .sub-dropdown, .truck-links
/* JavaScript removed - using CSS-only approach for better performance */
if (false) { // Disabled JavaScript dropdown logic
    const dropdownMenu = trucksDropdown.querySelector('.dropdown-menu');
    const allDropdowns = trucksDropdown.querySelectorAll('.dropdown-menu, .sub-dropdown, .truck-links');
    let globalTimeout;
    
    // Global timeout manager for smooth navigation
    function clearGlobalTimeout() {
        if (globalTimeout) {
            clearTimeout(globalTimeout);
            globalTimeout = null;
        }
    }
    
    function setGlobalTimeout(callback, delay) {
        clearGlobalTimeout();
        globalTimeout = setTimeout(callback, delay);
    }

    // Show glassy background overlay when any dropdown is active
    function showGlassyBackground() {
        document.body.style.transition = 'backdrop-filter 0.4s ease, background 0.4s ease';
        document.body.style.backdropFilter = 'blur(2px)';
        document.body.style.background = 'rgba(0, 0, 0, 0.02)';
    }
    
    function hideGlassyBackground() {
        document.body.style.backdropFilter = '';
        document.body.style.background = '';
        setTimeout(() => {
            document.body.style.transition = '';
        }, 400);
    }

    // Main trucks dropdown - optimized timing
    trucksDropdown.addEventListener('mouseenter', () => {
        clearGlobalTimeout();
        dropdownMenu.style.display = 'block';
        showGlassyBackground();
    });
    
    trucksDropdown.addEventListener('mouseleave', () => {
        setGlobalTimeout(() => {
            dropdownMenu.style.display = 'none';
            // Hide all sub-levels
            allDropdowns.forEach(dropdown => {
                if (dropdown !== dropdownMenu) {
                    dropdown.style.display = 'none';
                }
            });
            hideGlassyBackground();
        }, 600); // Extended 600ms delay for comfortable movement
    });

    // Keep dropdown open when hovering over any dropdown element
    allDropdowns.forEach(dropdown => {
        dropdown.addEventListener('mouseenter', () => {
            clearGlobalTimeout();
        });
        
        dropdown.addEventListener('mouseleave', () => {
            setGlobalTimeout(() => {
                dropdownMenu.style.display = 'none';
                allDropdowns.forEach(dd => {
                    if (dd !== dropdownMenu) {
                        dd.style.display = 'none';
                    }
                });
                hideGlassyBackground();
            }, 500); // 500ms delay when leaving dropdown areas
        });
    });

    // Sub-dropdown hover management with perfect timing
    const subDropdowns = trucksDropdown.querySelectorAll('.sub-dropdown');
    subDropdowns.forEach(subDropdown => {
        const parentLi = subDropdown.parentElement;
        let subTimeout;
        
        parentLi.addEventListener('mouseenter', () => {
            clearGlobalTimeout();
            clearTimeout(subTimeout);
            
            // Gentle delay for smooth cascade
            setTimeout(() => {
                subDropdown.style.display = 'block';
            }, 150);
        });

        parentLi.addEventListener('mouseleave', () => {
            subTimeout = setTimeout(() => {
                subDropdown.style.display = 'none';
                // Hide child truck-links
                const childTruckLinks = subDropdown.querySelectorAll('.truck-links');
                childTruckLinks.forEach(links => links.style.display = 'none');
            }, 400); // 400ms delay for sub-dropdowns
        });
        
        // Keep sub-dropdown open when hovering
        subDropdown.addEventListener('mouseenter', () => {
            clearTimeout(subTimeout);
            clearGlobalTimeout();
        });
    });

    // Truck-links hover management with perfect timing
    const truckLinks = trucksDropdown.querySelectorAll('.truck-links');
    truckLinks.forEach(truckLink => {
        const parentLi = truckLink.parentElement;
        let linkTimeout;
        
        parentLi.addEventListener('mouseenter', () => {
            clearGlobalTimeout();
            clearTimeout(linkTimeout);
            
            // Gentle delay for smooth cascade
            setTimeout(() => {
                truckLink.style.display = 'block';
            }, 150);
        });

        parentLi.addEventListener('mouseleave', () => {
            linkTimeout = setTimeout(() => {
                truckLink.style.display = 'none';
            }, 350); // 350ms delay for truck links
        });
        
        // Keep truck-links open when hovering
        truckLink.addEventListener('mouseenter', () => {
            clearTimeout(linkTimeout);
            clearGlobalTimeout();
        });
    });
}
</script>

<!-- Mobile Menu JavaScript -->
<script>
// Mobile Menu Toggle Function
function toggleMobileMenu() {
    const nav = document.getElementById('main-nav');
    const toggle = document.querySelector('.mobile-menu-toggle');
    
    if (nav && toggle) {
        nav.classList.toggle('mobile-open');
        
        // Update hamburger icon
        toggle.textContent = nav.classList.contains('mobile-open') ? '✕' : '☰';
        
        // Prevent body scroll when menu is open
        if (nav.classList.contains('mobile-open')) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = '';
        }
    }
}

// Helper function to check if an element is a dropdown toggle link
function isDropdownToggle(element) {
    if (!element || element.tagName !== 'A') return false;
    
    // Check if it's the main trucks dropdown toggle
    if (element.parentElement && element.parentElement.classList.contains('trucks-dropdown')) {
        return true;
    }
    
    // Check if it's a category dropdown toggle (has a sub-dropdown sibling)
    const subDropdown = element.nextElementSibling;
    if (subDropdown && subDropdown.classList.contains('sub-dropdown')) {
        return true;
    }
    
    // Check if it's a series dropdown toggle (has a truck-links sibling)
    const truckLinks = element.nextElementSibling;
    if (truckLinks && truckLinks.classList.contains('truck-links')) {
        return true;
    }
    
    return false;
}

// Close mobile menu when clicking on a link (but not dropdown toggles)
document.addEventListener('click', function(e) {
    const nav = document.getElementById('main-nav');
    const toggle = document.querySelector('.mobile-menu-toggle');
    
    if (nav && nav.classList.contains('mobile-open')) {
        // Close menu if clicking outside nav
        if (!nav.contains(e.target) && !toggle.contains(e.target)) {
            nav.classList.remove('mobile-open');
            if (toggle) {
                toggle.textContent = '☰';
            }
            document.body.style.overflow = '';
            return;
        }
        
        // Close menu when clicking on a navigation link (but NOT dropdown toggles)
        if (e.target.tagName === 'A' && nav.contains(e.target)) {
            // Check if this is a dropdown toggle - if so, don't close the menu
            if (isDropdownToggle(e.target)) {
                return; // Let the dropdown toggle handler manage this
            }
            
            // It's a regular navigation link, close the menu
            nav.classList.remove('mobile-open');
            if (toggle) {
                toggle.textContent = '☰';
            }
            document.body.style.overflow = '';
        }
    }
});

// Handle window resize for responsive behavior
window.addEventListener('resize', function() {
    const nav = document.getElementById('main-nav');
    const toggle = document.querySelector('.mobile-menu-toggle');
    
    if (window.innerWidth >= 768) {
        // Desktop mode - ensure nav is visible and menu is closed
        if (nav) {
            nav.classList.remove('mobile-open');
        }
        if (toggle) {
            toggle.textContent = '☰';
        }
        document.body.style.overflow = '';
    }
});

// Helper function to check if we're on mobile
function isMobileDevice() {
    return window.innerWidth <= 767 || /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

// Mobile dropdown functionality for trucks menu using event delegation
function setupMobileDropdowns() {
    const nav = document.getElementById('main-nav');
    if (!nav) return;
    
    // Use event delegation for better performance and dynamic content support
    nav.addEventListener('click', function(e) {
        // Only handle clicks on mobile devices
        if (!isMobileDevice()) {
            return;
        }
        
        const target = e.target;
        
        // Check if clicked element is a link
        if (target.tagName !== 'A') {
            return;
        }
        
        // Main trucks dropdown toggle
        if (target.parentElement && target.parentElement.classList.contains('trucks-dropdown')) {
            e.preventDefault();
            e.stopPropagation();
            const parent = target.parentElement;
            parent.classList.toggle('mobile-open');
            return;
        }
        
        // Category dropdowns (Light Duty, Medium Duty, Heavy Duty)
        // Check if this link has a sub-dropdown sibling
        const subDropdown = target.nextElementSibling;
        if (subDropdown && subDropdown.classList.contains('sub-dropdown')) {
            e.preventDefault();
            e.stopPropagation();
            subDropdown.classList.toggle('mobile-open');
            return;
        }
        
        // Series dropdowns (X9 Series, E6 Series, etc.)
        // Check if this link has a truck-links sibling
        const truckLinks = target.nextElementSibling;
        if (truckLinks && truckLinks.classList.contains('truck-links')) {
            e.preventDefault();
            e.stopPropagation();
            truckLinks.classList.toggle('mobile-open');
            return;
        }
    });
}

// setupMobileDropdowns will be called by loadHeaderFooter() after header insertion
</script>`;

// --- Language Toggle and Translation System ---
const translations = {
  en: {
    home: 'Home',
    trucks: 'Trucks',
    about: 'About',
    contact: 'Contact Us',
    language: 'Français',
    products: 'PRODUCTS',
    light: 'Light Duty Truck (4.5T≤GCW≤25T)',
    medium: 'Medium Duty Truck (12T≤GCW≤60T)',
    heavy: 'Heavy Duty Truck (18T≤GCW≤100T)',
    navigation: 'NAVIGATION',
    follow: 'FOLLOW US',
    privacy: 'Privacy Policy',
    terms: 'Terms of Use',
    sitemap: 'Site Map',
    allRights: 'All rights reserved.',
    explore: 'Explore Our Vehicle Categories',
    exploreFleet: 'Explore Our Latest Fleet',
    exploreAll: 'Explore All Trucks',
    heroTitle: 'Power Meets Precision',
    heroDesc: 'Experience cutting-edge engineering with Equipment King Incorporated in partnership with SAGMOTO.'
  },
  fr: {
    home: 'Accueil',
    trucks: 'Camions',
    about: 'À propos',
    contact: 'Contactez-nous',
    language: 'English',
    products: 'PRODUITS',
    light: 'Camion Léger (4,5T≤PTAC≤25T)',
    medium: 'Camion Moyen (12T≤PTAC≤60T)',
    heavy: 'Camion Lourd (18T≤PTAC≤100T)',
    navigation: 'NAVIGATION',
    follow: 'SUIVEZ-NOUS',
    privacy: 'Politique de confidentialité',
    terms: "Conditions d'utilisation", 
    sitemap: 'Plan du site',
    allRights: 'Tous droits réservés.',
    explore: 'Découvrez nos catégories de véhicules',
    exploreFleet: 'Découvrez notre dernière flotte',
    exploreAll: 'Voir tous les camions',
    heroTitle: 'La puissance rencontre la précision',
    heroDesc: "Découvrez l'ingénierie de pointe avec Equipment King Incorporated en partenariat avec SAGMOTO."
  }
};

let currentLang = 'en';

function toggleLanguage() {
  currentLang = (currentLang === 'en') ? 'fr' : 'en';
  applyTranslations();
}

function applyTranslations() {
  const t = translations[currentLang];
  // Header
  const nav = document.getElementById('main-nav');
  if (nav) {
    const navLinks = nav.querySelectorAll('a');
    navLinks.forEach(link => {
      if (link.href.includes('index.html')) link.textContent = t.home;
      if (link.href.includes('trucks.html')) link.textContent = t.trucks;
      if (link.href.includes('about.html')) link.textContent = t.about;
      if (link.href.includes('contact.html')) link.textContent = t.contact;
    });
    const contactBtn = nav.querySelector('.contact-btn[onclick*="contact.html"]');
    if (contactBtn) contactBtn.textContent = t.contact;
    const langBtn = document.getElementById('lang-toggle-btn');
    if (langBtn) langBtn.textContent = t.language;
  }
  // Footer
  const footer = document.querySelector('footer');
  if (footer) {
    const h4s = footer.querySelectorAll('h4');
    h4s.forEach(h4 => {
      if (h4.textContent.trim().toUpperCase() === 'PRODUCTS') h4.textContent = t.products;
      if (h4.textContent.trim().toUpperCase() === 'NAVIGATION') h4.textContent = t.navigation;
      if (h4.textContent.trim().toUpperCase() === 'FOLLOW US') h4.textContent = t.follow;
    });
    const navLinks = footer.querySelectorAll('ul:nth-child(2) a');
    navLinks.forEach(link => {
      if (link.href.includes('index.html')) link.textContent = t.home;
      if (link.href.includes('trucks.html')) link.textContent = t.trucks;
      if (link.href.includes('about.html')) link.textContent = t.about;
      if (link.href.includes('contact.html')) link.textContent = t.contact;
    });
    // Product links
    const prodLinks = footer.querySelectorAll('ul:nth-child(1) li');
    if (prodLinks.length === 3) {
      prodLinks[0].textContent = t.light;
      prodLinks[1].textContent = t.medium;
      prodLinks[2].textContent = t.heavy;
    }
    // Footer bottom
    const bottomDivs = footer.querySelectorAll('.footer-bottom > div');
    if (bottomDivs.length > 0) {
      bottomDivs[0].innerHTML = `© <span id="year">${new Date().getFullYear()}</span> Equipment King. ${t.allRights}`;
    }
    if (bottomDivs.length > 1) {
      const links = bottomDivs[1].querySelectorAll('a');
      if (links.length === 3) {
        links[0].textContent = t.privacy;
        links[1].textContent = t.terms;
        links[2].textContent = t.sitemap;
      }
    }
  }
  // Main page (index.html) - hero and tabs
  const heroH1 = document.querySelector('section.hero h1');
  if (heroH1) heroH1.textContent = t.heroTitle;
  const heroP = document.querySelector('section.hero p');
  if (heroP) heroP.textContent = t.heroDesc;
  const exploreH1 = document.querySelector('section.tabs h1');
  if (exploreH1) exploreH1.textContent = t.explore;
  const galleryH2 = document.querySelector('.gallery-content h2');
  if (galleryH2) galleryH2.textContent = t.exploreFleet;
  const exploreBtn = document.querySelector('.gallery-content .primary');
  if (exploreBtn) exploreBtn.textContent = t.exploreAll;
}

// Apply language on load
document.addEventListener('DOMContentLoaded', () => {
  applyTranslations();
});

// Footer template with {{BASE_PATH}} placeholder
const footerTemplate = `<!-- Universal Footer Component -->
<footer>
  <!-- Load Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

  <div class="footer-container">
    <div>
      <h4>PRODUCTS</h4>
      <ul>
        <li><a href="{{BASE_PATH}}trucks.html#light-duty">Light Duty Truck (4.5T≤GCW≤25T)</a></li>
        <li><a href="{{BASE_PATH}}trucks.html#medium-duty">Medium Duty Truck (12T≤GCW≤60T)</a></li>
        <li><a href="{{BASE_PATH}}trucks.html#heavy-duty">Heavy Duty Truck (18T≤GCW≤100T)</a></li>
      </ul>
    </div>

    <div>
      <h4>NAVIGATION</h4>
      <ul>
        <li><a href="{{BASE_PATH}}index.html">Home</a></li>
        <li><a href="{{BASE_PATH}}trucks.html">Trucks</a></li>
        <li><a href="{{BASE_PATH}}about.html">About</a></li>
        <li><a href="{{BASE_PATH}}contact.html">Contact Us</a></li>
      </ul>
    </div>

    <div>
      <h4>FOLLOW US</h4>
      <div class="social-links">
        <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
        <a href="#" title="Twitter / X"><i class="fab fa-x-twitter"></i></a>
        <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
        <a href="#" title="YouTube"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <div>© <span id="year">2025</span> Equipment King. All rights reserved.</div>
    <div>
      <a href="#">Privacy Policy</a> |
      <a href="#">Terms of Use</a> |
      <a href="#">Site Map</a>
    </div>
  </div>

  <script>
    // auto-update footer year
    document.getElementById("year").textContent = new Date().getFullYear();
  </script>
</footer>`;

// Load header and footer
function loadHeaderFooter() {
    const basePath = getBasePath();
    
    // Replace {{BASE_PATH}} placeholders
    let header = headerTemplate.replace(/\{\{BASE_PATH\}\}/g, basePath);
    let footer = footerTemplate.replace(/\{\{BASE_PATH\}\}/g, basePath);
    
    // Extract scripts from header (handle multiple script tags)
    let headerScripts = [];
    const headerScriptMatches = header.matchAll(/<script>([\s\S]*?)<\/script>/g);
    for (const match of headerScriptMatches) {
        headerScripts.push(match[1]);
        header = header.replace(match[0], ''); // Remove script tag from HTML
    }
    
    // Extract scripts from footer
    const footerScriptMatch = footer.match(/<script>([\s\S]*?)<\/script>/);
    let footerScript = null;
    if (footerScriptMatch) {
        footer = footer.replace(/<script>[\s\S]*?<\/script>/, ''); // Remove script tag
        footerScript = footerScriptMatch[1];
    }
    
    // Insert header HTML
            const headerPlaceholder = document.getElementById('header-placeholder');
            if (headerPlaceholder) {
        headerPlaceholder.outerHTML = header;
            } else {
        document.body.insertAdjacentHTML('afterbegin', header);
    }
    
    // Execute header scripts after header is inserted
    headerScripts.forEach(scriptContent => {
        const script = document.createElement('script');
        script.textContent = scriptContent;
        document.head.appendChild(script);
    });
    
    // Initialize mobile dropdowns after header scripts are executed
    // Use a small delay to ensure DOM is fully ready
    setTimeout(function() {
        if (typeof setupMobileDropdowns === 'function') {
            setupMobileDropdowns();
        }
    }, 50);
    
    // Insert footer HTML
            const footerPlaceholder = document.getElementById('footer-placeholder');
            if (footerPlaceholder) {
        footerPlaceholder.outerHTML = footer;
            } else {
        document.body.insertAdjacentHTML('beforeend', footer);
    }
    
    // Execute footer script after footer is inserted
    if (footerScript) {
        const script = document.createElement('script');
        script.textContent = footerScript;
        document.head.appendChild(script);
    }
}

// Load header and footer when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadHeaderFooter);
} else {
    loadHeaderFooter();
}
