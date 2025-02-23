#!/bin/bash

printf "\n"
cat <<EOF


██████   ███████ 
█        █     █
██████   ███████
█        █
██████   █
EOF

printf "\n\n"

##########################################################################################
#                                                                                        
#                🚀 THIS SCRIPT IS PROUDLY CREATED BY **Earn&POINT**! 🚀                 
#                                                                                        
#   🌐 Join our revolution in decentralized networks and crypto innovation!               
#                                                                                        
# 📢 Stay updated:                                                                      
#     • Follow us on Telegram: https://t.me/Earnpoint10                            
#     • Follow us on X: https://x.com/earnpoint10                                       
##########################################################################################

# Green color for advertisement
GREEN="\033[0;32m"
RESET="\033[0m"

# Print the advertisement using printf
printf "${GREEN}"
printf "🚀 THIS SCRIPT IS PROUDLY CREATED BY **Earn&Point**! 🚀\n"
printf "Stay connected for updates:\n"
printf "   • Telegram: https://t.me/Earnpoint10 \n"
printf "   • X (formerly Twitter): https://x.com/earnpoint10\n"
printf "${RESET}"

# Installation and configuration process starts here
echo "==========================================================="
echo "🚀 Welcome to Earn&Point Automated GaiaNet Node Installer 🚀"
echo "==========================================================="
echo ""
echo "🌟 Your journey to decentralized networks begins here!"
echo "✨ Follow the steps as the script runs automatically for you!"
echo ""

# Basic packages
echo "install Common Required Packages"
sudo apt update -y && sudo apt-get install libgomp1 -y

# Install GaiaNet node
echo "📥 Installing GaiaNet node..."
curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet node installation successful!"
else
    echo "❌ Error: GaiaNet node installation failed!"
    exit 1
fi
echo "Status: $status"

#!/bin/bash

# Add GaiaNet to PATH
echo "🔗 Adding GaiaNet to system PATH..."
echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc && source ~/.bashrc
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet added to PATH successfully!"
else
    echo "❌ Error: Failed to add GaiaNet to PATH!"
    exit 1
fi
echo "Status: $status"

# Add GaiaNet to PATH
echo "🔗 Adding GaiaNet to system PATH..."
echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc && source ~/.bashrc
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet added to PATH successfully!"
else
    echo "❌ Error: Failed to add GaiaNet to PATH!"
    exit 1
fi
echo "Status: $status"

# Add GaiaNet to PATH
echo "🔗 Adding GaiaNet to system PATH..."
echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc && source ~/.bashrc
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet added to PATH successfully!"
else
    echo "❌ Error: Failed to add GaiaNet to PATH!"
    exit 1
fi
echo "Status: $status"

# Add GaiaNet to PATH
echo "🔗 Adding GaiaNet to system PATH..."
echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc && source ~/.bashrc
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet added to PATH successfully!"
else
    echo "❌ Error: Failed to add GaiaNet to PATH!"
    exit 1
fi
echo "Status: $status"

# Add GaiaNet to PATH
echo "🔗 Adding GaiaNet to system PATH..."
echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc && source ~/.bashrc
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet added to PATH successfully!"
else
    echo "❌ Error: Failed to add GaiaNet to PATH!"
    exit 1
fi
echo "Status: $status"

# Initialize GaiaNet node with the specified configuration
echo "⚙️ Initializing GaiaNet node with the latest configuration..."
gaianet init --config https://raw.githubusercontent.com/sadi200/gaiabot/refs/heads/main/config.json
status=$?

if [ $status -eq 0 ]; then
    echo "✅ GaiaNet node initialized successfully!"
else
    echo "❌ Error: Failed to initialize GaiaNet node!"
    echo "🔍 Checking if GaiaNet is in the PATH..."

    # Check if GaiaNet binary exists in /opt/gaianet/
    if [ -f "/opt/gaianet/gaianet" ]; then
        echo "✅ GaiaNet binary found in /opt/gaianet/. Adding it to PATH..."
        echo 'export PATH=$PATH:/opt/gaianet/' >> ~/.bashrc
        source ~/.bashrc

        echo "🔄 Retrying initialization..."
        gaianet init --config https://raw.githubusercontent.com/sadi200/gaiabot/refs/heads/main/config.json
        retry_status=$?

        if [ $retry_status -eq 0 ]; then
            echo "✅ GaiaNet node initialized successfully on retry!"
        else
            echo "❌ Error: Initialization failed even after fixing PATH!"
            exit 1
        fi
    else
        echo "❌ GaiaNet binary not found in /opt/gaianet/!"
        echo "🚨 Please ensure GaiaNet is installed and accessible."
        exit 1
    fi
fi

echo "Status: $status"


# Start the GaiaNet node
echo "🚀 Starting GaiaNet node..."
gaianet config --domain gaia.domains
gaianet start
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet node started successfully!"
else
    echo "❌ Error: Failed to start GaiaNet node!"
    exit 1
fi
echo "Status: $status"

# Display GaiaNet node info
echo "🔍 Fetching GaiaNet node information..."
gaianet info
status=$?
if [ $status -eq 0 ]; then
    echo "✅ GaiaNet node information fetched successfully!"
else
    echo "❌ Error: Failed to fetch GaiaNet node information!"
    exit 1
fi
echo "Status: $status"

# Closing message
echo ""
echo "==========================================================="
echo "🎉 Congratulations! Your GaiaNet node is successfully set up!"
echo ""
echo "🌟 This script was brought to you by Earn&Point!"
echo "   • Stay connected for the latest updates:"
echo "     Telegram: https://t.me/Earnpoint10"
echo "     X (formerly Twitter): https://x.com/earnpoint10"
echo ""
echo "💪 Together, let's build the future of decentralized networks!"
echo "==========================================================="
