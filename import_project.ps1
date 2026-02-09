# ThutoHub Project Import Script for Windows (PowerShell)
# This script helps import your local ThutoHub Flutter project into this repository

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "ThutoHub Project Import Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define source and destination paths
$sourcePath = "C:\Users\USER\Documents\CHIHUMURA\thutohub"
$destPath = $PSScriptRoot

Write-Host "Source Path: $sourcePath" -ForegroundColor Yellow
Write-Host "Destination Path: $destPath" -ForegroundColor Yellow
Write-Host ""

# Check if source path exists
if (-not (Test-Path $sourcePath)) {
    Write-Host "ERROR: Source path does not exist!" -ForegroundColor Red
    Write-Host "Please verify that your ThutoHub project is located at:" -ForegroundColor Red
    Write-Host $sourcePath -ForegroundColor Red
    Write-Host ""
    Write-Host "If your project is in a different location, edit this script and update the `$sourcePath variable." -ForegroundColor Yellow
    Pause
    exit 1
}

Write-Host "Source path verified." -ForegroundColor Green
Write-Host ""

# Confirm with user
$confirm = Read-Host "Do you want to proceed with the import? (Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "Import cancelled." -ForegroundColor Yellow
    Pause
    exit 0
}

Write-Host ""
Write-Host "Starting import..." -ForegroundColor Cyan
Write-Host ""

# Define exclusion patterns
$excludeDirs = @('.git', '.dart_tool', 'build', '.idea', '.vscode', 'supabase\.temp')
$excludeFiles = @('.env', '.env.local', '.env.production', '*.key')

try {
    # Get all items from source
    $items = Get-ChildItem -Path $sourcePath -Recurse -Force
    
    $copiedCount = 0
    $skippedCount = 0
    
    foreach ($item in $items) {
        $relativePath = $item.FullName.Substring($sourcePath.Length)
        $destFullPath = Join-Path $destPath $relativePath
        
        # Check if item should be excluded
        $shouldExclude = $false
        
        foreach ($excludeDir in $excludeDirs) {
            if ($relativePath -like "*\$excludeDir\*" -or $relativePath -like "*/$excludeDir/*") {
                $shouldExclude = $true
                break
            }
        }
        
        if (-not $shouldExclude) {
            foreach ($excludeFile in $excludeFiles) {
                if ($item.Name -like $excludeFile) {
                    $shouldExclude = $true
                    break
                }
            }
        }
        
        if ($shouldExclude) {
            $skippedCount++
            continue
        }
        
        # Copy item
        if ($item.PSIsContainer) {
            # Create directory if it doesn't exist
            if (-not (Test-Path $destFullPath)) {
                New-Item -ItemType Directory -Path $destFullPath -Force | Out-Null
            }
        } else {
            # Copy file
            $destDir = Split-Path $destFullPath -Parent
            if (-not (Test-Path $destDir)) {
                New-Item -ItemType Directory -Path $destDir -Force | Out-Null
            }
            Copy-Item -Path $item.FullName -Destination $destFullPath -Force
            $copiedCount++
            
            if ($copiedCount % 10 -eq 0) {
                Write-Host "Copied $copiedCount files..." -NoNewline -ForegroundColor Gray
                Write-Host "`r" -NoNewline
            }
        }
    }
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Import completed successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Copied: $copiedCount files" -ForegroundColor Cyan
    Write-Host "Skipped: $skippedCount items (excluded)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Review the imported files: git status" -ForegroundColor White
    Write-Host "2. Test your Flutter app: flutter pub get" -ForegroundColor White
    Write-Host "3. Commit the changes: git add . && git commit -m 'Import ThutoHub Flutter project'" -ForegroundColor White
    Write-Host "4. Push to GitHub: git push origin main" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "ERROR: Import failed!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Pause
    exit 1
}

Pause
