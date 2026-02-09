# Services

This directory contains service classes for API calls, database operations, and external integrations.

## Organization
- `gemini_service.dart` - Gemini API integration
- `supabase_service.dart` - Supabase database operations
- `translation_service.dart` - Language translation logic

## Example
```dart
class GeminiService {
  final String apiKey;

  GeminiService({required this.apiKey});

  Future<String> explainConcept(String concept, String language) async {
    // API call to Gemini
    return 'Explanation in $language';
  }
}
```
