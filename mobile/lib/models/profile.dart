class Profile {
  final String id;
  final String displayName;
  final String? avatarPath;
  final int highScore;
  final List<String> history; // list of GameResult ids
  final DateTime createdAt;
  final DateTime updatedAt;

  Profile({
    required this.id,
    required this.displayName,
    this.avatarPath,
    this.highScore = 0,
    List<String>? history,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : history = history ?? <String>[],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as String,
      displayName: (json['displayName'] as String).trim(),
      avatarPath: json['avatarPath'] as String?,
      highScore: (json['highScore'] ?? 0) as int,
      history: (json['history'] as List?)?.cast<String>() ?? <String>[],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName.trim(),
      'avatarPath': avatarPath,
      'highScore': highScore,
      'history': history,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
