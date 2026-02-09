# ThutoHub

ThutoHub is a  learning app that helps learners understand concepts in their home language using AI.

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

## Getting Started

### 🚀 Quick Start: Importing Your Local ThutoHub Project

If you have a local ThutoHub Flutter project that you want to import into this repository:

**Step 1: Choose Your Import Method**
- **Automated (Recommended)**: Use provided import scripts
  - Windows: Run `import_project.bat` or `import_project.ps1`
  - Linux/Mac: Run `./import_project.sh`
- **Manual**: Copy files directly

**Step 2: Follow the Guides**
- 📖 [IMPORT_GUIDE.md](IMPORT_GUIDE.md) - Detailed import instructions
- ✅ [IMPORT_CHECKLIST.md](IMPORT_CHECKLIST.md) - Step-by-step checklist
- 📁 [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) - Expected file structure

**Step 3: Setup Environment**
- Copy `.env.example` to `.env`
- Add your API keys (Gemini, Supabase)

**Step 4: Test and Run**
```bash
flutter pub get      # Install dependencies
flutter run          # Launch the app
```

### Running the App

1. **Clone the repository**
   ```bash
   git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
   cd thutohub_gemini_hackathon
   ```

2. **Import your Flutter project** (if not done yet)
   - See [IMPORT_GUIDE.md](IMPORT_GUIDE.md) for instructions

3. **Setup environment variables**
   ```bash
   cp .env.example .env
   # Edit .env and add your keys
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Documentation

- [IMPORT_GUIDE.md](IMPORT_GUIDE.md) - How to import your local project
- [IMPORT_CHECKLIST.md](IMPORT_CHECKLIST.md) - Step-by-step import checklist  
- [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) - Expected project structure
- [.env.example](.env.example) - Environment variables template
- [FAQ.md](FAQ.md) - Frequently asked questions

## Support

Having trouble? Check the [FAQ.md](FAQ.md) or create an issue on GitHub.
