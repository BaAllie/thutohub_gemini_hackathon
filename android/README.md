# Android Configuration

This directory will contain Android-specific configuration files.

## Files to import:
- `build.gradle` - Project-level Gradle configuration
- `app/build.gradle` - App-level Gradle configuration
- `app/src/main/AndroidManifest.xml` - Android manifest
- `app/src/main/kotlin/` - Kotlin source files (if any)

## Note
When importing your Android files, make sure to:
1. Update the application ID in `build.gradle`
2. Check SDK versions match your requirements
3. Add any necessary permissions in `AndroidManifest.xml`
