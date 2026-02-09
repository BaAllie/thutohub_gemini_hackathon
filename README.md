# ThutoHub

ThutoHub is a learning app that helps learners understand concepts in their home language using AI.

## Problem
Many South African learners struggle because content is delivered only in English.

## Solution
ThutoHub uses Gemini 3 to explain Maths concepts in vernacular languages.

## Gemini Usage
- Translates explanations
- Simplifies concepts for primary learners

## Tech Stack
- Flutter
- Supabase
- Google Gemini 3 API

## Project Structure
```
thutohub_gemini_hackathon/
├── lib/
│   ├── main.dart              # App entry point
│   ├── screens/               # UI screens/pages
│   ├── models/                # Data models
│   ├── services/              # API services (Gemini, Supabase)
│   ├── widgets/               # Reusable widgets
│   └── utils/                 # Utility functions
├── android/                   # Android platform files
├── ios/                       # iOS platform files
├── test/                      # Tests
└── pubspec.yaml               # Dependencies
```

## How to Import Your Files

### Quick Start
1. **Clone this repository**
   ```bash
   git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
   cd thutohub_gemini_hackathon
   ```

2. **Copy your Flutter files** into the appropriate directories:
   - Screens → `lib/screens/`
   - Models → `lib/models/`
   - Services → `lib/services/`
   - Widgets → `lib/widgets/`
   - Platform files → `android/`, `ios/`, `web/`

3. **Update dependencies** in `pubspec.yaml` if needed

4. **Create `.env` file** with your API keys:
   ```
   GEMINI_API_KEY=your_key_here
   SUPABASE_URL=your_url_here
   SUPABASE_ANON_KEY=your_key_here
   ```

5. **Install dependencies**
   ```bash
   flutter pub get
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

For detailed import instructions, see [CONTRIBUTING.md](CONTRIBUTING.md)

## Development

### Running the App
```bash
flutter pub get
flutter run
```

### Running Tests
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

## Environment Variables
Create a `.env` file in the root directory:
```
GEMINI_API_KEY=your_gemini_api_key
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:
- Importing your local files
- Code organization
- Integrating with Gemini and Supabase
- Code style guidelines

## License
See [LICENSE](LICENSE) for details.
