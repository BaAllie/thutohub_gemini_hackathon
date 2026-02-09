# Contributing to ThutoHub

Thank you for your interest in contributing to ThutoHub! This guide will help you import your files and organize your code properly.

## Project Structure

```
thutohub_gemini_hackathon/
├── lib/
│   ├── main.dart              # App entry point
│   ├── screens/               # UI screens/pages
│   ├── models/                # Data models
│   ├── services/              # API services (Gemini, Supabase)
│   ├── widgets/               # Reusable widgets
│   └── utils/                 # Utility functions and constants
├── android/                   # Android platform files
├── ios/                       # iOS platform files
├── test/                      # Unit and widget tests
├── web/                       # Web platform files (optional)
├── pubspec.yaml               # Dependencies
└── analysis_options.yaml      # Linting rules
```

## How to Import Your Files

### Step 1: Clone the Repository
```bash
git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
cd thutohub_gemini_hackathon
```

### Step 2: Copy Your Files
Copy your local Flutter project files into the appropriate directories:

#### For Dart code files:
- **Screens/Pages**: Copy to `lib/screens/`
- **Data Models**: Copy to `lib/models/`
- **Services**: Copy to `lib/services/`
- **Widgets**: Copy to `lib/widgets/`
- **Utilities**: Copy to `lib/utils/`

#### For platform-specific files:
- **Android**: Copy your Android files to `android/`
- **iOS**: Copy your iOS files to `ios/`
- **Web**: Copy your web files to `web/`

#### For tests:
- Copy your test files to `test/`

### Step 3: Update Dependencies
If you have additional dependencies, add them to `pubspec.yaml`:
```yaml
dependencies:
  your_package: ^version
```

### Step 4: Configure Environment Variables
Create a `.env` file in the root directory:
```
GEMINI_API_KEY=your_gemini_api_key
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Step 5: Install Dependencies
```bash
flutter pub get
```

### Step 6: Test Your Changes
```bash
flutter analyze
flutter test
flutter run
```

### Step 7: Commit and Push
```bash
git add .
git commit -m "Import local Flutter files"
git push origin main
```

## Code Style Guidelines

1. **Follow Dart conventions**: Use `dart format` to format your code
2. **Use meaningful names**: Variables and functions should be descriptive
3. **Add comments**: Document complex logic
4. **Keep files small**: Split large files into smaller, focused modules
5. **Write tests**: Add tests for your features
6. **Use const constructors**: When possible, for better performance

## Common Import Scenarios

### Importing a Complete Flutter Project
If you have an existing Flutter project:
1. Copy all `lib/` files to the `lib/` directory
2. Merge your `pubspec.yaml` dependencies with the existing one
3. Copy platform-specific folders (android, ios, web)
4. Copy any assets or fonts

### Importing Individual Features
If you're adding specific features:
1. Create a new directory under `lib/screens/` or appropriate location
2. Add your feature files there
3. Update `main.dart` to integrate the feature
4. Add any new dependencies to `pubspec.yaml`

### Importing Assets
1. Create an `assets/` directory in the root
2. Add subdirectories (e.g., `images/`, `fonts/`, `data/`)
3. Copy your asset files
4. Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/data/
  fonts:
    - family: YourFont
      fonts:
        - asset: assets/fonts/YourFont-Regular.ttf
```

## Integration with Gemini and Supabase

### Gemini Service Example
```dart
// lib/services/gemini_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  Future<String> explainConcept(String concept, String language) async {
    // Your Gemini API integration
    final response = await http.post(
      Uri.parse('https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent'),
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': _apiKey,
      },
      body: jsonEncode({
        'contents': [{
          'parts': [{
            'text': 'Explain $concept in $language for primary school students'
          }]
        }]
      }),
    );
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    }
    throw Exception('Failed to get explanation');
  }
}
```

### Supabase Service Example
```dart
// lib/services/supabase_service.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SupabaseService {
  final String _url = dotenv.env['SUPABASE_URL'] ?? '';
  final String _anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  Future<List<dynamic>> getConcepts() async {
    final response = await http.get(
      Uri.parse('$_url/rest/v1/concepts'),
      headers: {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
      },
    );
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Failed to load concepts');
  }
}
```

## Need Help?

If you encounter any issues:
1. Check that all dependencies are installed: `flutter pub get`
2. Verify your environment variables are set correctly
3. Run `flutter doctor` to check your Flutter installation
4. Check the README.md for additional guidance

## Questions?

Feel free to open an issue on GitHub if you have questions or need assistance with importing your files.
