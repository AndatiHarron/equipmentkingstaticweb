// IMPORTANT: Enhanced Category Dropdown Hover Functionality
document.addEventListener('DOMContentLoaded', function() {
    console.log('IMPORTANT: Category dropdown system initializing...');
    
    // Get all category dropdown elements
    const categoryDropdowns = document.querySelectorAll('.category-dropdown');
    
    categoryDropdowns.forEach(function(dropdown) {
        const button = dropdown.querySelector('.tab-btn');
        const menu = dropdown.querySelector('.category-dropdown-menu');
        let hoverTimeout;
        
        if (button && menu) {
            console.log('IMPORTANT: Setting up category dropdown for:', button.textContent);
            
            // Mouse enter event with delay for better UX
            dropdown.addEventListener('mouseenter', function() {
                clearTimeout(hoverTimeout);
                
                // Add force-visible class for debugging
                menu.classList.add('force-visible');
                
                // Small delay to prevent accidental triggers
                hoverTimeout = setTimeout(function() {
                    console.log('IMPORTANT: Showing category dropdown for:', button.textContent);
                    menu.style.display = 'block';
                    menu.style.opacity = '1';
                    menu.style.visibility = 'visible';
                    menu.style.transform = 'translateY(0)';
                    menu.style.pointerEvents = 'auto';
                    menu.style.zIndex = '9999';
                }, 200);
            });
            
            // Mouse leave event with delay to prevent flickering
            dropdown.addEventListener('mouseleave', function() {
                clearTimeout(hoverTimeout);
                
                hoverTimeout = setTimeout(function() {
                    console.log('IMPORTANT: Hiding category dropdown for:', button.textContent);
                    menu.classList.remove('force-visible');
                    menu.style.display = 'none';
                    menu.style.opacity = '0';
                    menu.style.visibility = 'hidden';
                    menu.style.transform = 'translateY(-10px)';
                    menu.style.pointerEvents = 'none';
                }, 300);
            });
            
            // Keep dropdown open when hovering over menu itself
            menu.addEventListener('mouseenter', function() {
                clearTimeout(hoverTimeout);
            });
            
            // Hide dropdown when leaving menu
            menu.addEventListener('mouseleave', function() {
                clearTimeout(hoverTimeout);
                hoverTimeout = setTimeout(function() {
                    console.log('IMPORTANT: Hiding category dropdown (from menu):', button.textContent);
                    menu.classList.remove('force-visible');
                    menu.style.display = 'none';
                    menu.style.opacity = '0';
                    menu.style.visibility = 'hidden';
                    menu.style.transform = 'translateY(-10px)';
                    menu.style.pointerEvents = 'none';
                }, 200);
            });
        }
    });
    
    // IMPORTANT: Force CSS application for category dropdowns
    const style = document.createElement('style');
    style.textContent = `
        .category-dropdown:hover .category-dropdown-menu {
            display: block !important;
            opacity: 1 !important;
            visibility: visible !important;
            transform: translateY(0) !important;
            pointer-events: auto !important;
            z-index: 9999 !important;
        }
    `;
    document.head.appendChild(style);
    
    console.log('IMPORTANT: Category dropdown system initialized successfully!');
});

// IMPORTANT: Legacy showTab function (keep existing functionality)
function showTab(category, button) {
    console.log('IMPORTANT: Legacy showTab called for category:', category);
    
    // Remove active class from all buttons
    const allButtons = document.querySelectorAll('.tab-btn');
    allButtons.forEach(btn => btn.classList.remove('active'));
    
    // Add active class to current button
    button.classList.add('active');
    
    // Update tab content based on category
    const tabContent = document.getElementById('tabContent');
    if (tabContent) {
        let content = '';
        
        switch(category) {
            case 'light':
                content = '<p>Light Duty Trucks: Perfect for urban delivery and small cargo transport. Explore X9, E9, X7, and E3 series vehicles.</p>';
                break;
            case 'medium':
                content = '<p>Medium Duty Trucks: Ideal for construction and medium cargo transport. Discover E6 and X6 series vehicles with various configurations.</p>';
                break;
            case 'heavy':
                content = '<p>Heavy Duty Trucks: Built for demanding industrial applications. Check out our 3, 6, and 9 series heavy-duty vehicles.</p>';
                break;
            case 'special':
                content = '<p>Special Vehicles: Specialized equipment for unique applications including aerial platforms, recovery trucks, and more.</p>';
                break;
            case 'offroad':
                content = '<p>Off-road Trucks: Rugged vehicles designed for challenging terrain and extreme conditions.</p>';
                break;
            case 'newenergy':
                content = '<p>New Energy Vehicles: Eco-friendly electric and hybrid trucks for sustainable transportation solutions.</p>';
                break;
            default:
                content = '<p>Hover over a category to explore vehicle details.</p>';
        }
        
        tabContent.innerHTML = content;
    }
}

// IMPORTANT: Debug function for testing category dropdowns
function testCategoryDropdowns() {
    console.log('IMPORTANT: Testing category dropdown visibility...');
    
    const menus = document.querySelectorAll('.category-dropdown-menu');
    menus.forEach(function(menu, index) {
        menu.classList.add('force-visible');
        setTimeout(function() {
            menu.classList.remove('force-visible');
        }, 3000);
    });
    
    console.log('IMPORTANT: Category dropdown test completed!');
}

// IMPORTANT: Mobile touch support for category dropdowns
if ('ontouchstart' in window) {
    document.addEventListener('DOMContentLoaded', function() {
        const categoryDropdowns = document.querySelectorAll('.category-dropdown');
        
        categoryDropdowns.forEach(function(dropdown) {
            const button = dropdown.querySelector('.tab-btn');
            const menu = dropdown.querySelector('.category-dropdown-menu');
            
            if (button && menu) {
                button.addEventListener('touchstart', function(e) {
                    e.preventDefault();
                    
                    // Close all other dropdowns
                    categoryDropdowns.forEach(function(otherDropdown) {
                        if (otherDropdown !== dropdown) {
                            const otherMenu = otherDropdown.querySelector('.category-dropdown-menu');
                            if (otherMenu) {
                                otherMenu.style.display = 'none';
                            }
                        }
                    });
                    
                    // Toggle current dropdown
                    if (menu.style.display === 'block') {
                        menu.style.display = 'none';
                    } else {
                        menu.style.display = 'block';
                        menu.style.opacity = '1';
                        menu.style.visibility = 'visible';
                        menu.style.transform = 'translate(-50%, -50%)';
                        menu.style.pointerEvents = 'auto';
                        menu.style.zIndex = '9999';
                    }
                });
            }
        });
    });
}
