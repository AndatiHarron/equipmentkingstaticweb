// Lyro Chat Integration for Equipment King
// Production-ready chat implementation

class LyroChat {
    constructor() {
        this.isOpen = false;
        this.chatContainer = null;
        this.init();
    }

    init() {
        this.createChatContainer();
        this.loadChatbot();
    }

    createChatContainer() {
        // Create chat overlay
        const overlay = document.createElement('div');
        overlay.id = 'lyro-chat-overlay';
        overlay.className = 'lyro-overlay';
        overlay.style.cssText = `
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 10000;
        `;

        // Create chat container
        this.chatContainer = document.createElement('div');
        this.chatContainer.id = 'lyro-chat-container';
        this.chatContainer.className = 'lyro-chat-container';
        this.chatContainer.style.cssText = `
            display: none;
            position: fixed;
            bottom: 90px;
            right: 20px;
            width: 350px;
            height: 500px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            z-index: 10001;
            overflow: hidden;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            border: 2px solid #000;
        `;

        // Create chat header
        const header = document.createElement('div');
        header.style.cssText = `
            background: #000;
            color: #fff;
            padding: 16px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 16px 16px 0 0;
            border-bottom: 2px solid #222;
        `;
        header.innerHTML = `
            <div>
                <h4 style="margin: 0; font-size: 16px; font-weight: 600; color: #fff;">Equipment King Assistant</h4>
                <p style="margin: 4px 0 0 0; font-size: 12px; opacity: 0.8; color: #fff;">How can we help you today?</p>
            </div>
            <button onclick="closeLyroChat()" style="
                background: none;
                border: none;
                color: #fff;
                font-size: 18px;
                cursor: pointer;
                padding: 4px;
                border-radius: 4px;
                transition: background 0.2s;
            " onmouseover="this.style.background='#222'" onmouseout="this.style.background='none'">×</button>
        `;

        // Create chat content area
        const content = document.createElement('div');
        content.id = 'lyro-chat-content';
        content.style.cssText = `
            height: calc(100% - 140px);
            overflow-y: auto;
            padding: 20px;
            background: #f8f9fa;
        `;

        // Create initial message
        content.innerHTML = `
            <div style="
                background: white;
                padding: 16px;
                border-radius: 12px;
                margin-bottom: 16px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            ">
                <p style="margin: 0 0 12px 0; font-weight: 600; color: #333;">👋 Welcome to Equipment King!</p>
                <p style="margin: 0 0 12px 0; color: #666; font-size: 14px;">I'm here to help you with:</p>
                <ul style="margin: 0; padding-left: 16px; color: #666; font-size: 14px;">
                    <li>Truck specifications & pricing</li>
                    <li>Product recommendations</li>
                    <li>Technical support</li>
                    <li>Contact information</li>
                </ul>
            </div>
            <div style="
                display: grid;
                gap: 8px;
                margin-top: 16px;
            ">
                <button onclick="sendQuickMessage('I need truck specifications')" style="
                    background: #f0f0f0;
                    border: 1px solid #ddd;
                    padding: 12px;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 14px;
                    text-align: left;
                    transition: all 0.2s;
                " onmouseover="this.style.background='#e8e8e8'" onmouseout="this.style.background='#f0f0f0'">🚛 View truck specifications</button>
                
                <button onclick="sendQuickMessage('I want to get a quote')" style="
                    background: #f0f0f0;
                    border: 1px solid #ddd;
                    padding: 12px;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 14px;
                    text-align: left;
                    transition: all 0.2s;
                " onmouseover="this.style.background='#e8e8e8'" onmouseout="this.style.background='#f0f0f0'">💰 Get pricing & quotes</button>
                
                <button onclick="sendQuickMessage('I need technical support')" style="
                    background: #f0f0f0;
                    border: 1px solid #ddd;
                    padding: 12px;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 14px;
                    text-align: left;
                    transition: all 0.2s;
                " onmouseover="this.style.background='#e8e8e8'" onmouseout="this.style.background='#f0f0f0'">🔧 Technical support</button>
                
                <button onclick="sendQuickMessage('How can I contact you?')" style="
                    background: #f0f0f0;
                    border: 1px solid #ddd;
                    padding: 12px;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 14px;
                    text-align: left;
                    transition: all 0.2s;
                " onmouseover="this.style.background='#e8e8e8'" onmouseout="this.style.background='#f0f0f0'">📞 Contact information</button>
            </div>
        `;

        // Create input area
        const inputArea = document.createElement('div');
        inputArea.style.cssText = `
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            border-top: 1px solid #eee;
            padding: 16px 20px;
            display: flex;
            gap: 8px;
            align-items: center;
        `;
        inputArea.innerHTML = `
            <input type="text" id="lyro-chat-input" placeholder="Type your message..." style="
                flex: 1;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
                outline: none;
            " onkeypress="if(event.key==='Enter') sendChatMessage()">
            <button onclick="sendChatMessage()" style="
                background: #444;
                color: white;
                border: none;
                padding: 12px 16px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 14px;
                transition: background 0.2s;
            " onmouseover="this.style.background='#333'" onmouseout="this.style.background='#444'">Send</button>
        `;

        // Assemble chat container
        this.chatContainer.appendChild(header);
        this.chatContainer.appendChild(content);
        this.chatContainer.appendChild(inputArea);

        // Add mobile responsiveness
        const style = document.createElement('style');
        style.textContent = `
            @media (max-width: 768px) {
                #lyro-chat-container {
                    width: calc(100vw - 40px) !important;
                    height: calc(100vh - 120px) !important;
                    bottom: 10px !important;
                    right: 20px !important;
                    left: 20px !important;
                }
            }
        `;
        document.head.appendChild(style);

        // Add to page
        document.body.appendChild(overlay);
        document.body.appendChild(this.chatContainer);
    }

