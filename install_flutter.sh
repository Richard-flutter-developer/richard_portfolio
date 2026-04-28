#!/usr/bin/env bash
set -e

# Clone stable Flutter (shallow to save time)
if [ ! -d flutter ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter
fi

export PATH="$PWD/flutter/bin:$PATH"

# Ensure web tooling is available
echo "Installing dependencies..."
flutter precache --web
flutter --version
