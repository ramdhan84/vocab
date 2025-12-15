import 'package:flutter_test/flutter_test.dart';
import 'package:kids_vocab_game/models/vocabulary_item.dart';

void main() {
  group('VocabularyItem', () {
    test('toJson/fromJson roundtrip', () {
      final item = VocabularyItem(
        id: 'uuid-1',
        wordText: ' apple ',
        imagePath: 'files/images/uuid-1.jpg',
        metadata: {'difficulty': 'easy'},
      );
      final json = item.toJson();
      expect(json['wordText'], 'apple');
      final back = VocabularyItem.fromJson(json);
      expect(back.wordText, 'apple');
      expect(back.imagePath, 'files/images/uuid-1.jpg');
    });
  });
}
