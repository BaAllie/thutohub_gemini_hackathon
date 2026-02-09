import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Service for interacting with Supabase backend
/// Handles database operations for concepts and user data
class SupabaseService {
  final String _url = dotenv.env['SUPABASE_URL'] ?? '';
  final String _anonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  Map<String, String> get _headers => {
        'apikey': _anonKey,
        'Authorization': 'Bearer $_anonKey',
        'Content-Type': 'application/json',
      };

  /// Fetches all concepts from the database
  /// Returns a list of concept objects
  Future<List<dynamic>> getConcepts() async {
    try {
      final response = await http.get(
        Uri.parse('$_url/rest/v1/concepts?select=*'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to load concepts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching concepts: $e');
    }
  }

  /// Fetches a single concept by ID
  /// 
  /// [id] - The concept ID
  /// Returns the concept object
  Future<Map<String, dynamic>> getConcept(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$_url/rest/v1/concepts?id=eq.$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return data[0] as Map<String, dynamic>;
        }
        throw Exception('Concept not found');
      } else {
        throw Exception('Failed to load concept: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching concept: $e');
    }
  }

  /// Saves user progress
  /// 
  /// [userId] - The user ID
  /// [conceptId] - The concept ID
  /// [completed] - Whether the concept is completed
  Future<void> saveProgress(String userId, String conceptId, bool completed) async {
    try {
      final response = await http.post(
        Uri.parse('$_url/rest/v1/progress'),
        headers: _headers,
        body: jsonEncode({
          'user_id': userId,
          'concept_id': conceptId,
          'completed': completed,
          'updated_at': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save progress: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saving progress: $e');
    }
  }

  /// Fetches user progress
  /// 
  /// [userId] - The user ID
  /// Returns a list of progress objects
  Future<List<dynamic>> getUserProgress(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$_url/rest/v1/progress?user_id=eq.$userId&select=*'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to load progress: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching progress: $e');
    }
  }
}
