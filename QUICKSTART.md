# Quick Start: Importing Your Flutter Files

**Time required:** 10-15 minutes

## Three Simple Steps

### 1️⃣ Clone This Repository
```bash
git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
cd thutohub_gemini_hackathon
```

### 2️⃣ Copy Your Files
Copy your Flutter project files into these folders:

| Your Files | → | Copy To |
|------------|---|---------|
| `lib/` files | → | `lib/` |
| `android/` files | → | `android/` |
| `ios/` files | → | `ios/` |
| `test/` files | → | `test/` |
| `assets/` folder | → | `assets/` (create if needed) |

### 3️⃣ Set Up and Run
```bash
# Create environment file
cp .env.example .env
# Edit .env and add your API keys

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📚 Need More Help?

- **Detailed Instructions**: See [IMPORT_GUIDE.md](IMPORT_GUIDE.md)
- **Contributing Guidelines**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Project Overview**: See [README.md](README.md)

## 🏗️ What's Already Set Up

✅ Flutter project structure  
✅ Example service files (Gemini, Supabase)  
✅ Example model files  
✅ Linting configuration  
✅ README files in each directory  
✅ Environment variable template  

## 🎯 Your Next Steps

1. Copy your files as shown above
2. Update `pubspec.yaml` with any additional dependencies
3. Add your API keys to `.env` file
4. Test with `flutter run`
5. Commit and push: `git add . && git commit -m "Import my files" && git push`

## ⚠️ Common Issues

**Problem:** Import errors after copying files  
**Solution:** Update import statements to use `package:thutohub/...`

**Problem:** Dependencies not found  
**Solution:** Run `flutter pub get` and add missing packages to `pubspec.yaml`

**Problem:** API keys not working  
**Solution:** Ensure `.env` file exists (not `.env.example`) and has correct keys

## 💡 Tips

- Keep the existing folder structure
- Don't delete the example files - they serve as references
- Run `flutter analyze` before committing
- Check [IMPORT_GUIDE.md](IMPORT_GUIDE.md) for detailed troubleshooting

---

**Ready to start?** Follow the three steps above and you're done! 🚀
