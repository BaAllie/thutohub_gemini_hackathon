# Expected Flutter Project Structure

After importing your ThutoHub Flutter project, your repository should have a structure similar to this:

```
thutohub_gemini_hackathon/
├── .git/                          # Git repository data
├── .gitignore                     # Git ignore patterns
├── LICENSE                        # Project license
├── README.md                      # Project documentation
├── IMPORT_GUIDE.md               # This import guide
├── import_project.bat            # Windows batch import script
├── import_project.ps1            # Windows PowerShell import script
├── import_project.sh             # Linux/Mac bash import script
│
├── pubspec.yaml                  # Flutter dependencies (REQUIRED)
├── pubspec.lock                  # Locked dependencies
├── analysis_options.yaml         # Dart analyzer options (optional)
│
├── lib/                          # Main Dart source code (REQUIRED)
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   ├── screens/                  # UI screens
│   ├── widgets/                  # Reusable widgets
│   ├── services/                 # Services (API, Gemini, Supabase)
│   └── utils/                    # Utility functions
│
├── assets/                       # Static assets (optional)
│   ├── images/
│   ├── fonts/
│   └── icons/
│
├── android/                      # Android-specific files (REQUIRED)
│   ├── app/
│   │   ├── src/
│   │   └── build.gradle
│   ├── gradle/
│   └── build.gradle
│
├── ios/                          # iOS-specific files (optional)
│   ├── Runner/
│   ├── Runner.xcodeproj/
│   └── Runner.xcworkspace/
│
├── test/                         # Unit and widget tests (optional)
│   └── widget_test.dart
│
├── integration_test/             # Integration tests (optional)
│
└── .env                          # Environment variables (DO NOT COMMIT)
    # Contains:
    # GEMINI_API_KEY=your_key_here
    # SUPABASE_URL=your_url_here
    # SUPABASE_ANON_KEY=your_key_here
```

## Essential Files for Flutter App

Your ThutoHub project **must** include:

1. **pubspec.yaml** - Defines dependencies and assets
2. **lib/** directory with at least **main.dart**
3. **android/** directory - For Android builds

## Typical pubspec.yaml Structure

```yaml
name: thutohub
description: A learning app helping learners understand concepts in their home language

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # Supabase for backend
  supabase_flutter: ^2.0.0
  
  # Google Generative AI (Gemini)
  google_generative_ai: ^0.2.0
  
  # Environment variables
  flutter_dotenv: ^5.0.0
  
  # UI and utilities
  cupertino_icons: ^1.0.2
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
  
  assets:
    - .env
    - assets/images/
```

## Verifying Import Success

After importing, run these commands to verify:

```bash
# Check Flutter setup
flutter doctor

# Get dependencies
flutter pub get

# Check for issues
flutter analyze

# Try to build (Android)
flutter build apk --debug

# Run the app
flutter run
```

## If Files Are Missing

If your imported project is missing essential files:

1. **Create pubspec.yaml** manually if it doesn't exist
2. **Create lib/main.dart** with a basic Flutter app
3. **Initialize Android/iOS** with `flutter create .` (this adds missing platform files)

## Troubleshooting

### "No pubspec.yaml found"
- Your source directory might not be a Flutter project
- Make sure you're importing from the correct folder
- The folder should contain `pubspec.yaml` and `lib/` directory

### "Unable to find git in your PATH"
- Install Git: https://git-scm.com/downloads
- Restart your terminal after installation

### "flutter: command not found"
- Install Flutter: https://flutter.dev/docs/get-started/install
- Add Flutter to your PATH
- Run `flutter doctor` to verify installation

### Import Script Fails
- Check the source path in the script
- Verify you have read permissions for the source directory
- Try the manual copy method instead

## Next Steps After Successful Import

1. ✅ Verify all files imported correctly
2. ✅ Run `flutter pub get` to install dependencies
3. ✅ Create `.env` file with your API keys (don't commit this!)
4. ✅ Run `flutter analyze` to check for issues
5. ✅ Test the app with `flutter run`
6. ✅ Commit and push to GitHub
7. ✅ Set up CI/CD (optional)

## Important Notes

- The `.env` file should **never** be committed to Git
- Always test your app after importing
- Keep your dependencies up to date with `flutter pub upgrade`
- Use `flutter doctor` to diagnose any environment issues
