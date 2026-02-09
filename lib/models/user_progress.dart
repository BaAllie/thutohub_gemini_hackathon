/// Model representing user learning progress
class UserProgress {
  final String id;
  final String userId;
  final String conceptId;
  final bool completed;
  final DateTime updatedAt;
  final int? score;

  UserProgress({
    required this.id,
    required this.userId,
    required this.conceptId,
    required this.completed,
    required this.updatedAt,
    this.score,
  });

  /// Creates a UserProgress from JSON data
  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      conceptId: json['concept_id'] as String,
      completed: json['completed'] as bool,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      score: json['score'] as int?,
    );
  }

  /// Converts the UserProgress to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'concept_id': conceptId,
      'completed': completed,
      'updated_at': updatedAt.toIso8601String(),
      'score': score,
    };
  }
}
