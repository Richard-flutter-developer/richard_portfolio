#!/usr/bin/env bash
set -e

# 1. Clone Flutter stable into the 'flutter' directory
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 flutter
fi

# 2. Add Flutter to PATH
export PATH="$PWD/flutter/bin:$PATH"

# 3. Precache web artifacts and show version
echo "Preparing Flutter..."
flutter precache --web
flutter --version
