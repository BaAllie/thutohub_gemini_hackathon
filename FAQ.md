# Frequently Asked Questions (FAQ)

## General Questions

### Q: What is ThutoHub?
**A:** ThutoHub is a Flutter-based learning app that helps South African learners understand mathematical concepts in their home language using Google's Gemini AI.

### Q: What does "thutohub" mean?
**A:** "Thuto" means "education" or "learning" in Setswana (a South African language), making ThutoHub an education hub.

### Q: Why do I need to import files?
**A:** This repository is a template/framework for the ThutoHub app. You need to import your actual Flutter project code (stored locally on your computer) into this repository to version control and share it on GitHub.

## Import Questions

### Q: Where is my local ThutoHub project?
**A:** Based on the problem statement, it should be at `C:\Users\USER\Documents\CHIHUMURA\thutohub` on a Windows machine. If it's elsewhere, update the path in the import scripts.

### Q: Which import method should I use?
**A:** 
- **Beginners**: Use the automated scripts (`import_project.bat` or `import_project.ps1`)
- **Experienced**: Use manual copy or git commands
- **Linux/Mac**: Use `import_project.sh` (edit path first)

### Q: What if the import script fails?
**A:**
1. Verify the source path exists
2. Check you have read permissions
3. Try the manual copy method
4. See [IMPORT_GUIDE.md](IMPORT_GUIDE.md) for troubleshooting

### Q: Can I import from a different location?
**A:** Yes! Edit the import script and change the `SOURCE_PATH` variable to point to your project location.

### Q: What files should I import?
**A:** Import all Flutter project files EXCEPT:
- `.git/` folder
- `build/` folder
- `.dart_tool/` folder
- `.env` files (copy as `.env.example` without secrets)
- IDE settings (`.idea/`, `.vscode/`)

### Q: What if I don't have a local project yet?
**A:** Then you need to create the Flutter project first. This repository is for importing an existing project. If you're starting from scratch, run `flutter create thutohub` first.

## Technical Questions

### Q: What Flutter version do I need?
**A:** The project requires Flutter 3.0.0 or higher. Check with `flutter --version` and see your `pubspec.yaml` for specific requirements.

### Q: Where do I get the API keys?
**A:**
- **Gemini API**: https://ai.google.dev/
- **Supabase**: https://supabase.com/dashboard

### Q: Is the .env file required?
**A:** Yes, for production use. It stores your API keys securely. Copy `.env.example` to `.env` and fill in your keys. Never commit the `.env` file!

### Q: Why isn't my .env file working?
**A:**
1. Ensure you've added `flutter_dotenv` to `pubspec.yaml`
2. Add `.env` to your `assets` in `pubspec.yaml`
3. Load it in your app: `await dotenv.load()`
4. Access values: `dotenv.env['GEMINI_API_KEY']`

### Q: Do I need both Android and iOS folders?
**A:** Android folder is required for building Android apps. iOS folder is only needed if you're building for iOS (requires macOS).

## Git/GitHub Questions

### Q: Should I commit my .env file?
**A:** **NO!** Never commit files with secrets. The `.env` file is already in `.gitignore` to prevent this.

### Q: What if I accidentally committed sensitive data?
**A:**
1. Remove the file: `git rm --cached .env`
2. Commit: `git commit -m "Remove sensitive file"`
3. Rotate your API keys immediately
4. Consider using `git filter-branch` or BFG Repo-Cleaner for history

### Q: Can I work on a different branch?
**A:** Yes! Create a new branch with `git checkout -b your-branch-name` before importing, then push to that branch.

### Q: How do I sync with the main repository?
**A:**
```bash
git pull origin main
# Resolve any conflicts
git push origin your-branch
```

## Error Messages

### Q: "flutter: command not found"
**A:** Flutter is not installed or not in your PATH. Install from https://flutter.dev/docs/get-started/install

### Q: "No pubspec.yaml found"
**A:** You're not in a Flutter project directory, or the import didn't work. Verify you're importing from the correct source folder.

### Q: "Unable to find git"
**A:** Git is not installed. Download from https://git-scm.com/downloads

### Q: "Unable to load asset"
**A:** Assets need to be listed in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - .env
    - assets/images/
```

### Q: "API key invalid"
**A:** 
1. Verify your API key in `.env`
2. Check for extra spaces or quotes
3. Ensure the key is active on the provider's dashboard
4. Regenerate the key if needed

### Q: Dependencies conflict errors
**A:**
1. Run `flutter pub upgrade`
2. Check version constraints in `pubspec.yaml`
3. Look for incompatible package versions
4. Update Flutter SDK if needed

## Development Questions

### Q: How do I add new dependencies?
**A:**
```bash
flutter pub add package_name
```
Or manually edit `pubspec.yaml` and run `flutter pub get`

### Q: How do I test the app?
**A:**
```bash
flutter test              # Run all tests
flutter test test/file.dart  # Run specific test
```

### Q: How do I build for production?
**A:**
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

### Q: Can I use this in production?
**A:** Yes, but ensure:
1. All secrets are in `.env` (not committed)
2. Error handling is implemented
3. App is tested thoroughly
4. API keys have appropriate restrictions
5. Terms of service are followed for all APIs

## Platform-Specific Questions

### Q: Why use robocopy vs PowerShell Copy-Item?
**A:** `robocopy` is more efficient for large directory structures, while `Copy-Item` offers more flexibility. Both scripts are provided.

### Q: Can I run this on Linux?
**A:** Yes! Use the `import_project.sh` script, but edit the source path first since the default path is Windows-specific.

### Q: Can I run this on macOS?
**A:** Yes! Use the `import_project.sh` script. You'll also be able to build for iOS if Xcode is installed.

### Q: What about Windows Subsystem for Linux (WSL)?
**A:** You can use the bash script in WSL, but accessing Windows paths requires `/mnt/c/Users/...` format.

## Contributing Questions

### Q: Can I contribute to this project?
**A:** Yes! Fork the repository, make your changes, and submit a pull request.

### Q: What's the coding style?
**A:** Follow the Flutter/Dart style guide and use the linter configured in `analysis_options.yaml`.

### Q: How do I report a bug?
**A:** Create an issue on GitHub with:
- Description of the bug
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/OS information

## Still Have Questions?

If your question isn't answered here:

1. Check the documentation files:
   - [IMPORT_GUIDE.md](IMPORT_GUIDE.md)
   - [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)
   - [IMPORT_CHECKLIST.md](IMPORT_CHECKLIST.md)

2. Run diagnostics:
   ```bash
   flutter doctor -v
   ```

3. Check official documentation:
   - Flutter: https://flutter.dev/docs
   - Supabase: https://supabase.com/docs
   - Gemini AI: https://ai.google.dev/docs

4. Create an issue on GitHub with details about your problem
