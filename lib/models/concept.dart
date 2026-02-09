/// Model representing a learning concept
class Concept {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String gradeLevel;
  final List<String> tags;

  Concept({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.gradeLevel,
    this.tags = const [],
  });

  /// Creates a Concept from JSON data
  factory Concept.fromJson(Map<String, dynamic> json) {
    return Concept(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      subject: json['subject'] as String,
      gradeLevel: json['grade_level'] as String,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  /// Converts the Concept to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subject': subject,
      'grade_level': gradeLevel,
      'tags': tags,
    };
  }
}
