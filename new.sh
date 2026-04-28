#!/bin/bash

# 1. Clean and Build for Release
echo "Cleaning old builds..."
flutter clean

echo "Building Flutter Web (Release Mode)..."
flutter build web --release

# 2. Deployment Status & Instructions
echo ""
echo "-------------------------------------------------------"
echo "🚀 PORTFOLIO DEPLOYMENT INFO"
echo "-------------------------------------------------------"
echo "Current Live URL: https://sparkling-zabaione-6ff6bd.netlify.app/"
echo ""
echo "HOW TO CHANGE YOUR SITE NAME:"
echo "1. Log into: https://app.netlify.com/"
echo "2. Click on the site 'sparkling-zabaione-6ff6bd'"
echo "3. Go to 'Site configuration' -> 'General' -> 'Site details'"
echo "4. Click 'Change site name' and enter your preferred name."
echo ""
echo "HOW TO UPDATE YOUR SITE:"
echo "Simply push your code to Git. Netlify will auto-rebuild."
echo "   git add ."
echo "   git commit -m 'Updates'"
echo "   git push"
echo "-------------------------------------------------------"
