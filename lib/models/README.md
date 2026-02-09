# Models

This directory contains data models/classes for the app.

## Organization
- Each model should be in its own file
- Use clear, descriptive names
- Include JSON serialization if using APIs

## Example
```dart
class Concept {
  final String id;
  final String title;
  final String description;
  final String language;

  Concept({
    required this.id,
    required this.title,
    required this.description,
    required this.language,
  });

  factory Concept.fromJson(Map<String, dynamic> json) {
    return Concept(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      language: json['language'],
    );
  }
}
```
