import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Service for interacting with Google Gemini API
/// Handles concept explanations and translations
class GeminiService {
  final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  final String _baseUrl = 'https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent';

  /// Explains a concept in the specified language
  /// 
  /// [concept] - The concept to explain
  /// [language] - The target language for explanation
  /// Returns the explanation text
  Future<String> explainConcept(String concept, String language) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': _apiKey,
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {
                  'text': 'Explain the concept "$concept" in $language for primary school students. '
                      'Use simple language and provide examples.'
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        throw Exception('Failed to get explanation: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error calling Gemini API: $e');
    }
  }

  /// Translates text to the specified language
  /// 
  /// [text] - The text to translate
  /// [targetLanguage] - The target language
  /// Returns the translated text
  Future<String> translate(String text, String targetLanguage) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': _apiKey,
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': 'Translate the following to $targetLanguage: $text'}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        throw Exception('Failed to translate: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error translating: $e');
    }
  }
}
