#!/bin/bash

# 1. Clean and Build for Release
echo "Cleaning old builds..."
flutter clean

echo "Building Flutter Web (Release Mode)..."
flutter build web --release

# 2. Deployment Instructions
echo ""
echo "-------------------------------------------------------"
echo "🚀 BUILD SUCCESSFUL!"
echo "-------------------------------------------------------"
echo "Follow these 3 steps to go live:"
echo ""
echo "STEP 1: Open https://app.netlify.com/drop"
echo ""
echo "STEP 2: Drag the folder below into the Netlify browser window:"
echo "        $(pwd)/build/web"
echo ""
echo "STEP 3: Once it uploads, Netlify will give you a RANDOM link."
echo "        To change it to your name:"
echo "        - Click 'Site Settings' in Netlify"
echo "        - Click the 'Change site name' button"
echo "        - Enter a unique name (e.g., richard-s-dev-portfolio)"
echo "-------------------------------------------------------"
