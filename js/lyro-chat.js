/**
 * Equipment King - Universal Lyro AI Chat Integration
 * This file provides consistent Lyro chat functionality across all pages
 */

// Global Lyro configuration
window.EquipmentKingChat = {
    initialized: false,
    chatOpen: false,
    
    // Enhanced Lyro chat integration with multiple fallback methods
    openLyroChat: function() {
        console.log('Attempting to open Lyro chat...');
        
        // Method 1: Official Lyro widget
        if (window.Lyro && typeof window.Lyro.open === 'function') {
            console.log('Opening official Lyro widget');
            window.Lyro.open();
            return;
        }
        
        // Method 2: Alternative Lyro widget format
        if (window.lyroWidget && typeof window.lyroWidget.open === 'function') {
            console.log('Opening Lyro widget (alternative format)');
            window.lyroWidget.open();
            return;
        }
        
        // Method 3: Check for Lyro iframe or container
        const lyroContainer = document.querySelector('[data-lyro-widget]') || 
                            document.querySelector('.lyro-widget') || 
                            document.querySelector('#lyro-widget');
        if (lyroContainer) {
            console.log('Found Lyro container, attempting to show');
            lyroContainer.style.display = 'block';
            return;
        }
        
        // Method 4: Try to trigger Lyro through events
        if (window.Lyro) {
            console.log('Triggering Lyro through events');
            try {
                window.Lyro.show();
            } catch (e) {
                console.log('Lyro.show() failed, trying other methods');
            }
            return;
        }
        
        // Method 5: PostMessage to Lyro iframe
        const lyroIframe = document.querySelector('iframe[src*="lyro"]');
        if (lyroIframe) {
            console.log('Sending message to Lyro iframe');
            lyroIframe.contentWindow.postMessage({ action: 'open' }, '*');
            return;
        }
        
        console.log('No official Lyro found, using Equipment King AI fallback');
        // Fallback - create our custom chat interface
        this.createFallbackChat();
    },

    // Fallback chat interface if Lyro isn't loaded
    createFallbackChat: function() {
        // Remove existing chat if any
        const existingChat = document.getElementById('fallback-chat');
        if (existingChat) {
            existingChat.remove();
            this.chatOpen = false;
            return;
        }

        this.chatOpen = true;

        // Create chat interface
        const chatContainer = document.createElement('div');
        chatContainer.id = 'fallback-chat';
        chatContainer.innerHTML = `
            <div style="
                position: fixed;
                bottom: 100px;
                right: 20px;
                width: 350px;
                height: 500px;
                background: rgba(255,255,255,0.95);
                backdrop-filter: blur(20px);
                -webkit-backdrop-filter: blur(20px);
                border: 1px solid rgba(255,255,255,0.3);
                border-radius: 16px;
                box-shadow: 0 12px 40px rgba(0,0,0,0.15);
                z-index: 10000;
                display: flex;
                flex-direction: column;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                animation: slideInUp 0.3s ease-out;
            ">
                <!-- Chat Header -->
                <div style="
                    padding: 20px;
                    border-bottom: 1px solid rgba(255,255,255,0.3);
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background: rgba(52, 152, 219, 0.1);
                    border-radius: 16px 16px 0 0;
                ">
                    <div>
                        <h3 style="margin: 0; color: #2c3e50; font-size: 18px; font-weight: 600;">
                            <i class="fas fa-robot" style="margin-right: 8px; color: #3498db;"></i>
                            Equipment King AI
                        </h3>
                        <p style="margin: 0; color: #34495e; font-size: 14px;">How can I help you today?</p>
                    </div>
                    <button onclick="window.EquipmentKingChat.createFallbackChat()" style="
                        background: none;
                        border: none;
                        font-size: 24px;
                        color: #7f8c8d;
                        cursor: pointer;
                        padding: 5px;
                        border-radius: 50%;
                        transition: all 0.3s ease;
                    " onmouseover="this.style.background='rgba(231,76,60,0.1)'; this.style.color='#e74c3c'" 
                       onmouseout="this.style.background='none'; this.style.color='#7f8c8d'">×</button>
                </div>
                
                <!-- Chat Messages -->
                <div id="chat-messages" style="
                    flex: 1;
                    padding: 20px;
                    overflow-y: auto;
                    display: flex;
                    flex-direction: column;
                    gap: 15px;
                ">
                    <div style="
                        background: rgba(52, 152, 219, 0.1);
                        padding: 12px 16px;
                        border-radius: 12px;
                        max-width: 80%;
                        animation: fadeInUp 0.5s ease-out;
                    ">
                        <p style="margin: 0; color: #2c3e50; font-size: 14px;">
                            👋 Hello! I'm here to help you find the perfect commercial truck for your business. 
                            What type of vehicle are you looking for?
                        </p>
                    </div>
                    <div style="
                        background: rgba(52, 152, 219, 0.1);
                        padding: 12px 16px;
                        border-radius: 12px;
                        max-width: 80%;
                        animation: fadeInUp 0.7s ease-out;
                    ">
                        <p style="margin: 0; color: #2c3e50; font-size: 14px;">
                            💼 I can help with:
                            <br>• Light, Medium & Heavy Duty Trucks
                            <br>• Special Vehicles & Equipment
                            <br>• Parts & Service Information
                            <br>• Financing Options
                            <br>• Technical Specifications
                        </p>
                    </div>
                </div>
                
                <!-- Chat Input -->
                <div style="
                    padding: 20px;
                    border-top: 1px solid rgba(255,255,255,0.3);
                    display: flex;
                    gap: 10px;
                ">
                    <input type="text" id="chat-input" placeholder="Ask about trucks, specifications, pricing..." style="
                        flex: 1;
                        padding: 12px 16px;
                        border: 1px solid rgba(255,255,255,0.4);
                        border-radius: 25px;
                        background: rgba(255,255,255,0.3);
                        backdrop-filter: blur(10px);
                        font-size: 14px;
                        color: #2c3e50;
                        transition: all 0.3s ease;
                    " onkeypress="if(event.key==='Enter') window.EquipmentKingChat.sendMessage()"
                       onfocus="this.style.borderColor='#3498db'; this.style.boxShadow='0 0 0 3px rgba(52,152,219,0.2)'"
                       onblur="this.style.borderColor='rgba(255,255,255,0.4)'; this.style.boxShadow='none'">
                    <button onclick="window.EquipmentKingChat.sendMessage()" style="
                        background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
                        border: none;
                        color: white;
                        padding: 12px 20px;
                        border-radius: 25px;
                        cursor: pointer;
                        font-size: 14px;
                        font-weight: 600;
                        transition: all 0.3s ease;
                        box-shadow: 0 4px 15px rgba(52,152,219,0.3);
                    " onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 20px rgba(52,152,219,0.4)'"
                       onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 15px rgba(52,152,219,0.3)'">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
            
            <style>
                @keyframes slideInUp {
                    from { transform: translateY(100%); opacity: 0; }
                    to { transform: translateY(0); opacity: 1; }
                }
                
                @keyframes fadeInUp {
                    from { transform: translateY(20px); opacity: 0; }
                    to { transform: translateY(0); opacity: 1; }
                }
                
                #chat-messages::-webkit-scrollbar {
                    width: 6px;
                }
                
                #chat-messages::-webkit-scrollbar-track {
                    background: rgba(255,255,255,0.1);
                    border-radius: 3px;
                }
                
                #chat-messages::-webkit-scrollbar-thumb {
                    background: rgba(52,152,219,0.3);
                    border-radius: 3px;
                }
                
                #chat-messages::-webkit-scrollbar-thumb:hover {
                    background: rgba(52,152,219,0.5);
                }
            </style>
        `;
        
        document.body.appendChild(chatContainer);
        
        // Focus input after animation
        setTimeout(() => {
            const input = document.getElementById('chat-input');
            if (input) input.focus();
        }, 300);
    },

    // Send message function with enhanced AI responses
    sendMessage: function() {
        const input = document.getElementById('chat-input');
        const messagesContainer = document.getElementById('chat-messages');
        
        if (!input || !messagesContainer || !input.value.trim()) return;
        
        const message = input.value.trim();
        input.value = '';
        
        // Add user message
        const userMessage = document.createElement('div');
        userMessage.style.cssText = `
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            padding: 12px 16px;
            border-radius: 12px;
            max-width: 80%;
            margin-left: auto;
            animation: fadeInUp 0.3s ease-out;
            box-shadow: 0 4px 15px rgba(52,152,219,0.3);
        `;
        userMessage.innerHTML = `<p style="margin: 0; font-size: 14px;">${message}</p>`;
        messagesContainer.appendChild(userMessage);
        
        // Auto-scroll
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        
        // Show typing indicator
        const typingIndicator = document.createElement('div');
        typingIndicator.id = 'typing-indicator';
        typingIndicator.style.cssText = `
            background: rgba(52, 152, 219, 0.1);
            padding: 12px 16px;
            border-radius: 12px;
            max-width: 80%;
            animation: fadeInUp 0.3s ease-out;
        `;
        typingIndicator.innerHTML = `
            <p style="margin: 0; color: #2c3e50; font-size: 14px;">
                <i class="fas fa-robot" style="color: #3498db; margin-right: 5px;"></i>
                <span style="animation: pulse 1.5s infinite;">Typing...</span>
            </p>
        `;
        messagesContainer.appendChild(typingIndicator);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        
        // Simulate AI response with context-aware answers
        setTimeout(() => {
            // Remove typing indicator
            const indicator = document.getElementById('typing-indicator');
            if (indicator) indicator.remove();
            
            const aiResponse = document.createElement('div');
            aiResponse.style.cssText = `
                background: rgba(52, 152, 219, 0.1);
                padding: 12px 16px;
                border-radius: 12px;
                max-width: 80%;
                animation: fadeInUp 0.3s ease-out;
            `;
            
            // Context-aware responses based on message content
            let response = this.getContextualResponse(message.toLowerCase());
            
            aiResponse.innerHTML = `<p style="margin: 0; color: #2c3e50; font-size: 14px;">🤖 ${response}</p>`;
            messagesContainer.appendChild(aiResponse);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }, Math.random() * 2000 + 1000); // 1-3 seconds delay for realism
    },

    // Generate contextual responses based on user input
    getContextualResponse: function(message) {
        const responses = {
            // Truck-related keywords
            truck: [
                "We have an extensive range of commercial trucks! Are you looking for light-duty, medium-duty, or heavy-duty vehicles?",
                "Our truck inventory includes E-series, X-series, and specialized vehicles. What's your intended use?",
                "I can help you find the perfect truck. What type of business operations will you be using it for?"
            ],
            price: [
                "Pricing varies by model and specifications. I'd recommend speaking with our sales team at +1 (555) 123-4567 for detailed quotes.",
                "For accurate pricing information, please contact our sales department. They can provide customized quotes based on your needs.",
                "Prices depend on configuration and options. Would you like me to connect you with our sales team for a personalized quote?"
            ],
            specifications: [
                "I can provide detailed specifications! Which truck model are you interested in?",
                "Our trucks come with comprehensive spec sheets. Are you looking for engine details, payload capacity, or dimensions?",
                "Specifications vary by model. Check out our trucks page for detailed technical information, or I can help you find specific models."
            ],
            financing: [
                "We offer various financing options for commercial vehicles. Our finance team can discuss terms that work for your business.",
                "Yes, we have financing solutions available! Contact our sales team to discuss rates and terms.",
                "Equipment King provides flexible financing options. Would you like to speak with our finance specialist?"
            ],
            parts: [
                "We maintain a comprehensive parts inventory for all our truck models. What specific parts do you need?",
                "Our parts department can help with genuine parts and accessories. Contact support@equipmentking.com for availability.",
                "Yes, we stock parts for all Equipment King vehicles. What truck model do you need parts for?"
            ],
            service: [
                "Our service department provides maintenance and repair services. What type of service do you need?",
                "We offer comprehensive service support for all Equipment King vehicles. Schedule service by calling our support team.",
                "Service is available at our facility. What kind of maintenance or repair are you looking for?"
            ],
            contact: [
                "You can reach us at +1 (555) 123-4567 or email sales@equipmentking.com. Our showroom is open Monday-Friday 8AM-6PM.",
                "Contact our team at sales@equipmentking.com or visit our showroom at 123 Industrial Drive. We're here to help!",
                "Call us at +1 (555) 123-4567 or use our contact form. Our sales team is ready to assist you!"
            ]
        };

        // Check for keywords and return appropriate response
        for (const [keyword, responseArray] of Object.entries(responses)) {
            if (message.includes(keyword)) {
                return responseArray[Math.floor(Math.random() * responseArray.length)];
            }
        }

        // Default responses for general queries
        const defaultResponses = [
            "That's a great question! For detailed information, I recommend speaking with our sales team at +1 (555) 123-4567.",
            "I'd be happy to help you with that! Could you tell me more about your specific requirements?",
            "Great question! Our team of truck specialists can provide detailed answers. Would you like me to connect you with them?",
            "I understand your interest! For the most accurate information, please contact our sales team or fill out our contact form.",
            "That's an important consideration! Our experienced team can provide specific recommendations. Call +1 (555) 123-4567 to discuss.",
            "Excellent question! Visit our trucks page for more details, or speak directly with our sales specialists for personalized advice."
        ];

        return defaultResponses[Math.floor(Math.random() * defaultResponses.length)];
    },

    // Initialize Lyro integration
    init: function() {
        if (this.initialized) return;
        
        console.log('Initializing Equipment King Chat System...');
        
        // Load official Lyro script
        const lyroScript = document.createElement('script');
        lyroScript.src = 'https://widget.lyro.ai/widget.js';
        lyroScript.async = true;
        lyroScript.onload = function() {
            try {
                if (window.Lyro && typeof window.Lyro.init === 'function') {
                    window.Lyro.init({
                        // widgetId: 'your-widget-id-here', // Replace with actual widget ID
                        position: 'bottom-right',
                        theme: 'light',
                        language: 'en',
                        autoOpen: false
                    });
                    console.log('Lyro AI widget loaded successfully');
                }
            } catch (error) {
                console.log('Lyro widget initialization failed, fallback available');
            }
        };
        lyroScript.onerror = function() {
            console.log('Lyro script failed to load, using fallback chat');
        };
        document.head.appendChild(lyroScript);
        
        // Alternative widget initialization
        window.lyroAsyncInit = function() {
            if (window.Lyro) {
                window.Lyro.init({
                    autoOpen: false,
                    showWhenOffline: true
                });
            }
        };
        
        setTimeout(() => {
            if (!window.Lyro && !window.lyroWidget) {
                console.log('Equipment King AI fallback chat system ready');
            }
        }, 3000);
        
        this.initialized = true;
        console.log('Equipment King Chat System initialized');
    }
};

// Global function for backward compatibility
function openLyroChat() {
    window.EquipmentKingChat.openLyroChat();
}

// Auto-initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        window.EquipmentKingChat.init();
    });
} else {
    window.EquipmentKingChat.init();
}