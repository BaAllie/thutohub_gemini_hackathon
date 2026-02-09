@echo off
REM ThutoHub Project Import Script for Windows
REM This script helps import your local ThutoHub Flutter project into this repository

echo ========================================
echo ThutoHub Project Import Script
echo ========================================
echo.

REM Define source and destination paths
set SOURCE_PATH=C:\Users\USER\Documents\CHIHUMURA\thutohub
set DEST_PATH=%~dp0

echo Source Path: %SOURCE_PATH%
echo Destination Path: %DEST_PATH%
echo.

REM Check if source path exists
if not exist "%SOURCE_PATH%" (
    echo ERROR: Source path does not exist!
    echo Please verify that your ThutoHub project is located at:
    echo %SOURCE_PATH%
    echo.
    echo If your project is in a different location, edit this script and update the SOURCE_PATH variable.
    pause
    exit /b 1
)

echo Source path verified.
echo.

REM Confirm with user
set /p CONFIRM="Do you want to proceed with the import? (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo Import cancelled.
    pause
    exit /b 0
)

echo.
echo Starting import...
echo.

REM Copy files excluding git folder and build artifacts
echo Copying Flutter project files...
robocopy "%SOURCE_PATH%" "%DEST_PATH%" /E /XD .git .dart_tool build .idea .vscode /XF .env .env.local .env.production *.key /NFL /NDL /NJH /NJS

if %ERRORLEVEL% LSS 8 (
    echo.
    echo ========================================
    echo Import completed successfully!
    echo ========================================
    echo.
    echo Next steps:
    echo 1. Review the imported files: git status
    echo 2. Test your Flutter app: flutter pub get
    echo 3. Commit the changes: git add . ^&^& git commit -m "Import ThutoHub Flutter project"
    echo 4. Push to GitHub: git push origin main
    echo.
) else (
    echo.
    echo ERROR: Import failed with error level %ERRORLEVEL%
    echo Please check the error messages above.
    echo.
)

pause
