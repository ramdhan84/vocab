import 'package:flutter_test/flutter_test.dart';
import 'package:kids_vocab_game/models/profile.dart';

void main() {
  test('Profile JSON roundtrip', () {
    final p = Profile(id: 'p1', displayName: ' Alice ', highScore: 10);
    final j = p.toJson();
    expect(j['displayName'], 'Alice');
    final back = Profile.fromJson(j);
    expect(back.displayName, 'Alice');
    expect(back.highScore, 10);
  });
}