    loadChatbot() {
        // Chat is ready

    }

    open() {
        if (this.chatContainer) {
            this.chatContainer.style.display = 'block';
            document.getElementById('lyro-chat-overlay').style.display = 'block';
            this.isOpen = true;
            
            // Focus input
            setTimeout(() => {
                const input = document.getElementById('lyro-chat-input');
                if (input) input.focus();
            }, 100);
        }
    }

    close() {
        if (this.chatContainer) {
            this.chatContainer.style.display = 'none';
            document.getElementById('lyro-chat-overlay').style.display = 'none';
            this.isOpen = false;
        }
    }

    async sendMessage(message) {
        const content = document.getElementById('lyro-chat-content');
        if (!content) return;

        // Add user message
        const userMsg = document.createElement('div');
        userMsg.style.cssText = `
            margin: 16px 0;
            text-align: right;
        `;
        userMsg.innerHTML = `
            <div style="
                display: inline-block;
                background: #000;
                color: #fff;
                padding: 12px 16px;
                border-radius: 12px 12px 4px 12px;
                max-width: 80%;
                font-size: 14px;
                border: 1px solid #222;
            ">${message}</div>
        `;
        content.appendChild(userMsg);

        // Auto response based on message
        setTimeout(async () => {
            const botMsg = document.createElement('div');
            botMsg.style.cssText = `
                margin: 16px 0;
                text-align: left;
            `;
            let response = await this.getResponse(message);
            botMsg.innerHTML = `
                <div style="
                    display: inline-block;
                    background: #fff;
                    color: #000;
                    padding: 12px 16px;
                    border-radius: 12px 12px 12px 4px;
                    max-width: 80%;
                    font-size: 14px;
                    border: 1px solid #222;
                    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                ">${response}</div>
            `;
            content.appendChild(botMsg);
            content.scrollTop = content.scrollHeight;
        }, 1000);

        content.scrollTop = content.scrollHeight;
    }

    /**
     * Uses OpenAI GPT for conversational AI. Fallbacks to rule-based answers if API fails.
     * IMPORTANT: For production, never expose your OpenAI API key in frontend code. Use a backend proxy.
     * Replace 'YOUR_OPENAI_API_KEY' with your actual key for testing only.
     */
    async getResponse(message) {
        // --- OpenAI GPT Integration via Backend Proxy ---
        const endpoint = '/api/openai'; // Proxy endpoint (relative path)
        const systemPrompt = `You are Lyro, an expert assistant for Equipment King. You have access to the full truck, category, and company data. Answer user questions conversationally, but use the following JSON data for truck specs and categories when relevant.\n\nTRUCK DATA:\n${window._lyroTruckData ? JSON.stringify(window._lyroTruckData) : 'Not loaded yet.'}`;
        try {
            // Try to load truck data if needed
            if (!window._lyroTruckData) {
                try {
                    const resp = await fetch('truck-data-lyro.json');
                    if (resp.ok) {
                        window._lyroTruckData = await resp.json();
                    }
                } catch (e) { /* ignore */ }
            }
            // Compose proxy request
            const payload = {
                messages: [
                    { role: 'user', content: message }
                ],
                systemPrompt
            };
            const response = await fetch(endpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            });
            if (response.ok) {
                const data = await response.json();
                const aiMsg = data.choices?.[0]?.message?.content;
                if (aiMsg) return aiMsg.replace(/\n/g, '<br>');
            }
        } catch (err) {
            // If OpenAI/proxy fails, fallback to rule-based
            console.warn('OpenAI proxy failed, falling back to rule-based:', err);
        }

