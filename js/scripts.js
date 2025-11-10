// IMPORTANT: Original Vehicle Data from Equipment King (EXACT EXTRACTION)
const tabData = {
  light:[
    {img:'assets/E( Van truck.webp',name:'E9 Van Truck',features:['Car-like display & modern cabin','Hydraulic power braking system','Tight turning diameter for city use'],id:'e9-van-truck'},
    {img:'assets/E9 Dump Truck.webp',name:'E9 Dump Truck',features:['High-strength H-type steel frame','Reinforced tyres for heavy duty','Comfortable wrap-around seat'],id:'e9-dump-truck'},
    {img:'assets/X9 tow.webp',name:'X9 Tow Truck',features:['Gradient >30% capability','Strong chassis for tough work','Ideal for rescue and towing'],id:'x9-tow-truck'},
    {img:'assets/X9 4x4.webp',name:'X9 4X4',features:['Gradient >30% capability','Strong chassis for tough work','Ideal for rescue and towing'],id:'x9-4x4'}
  ],
  medium:[
    {img:'assets/dump.webp',name:'E6 Dump Truck',features:['Large torque engine','High water tank clearance','Wheel-side reduction rear axle'],id:'e6-dump-truck'},
    {img:'assets/van.webp',name:'E6 Van Truck',features:['Oil-water separator system','Air processing APU module','Light steering system'],id:'e6-van-truck'},
    {img:'assets/drop.webp',name:'X6 Dropside Truck',features:['Oil-water separator system','Air processing APU module','Light steering system'],id:'x6-dropside-truck'},
    {img:'assets/awd.webp',name:'X6 AWD Cargo Truck',features:['Oil-water separator system','Air processing APU module','Light steering system'],id:'x6-awd-cargo-truck'}
  ],
  heavy:[
    {img:'assets/e1st.webp',name:'E1st Tractor',features:['Cummins engine + Eaton gearbox','Intelligent comfort cab design','Premium driving experience'],id:'e1st-tractor'},
    {img:'assets/z3t.webp',name:'Z3 Tractor Truck',features:['Dual warning system','Efficient power chain','Comfortable berth width 850mm'],id:'z3-tractor-truck'},
    {img:'assets/e3t.webp',name:'E3 Van Truck',features:['Dual warning system','Efficient power chain','Comfortable berth width 850mm'],id:'e3-van-truck'},
    {img:'assets/e3.webp',name:'E3 Tractor Truck',features:['Dual warning system','Efficient power chain','Comfortable berth width 850mm'],id:'e3-tractor-truck'}
  ],
  special:[
    {img:'assets/special1.webp',name:'X9 Aerial work platform truck',features:['High-capacity water tank','Quick deployment ladder','Advanced safety system'],id:'x9-aerial-work-platform-truck'},
    {img:'assets/x9t.webp',name:'X9 Tow Truck',features:['Emergency-ready interior','Advanced life support system','Reliable mobility performance'],id:'x9-tow-truck'},
    {img:'assets/x7c.webp',name:'X7 Concrete mixer Truck',features:['Oil-water separator system','Air processing APU module','Light steering system'],id:'x7-concrete-mixer-truck'},
    {img:'assets/e6t.webp',name:'E6 Truck-mounted Crane',features:['Oil-water separator system','Air processing APU module','Light steering system'],id:'e6-truck-mounted-crane'}
  ],
  offroad:[
    {img:'assets/9.webp',name:'9 Series',features:['Durability, high performance, and load-bearing','Multiple cabs available','Adaptable for all tankers'],id:'9-series'},
    {img:'assets/7.webp',name:'7 Series',features:['Powerful engine & excellent maneuverability','Reinforced oil pan protection','Double-layer frame design'],id:'7-series'},
    {img:'assets/6.webp',name:'6 Series',features:['Strong power & efficient transport','Reinforced design with iron bumper','Customized upper-body'],id:'6-series'},
    {img:'assets/off.webp',name:'Off-road Dump Truck',features:['850mm wide chassis for stability','Specialized mining suspension','Directional exhaust design'],id:'off-road-dump-truck'}
  ],
  newenergy:[
    {img:'assets/i9.webp',name:'i9',features:['Integrated electric drive axle','Range up to 430km, supports 120kW fast charge','Brake energy recovery system'],id:'i9'}
  ]
};

// IMPORTANT: Enhanced Category Dropdown Hover Functionality with Images
document.addEventListener('DOMContentLoaded', function() {
    console.log('IMPORTANT: Category dropdown system with images initializing...');
    
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
                    menu.style.display = 'none';
                    menu.style.opacity = '0';
                    menu.style.visibility = 'hidden';
                    menu.style.transform = 'translateY(-10px)';
                    menu.style.pointerEvents = 'none';
                }, 200);
            });
        }
    });
    
    console.log('IMPORTANT: Category dropdown system initialized successfully!');
});

// IMPORTANT: Navigation function for truck detail pages (ORIGINAL)
function navigateToTruckDetail(truckId) {
    console.log('IMPORTANT: Navigating to truck detail for:', truckId);
    window.location.href = `truck-detail.html?truck=${truckId}`;
}

// IMPORTANT: Original showTab function (EXACT EXTRACTION)
function showTab(type, btn){
    document.querySelectorAll('.tab-btn').forEach(b=>b.classList.remove('active'));
    btn.classList.add('active');
    const content=document.getElementById('tabContent');
    content.style.opacity=0;
    setTimeout(()=>{
      content.innerHTML=tabData[type].map(item=>`
        <div class='vehicle-card' onclick="navigateToTruckDetail('${item.id}')" style="cursor: pointer;">
          <img src='${item.img}' alt='${item.name}'>
          <div style='padding:22px 24px;text-align:left;'>
            <h3>${item.name}</h3>
            <ul>${item.features.map(f=>`<li>• ${f}</li>`).join('')}</ul>
          </div>
        </div>
      `).join('');
      content.style.opacity=1;
    },300);
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
