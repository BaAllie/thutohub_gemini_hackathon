# File Import Guide for ThutoHub

This guide provides step-by-step instructions for importing your Flutter application files into this repository.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Understanding the Structure](#understanding-the-structure)
3. [Import Methods](#import-methods)
4. [Step-by-Step Instructions](#step-by-step-instructions)
5. [Verification](#verification)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

Before importing your files, ensure you have:
- Git installed on your computer
- Flutter SDK installed (run `flutter doctor` to verify)
- Your local Flutter project ready
- GitHub account access to this repository

## Understanding the Structure

This repository is organized as follows:

```
thutohub_gemini_hackathon/
├── lib/                       # Main Dart code
│   ├── main.dart             # Entry point (already exists)
│   ├── screens/              # UI screens
│   ├── models/               # Data models
│   ├── services/             # API services
│   ├── widgets/              # Reusable widgets
│   └── utils/                # Utilities
├── android/                  # Android-specific code
├── ios/                      # iOS-specific code
├── test/                     # Tests
├── web/                      # Web-specific code (optional)
├── assets/                   # Images, fonts, data files (create if needed)
├── pubspec.yaml              # Dependencies
├── analysis_options.yaml     # Linting rules
└── .env.example              # Environment variables template
```

## Import Methods

### Method 1: Manual Copy (Recommended for Beginners)

This is the simplest method for importing files.

#### Step 1: Clone the Repository
```bash
git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
cd thutohub_gemini_hackathon
```

#### Step 2: Copy Your Files
Open two file explorer windows:
- Window 1: Your local Flutter project
- Window 2: The cloned `thutohub_gemini_hackathon` folder

Copy files from your project to the corresponding folders:

| From Your Project | To This Repository |
|-------------------|-------------------|
| `lib/` files | `lib/` (merge with existing) |
| `android/` files | `android/` |
| `ios/` files | `ios/` |
| `test/` files | `test/` |
| `assets/` folder | Create `assets/` and copy |
| Additional dependencies | Add to `pubspec.yaml` |

#### Step 3: Update Configuration Files

**pubspec.yaml**: If you have additional dependencies, add them:
```yaml
dependencies:
  flutter:
    sdk: flutter
  # Your existing dependencies
  your_package: ^version
```

**main.dart**: If your entry point is different, update `lib/main.dart`:
```dart
import 'package:flutter/material.dart';
import 'your_app.dart'; // Import your main app file

void main() {
  runApp(const YourApp());
}
```

#### Step 4: Create Environment File
Copy `.env.example` to `.env` and add your API keys:
```bash
cp .env.example .env
```

Edit `.env`:
```
GEMINI_API_KEY=your_actual_api_key
SUPABASE_URL=your_actual_supabase_url
SUPABASE_ANON_KEY=your_actual_anon_key
```

#### Step 5: Install Dependencies
```bash
flutter pub get
```

#### Step 6: Verify and Run
```bash
flutter analyze
flutter test
flutter run
```

#### Step 7: Commit and Push
```bash
git add .
git commit -m "Import local Flutter application files"
git push origin main
```

### Method 2: Command Line Copy

For users comfortable with the command line:

```bash
# Clone the repository
git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
cd thutohub_gemini_hackathon

# Copy lib files (adjust path to your project)
cp -r /path/to/your/project/lib/* ./lib/

# Copy platform files
cp -r /path/to/your/project/android/* ./android/
cp -r /path/to/your/project/ios/* ./ios/

# Copy tests
cp -r /path/to/your/project/test/* ./test/

# Copy assets if they exist
if [ -d "/path/to/your/project/assets" ]; then
  cp -r /path/to/your/project/assets ./
fi

# Setup environment
cp .env.example .env
# Edit .env with your actual keys

# Install dependencies
flutter pub get

# Test and run
flutter analyze
flutter run
```

### Method 3: Using Git (Advanced)

If you want to preserve your Git history:

```bash
# Clone this repository
git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
cd thutohub_gemini_hackathon

# Add your local project as a remote
git remote add local-project /path/to/your/local/project

# Fetch your local project
git fetch local-project

# Merge your project (you may need to resolve conflicts)
git merge local-project/main --allow-unrelated-histories

# Or cherry-pick specific commits
git cherry-pick <commit-hash>

# Push to GitHub
git push origin main
```

## Step-by-Step Instructions

### Organizing Your Code

When importing, organize your files according to their purpose:

#### Screens/Pages
Place all screen widgets in `lib/screens/`:
```
lib/screens/
├── home_screen.dart
├── learning_screen.dart
├── concept_detail_screen.dart
└── settings_screen.dart
```

#### Data Models
Place model classes in `lib/models/`:
```
lib/models/
├── concept.dart
├── user.dart
├── user_progress.dart
└── lesson.dart
```

#### Services
Place API and service classes in `lib/services/`:
```
lib/services/
├── gemini_service.dart        # Gemini API integration
├── supabase_service.dart      # Supabase operations
├── auth_service.dart          # Authentication
└── storage_service.dart       # Local storage
```

#### Reusable Widgets
Place custom widgets in `lib/widgets/`:
```
lib/widgets/
├── concept_card.dart
├── language_selector.dart
├── loading_indicator.dart
└── custom_button.dart
```

#### Utilities
Place helper functions and constants in `lib/utils/`:
```
lib/utils/
├── constants.dart             # App constants
├── helpers.dart               # Helper functions
└── validators.dart            # Input validators
```

### Handling Assets

If your app uses assets (images, fonts, data files):

1. **Create assets directory**:
```bash
mkdir -p assets/images assets/fonts assets/data
```

2. **Copy your assets**:
```bash
cp -r /path/to/your/assets/* ./assets/
```

3. **Update pubspec.yaml**:
```yaml
flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/data/
    - .env
  
  fonts:
    - family: CustomFont
      fonts:
        - asset: assets/fonts/CustomFont-Regular.ttf
        - asset: assets/fonts/CustomFont-Bold.ttf
          weight: 700
```

### Handling Dependencies

If your project has custom dependencies:

1. **Compare pubspec.yaml files**: Open both your project's `pubspec.yaml` and this repository's `pubspec.yaml`

2. **Merge dependencies**: Add your dependencies to this repository's file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  # Existing dependencies
  cupertino_icons: ^1.0.2
  http: ^1.1.0
  flutter_dotenv: ^5.1.0
  
  # Your additional dependencies
  provider: ^6.0.0
  cached_network_image: ^3.0.0
  shared_preferences: ^2.0.0
```

3. **Run pub get**:
```bash
flutter pub get
```

### Integrating with Existing Code

The repository already has:
- A basic `main.dart` with app structure
- Example `gemini_service.dart` and `supabase_service.dart`
- Sample models (`concept.dart`, `user_progress.dart`)
- Constants file

You have two options:

**Option 1: Replace with your files** (if you have complete implementations)
```bash
# Backup existing files
mv lib/main.dart lib/main.dart.backup

# Copy your file
cp /path/to/your/main.dart lib/main.dart
```

**Option 2: Merge with existing files** (recommended)
- Open both files side by side
- Copy your custom code into the existing files
- Maintain the existing structure where possible

## Verification

After importing, verify everything works:

### 1. Check File Structure
```bash
tree lib/
```
Ensure all your files are in the correct locations.

### 2. Analyze Code
```bash
flutter analyze
```
Fix any analysis warnings or errors.

### 3. Run Tests
```bash
flutter test
```
Ensure all tests pass.

### 4. Run the App
```bash
flutter run
```
Test the app functionality.

### 5. Check Environment Variables
Verify `.env` file has correct values:
```bash
cat .env
```

### 6. Verify Dependencies
```bash
flutter pub get
flutter pub outdated
```

## Troubleshooting

### Issue: Import statements not resolving

**Solution**: Update import statements to match the new package name:
```dart
// Change from
import 'package:your_old_app/...';

// To
import 'package:thutohub/...';
```

### Issue: Missing dependencies

**Solution**: Add them to `pubspec.yaml`:
```bash
flutter pub add package_name
```

### Issue: Platform-specific files missing

**Solution**: Regenerate platform files if needed:
```bash
flutter create --platforms=android,ios,web .
```
Then restore your custom platform code.

### Issue: Assets not loading

**Solution**: 
1. Check `pubspec.yaml` has correct asset paths
2. Run `flutter pub get` after updating
3. Restart the app

### Issue: Environment variables not loading

**Solution**:
1. Ensure `.env` file exists in root directory
2. Check it's not `.env.example` (copy and rename it)
3. Verify `flutter_dotenv` is in dependencies
4. Call `dotenv.load()` before using environment variables

### Issue: Merge conflicts

**Solution**:
```bash
# See conflicted files
git status

# Open files and resolve conflicts manually
# Look for <<<<<<, ======, >>>>>> markers

# After resolving
git add .
git commit -m "Resolve merge conflicts"
```

## Next Steps

After successfully importing:

1. **Update Documentation**: Update README.md with any new features or changes
2. **Add Tests**: Write tests for your imported features
3. **Review Code**: Run code analysis and fix any issues
4. **Set up CI/CD**: Configure GitHub Actions if needed
5. **Create Issues**: Document any known issues or future enhancements

## Getting Help

If you encounter issues:
1. Check this guide's troubleshooting section
2. Review [CONTRIBUTING.md](CONTRIBUTING.md)
3. Run `flutter doctor` to check your Flutter installation
4. Open an issue on GitHub with:
   - Steps to reproduce the problem
   - Error messages
   - Your Flutter version (`flutter --version`)
   - Your operating system

## Quick Reference

### Useful Commands
```bash
# Get Flutter version
flutter --version

# Check Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Analyze code
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Run app
flutter run

# Build for release
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web

# Clean build files
flutter clean
```

### File Location Quick Reference

| File Type | Location | Example |
|-----------|----------|---------|
| Main entry point | `lib/main.dart` | App startup |
| Screens | `lib/screens/` | `home_screen.dart` |
| Models | `lib/models/` | `concept.dart` |
| Services | `lib/services/` | `gemini_service.dart` |
| Widgets | `lib/widgets/` | `concept_card.dart` |
| Utils | `lib/utils/` | `constants.dart` |
| Tests | `test/` | `widget_test.dart` |
| Assets | `assets/` | `images/logo.png` |
| Config | Root | `pubspec.yaml` |
| Environment | Root | `.env` |

## Summary

Importing your files is straightforward:
1. Clone the repository
2. Copy your files to the appropriate directories
3. Update configuration files
4. Install dependencies
5. Test and verify
6. Commit and push

Follow this guide step-by-step, and you'll have your application running in this repository in no time!
