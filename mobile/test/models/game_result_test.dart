import 'package:flutter_test/flutter_test.dart';
import 'package:kids_vocab_game/models/game_result.dart';

void main() {
  test('GameResult JSON roundtrip', () {
    final r = GameResult(
      id: 'r1',
      profileId: 'p1',
      scoreDelta: 5,
      correctCount: 3,
      incorrectCount: 1,
      wordsEncountered: ['w1', 'w2'],
    );
    final j = r.toJson();
    final back = GameResult.fromJson(j);
    expect(back.profileId, 'p1');
    expect(back.wordsEncountered.length, 2);
  });
}
