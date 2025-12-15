class GameResult {
  final String id;
  final String profileId;
  final int scoreDelta;
  final int correctCount;
  final int incorrectCount;
  final List<String> wordsEncountered; // VocabularyItem ids
  final DateTime timestamp;

  GameResult({
    required this.id,
    required this.profileId,
    required this.scoreDelta,
    required this.correctCount,
    required this.incorrectCount,
    required this.wordsEncountered,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory GameResult.fromJson(Map<String, dynamic> json) {
    return GameResult(
      id: json['id'] as String,
      profileId: json['profileId'] as String,
      scoreDelta: (json['scoreDelta'] ?? 0) as int,
      correctCount: (json['correctCount'] ?? 0) as int,
      incorrectCount: (json['incorrectCount'] ?? 0) as int,
      wordsEncountered: (json['wordsEncountered'] as List?)?.cast<String>() ?? <String>[],
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileId': profileId,
      'scoreDelta': scoreDelta,
      'correctCount': correctCount,
      'incorrectCount': incorrectCount,
      'wordsEncountered': wordsEncountered,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