        // --- Rule-based fallback (original logic) ---
        const msg = message.toLowerCase();
        const truckData = window._lyroTruckData || [];
        if (msg.includes('specification') || msg.includes('truck') || msg.includes('details') || msg.includes('category')) {
            let found = [];
            for (const cat of truckData) {
                if (msg.includes(cat.category.toLowerCase())) {
                    found.push(`<b>${cat.category}</b>:<ul>` + cat.trucks.map(t => `<li><b>${t.name}</b>: ${t.features.join(', ')} (<a href='${t.detailsPage}' target='_blank'>Details</a>)</li>`).join('') + '</ul>');
                } else {
                    for (const t of cat.trucks) {
                        if (msg.includes(t.name.toLowerCase())) {
                            found.push(`<b>${t.name}</b>: ${t.features.join(', ')} (<a href='${t.detailsPage}' target='_blank'>Details</a>)`);
                        }
                    }
                }
            }
            if (found.length > 0) {
                return found.join('<br>');
            }
            return `🚛 Here are our main truck categories:<ul>${truckData.map(cat => `<li><b>${cat.category}</b> (${cat.trucks.length} models)</li>`).join('')}</ul>Ask about any category or model for more details!`;
        }
        if (msg.includes('quote') || msg.includes('price') || msg.includes('cost')) {
            return `💰 For pricing and quotes, please <a href="/contact.html" style="color: #444; text-decoration: underline;">contact our sales team</a> or WhatsApp us at <a href="https://wa.me/254710337605" style="color: #444; text-decoration: underline;">+254 710 337 605</a>. We'll provide you with competitive pricing tailored to your needs!`;
        }
        if (msg.includes('support') || msg.includes('technical') || msg.includes('help')) {
            return `🔧 Our technical support team is ready to help! You can reach us through:<br>
            • WhatsApp: <a href="https://wa.me/254710337605" style="color: #444; text-decoration: underline;">+254 710 337 605</a><br>
            • Contact form: <a href="/contact.html" style="color: #444; text-decoration: underline;">Contact page</a><br>
            What specific technical issue can we assist you with?`;
        }
        if (msg.includes('contact') || msg.includes('phone') || msg.includes('email')) {
            return `📞 Here's how to reach Equipment King:<br>
            • WhatsApp: <a href="https://wa.me/254710337605" style="color: #444; text-decoration: underline;">+254 710 337 605</a><br>
            • Visit our <a href="/contact.html" style="color: #444; text-decoration: underline;">Contact page</a> for more options<br>
            • Check our <a href="/about.html" style="color: #444; text-decoration: underline;">About page</a> for company information`;
        }
        return `Thank you for your message! I'm here to help with truck specifications, pricing, technical support, and contact information. You can also reach us directly via WhatsApp at <a href="https://wa.me/254710337605" style="color: #444; text-decoration: underline;">+254 710 337 605</a> for immediate assistance.`;
    }
}

// Global functions
let lyroChat = null;

function openLyroChat() {
    if (!lyroChat) {
        lyroChat = new LyroChat();
    }
    lyroChat.open();
}

function closeLyroChat() {
    if (lyroChat) {
        lyroChat.close();
    }
}

function sendChatMessage() {
    const input = document.getElementById('lyro-chat-input');
    if (!input) return;
    
    const message = input.value.trim();
    if (message && lyroChat) {
        lyroChat.sendMessage(message);
        input.value = '';
    }
}

function sendQuickMessage(message) {
    if (lyroChat) {
        lyroChat.sendMessage(message);
    }
}

// Close chat when clicking overlay
document.addEventListener('click', function(e) {
    if (e.target.id === 'lyro-chat-overlay') {
        closeLyroChat();
    }
});

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {

});
