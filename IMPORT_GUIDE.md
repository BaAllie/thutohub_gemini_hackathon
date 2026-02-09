# ThutoHub Project Import Guide

## Importing Your Local ThutoHub Flutter Project

This guide will help you import your local ThutoHub Flutter project from your Windows machine into this GitHub repository.

### Prerequisites
- Git installed on your Windows machine
- Your ThutoHub Flutter project located at: `C:\Users\USER\Documents\CHIHUMURA\thutohub`
- This repository cloned on your Windows machine

### Quick Start

**For Windows Users:**
- Run `import_project.bat` (double-click or run from Command Prompt)
- Or run `import_project.ps1` (right-click → "Run with PowerShell")

**For Linux/Mac Users:**
- Edit `import_project.sh` to set your source path
- Run `./import_project.sh`

### Import Steps

#### Option 1: Automated Import (Recommended)

**Windows - Command Prompt:**
```bash
# Navigate to the repository
cd path\to\thutohub_gemini_hackathon

# Run the batch script
import_project.bat
```

**Windows - PowerShell:**
```powershell
# Navigate to the repository
cd path\to\thutohub_gemini_hackathon

# Run the PowerShell script
.\import_project.ps1
```

**Linux/Mac:**
```bash
# Navigate to the repository
cd /path/to/thutohub_gemini_hackathon

# Edit the script to set your source path
nano import_project.sh  # or use your preferred editor

# Make it executable (if not already)
chmod +x import_project.sh

# Run the script
./import_project.sh
```

#### Option 2: Manual Copy (If Scripts Don't Work)

1. **Clone this repository** (if you haven't already):
   ```bash
   git clone https://github.com/BaAllie/thutohub_gemini_hackathon.git
   cd thutohub_gemini_hackathon
   ```

2. **Copy your Flutter project files**:
   - Open File Explorer and navigate to `C:\Users\USER\Documents\CHIHUMURA\thutohub`
   - Copy all the Flutter project files (lib/, android/, ios/, pubspec.yaml, etc.)
   - Paste them into the cloned repository folder
   - Make sure NOT to copy the `.git` folder from your local project

3. **Verify the files**:
   ```bash
   git status
   ```

4. **Commit and push**:
   ```bash
   git add .
   git commit -m "Import ThutoHub Flutter project"
   git push origin main
   ```

#### Option 2: Using Command Line

1. **Open Command Prompt or PowerShell** on your Windows machine

2. **Navigate to this repository**:
   ```bash
   cd path\to\thutohub_gemini_hackathon
   ```

3. **Copy files using robocopy** (Windows):
   ```bash
   robocopy "C:\Users\USER\Documents\CHIHUMURA\thutohub" . /E /XD .git .dart_tool build /XF .env
   ```

4. **Or using PowerShell**:
   ```powershell
   Copy-Item -Path "C:\Users\USER\Documents\CHIHUMURA\thutohub\*" -Destination . -Recurse -Exclude .git,.dart_tool,build,.env
   ```

5. **Stage and commit**:
   ```bash
   git add .
   git commit -m "Import ThutoHub Flutter project"
   git push origin main
   ```

#### Option 3: Using Git (Advanced)

If your local thutohub folder is a git repository:

```bash
# Navigate to this repository
cd path\to\thutohub_gemini_hackathon

# Add your local project as a remote
git remote add local "C:\Users\USER\Documents\CHIHUMURA\thutohub"

# Fetch from local
git fetch local

# Merge (or cherry-pick specific commits)
git merge local/main --allow-unrelated-histories

# Push to GitHub
git push origin main
```

### What Files to Import

Make sure you include these essential Flutter files:
- `lib/` - Your Dart source code
- `android/` - Android specific files
- `ios/` - iOS specific files (if exists)
- `pubspec.yaml` - Dependencies configuration
- `pubspec.lock` - Locked dependencies
- `assets/` - Any images, fonts, or other assets
- `test/` - Test files (if any)

### What NOT to Import

These files/folders should be excluded (already in .gitignore):
- `.dart_tool/`
- `build/`
- `.pub/`
- `.env` files with secrets
- `*.key` files
- `.idea/` or `.vscode/` IDE settings

### After Import

1. **Verify Flutter setup**:
   ```bash
   flutter doctor
   flutter pub get
   ```

2. **Test the app**:
   ```bash
   flutter run
   ```

3. **Update environment variables**:
   - Create a `.env` file with your Gemini API key and Supabase credentials
   - Never commit this file to Git (it's already in .gitignore)

### Need Help?

If you encounter any issues:
1. Check that Flutter is properly installed: `flutter doctor`
2. Verify all dependencies: `flutter pub get`
3. Check the repository's issues or create a new one

### Security Note

⚠️ **Important**: Never commit sensitive information like:
- API keys
- Database passwords
- Private keys (.key files)
- Environment variables with secrets

These are already excluded in `.gitignore`, but always double-check before committing.
