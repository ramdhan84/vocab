class VocabularyItem {
  final String id;
  final String wordText;
  final String imagePath;
  final String? audioPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;

  VocabularyItem({
    required this.id,
    required this.wordText,
    required this.imagePath,
    this.audioPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.metadata,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory VocabularyItem.fromJson(Map<String, dynamic> json) {
    return VocabularyItem(
      id: json['id'] as String,
      wordText: (json['wordText'] as String).trim(),
      imagePath: json['imagePath'] as String,
      audioPath: json['audioPath'] as String?,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wordText': wordText.trim(),
      'imagePath': imagePath,
      'audioPath': audioPath,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'metadata': metadata,
    };
  }
}
