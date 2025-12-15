import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:path_provider_platform_interface/src/method_channel_path_provider.dart';

import 'package:path_provider/path_provider.dart';

import '../../lib/services/storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('StorageService', () {
    test('initializes paths and writes/reads vocab JSON', () async {
      final service = StorageService();
      final paths = await service.initPaths();

      final data = {
        'schemaVersion': StorageService.currentSchemaVersion,
        'vocab': [
          {'id': 'uuid-123', 'wordText': 'apple'}
        ]
      };
      await service.writeVocab(paths, data);

      final read = await service.readVocab(paths);
      expect(read['schemaVersion'], StorageService.currentSchemaVersion);
      expect((read['vocab'] as List).first['wordText'], 'apple');
    });

    test('handles corrupted JSON gracefully', () async {
      final service = StorageService();
      final paths = await service.initPaths();
      await paths.vocabFile.writeAsString('{"schemaVersion":1,"vocab": [ { "bad":');
      final read = await service.readVocab(paths);
      expect(read['schemaVersion'], StorageService.currentSchemaVersion);
    });
  });
}
