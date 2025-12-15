import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StoragePaths {
  final Directory appDir;
  StoragePaths(this.appDir);

  File get vocabFile => File('${appDir.path}/vocab.json');
  File get profilesFile => File('${appDir.path}/profiles.json');
  File get resultsFile => File('${appDir.path}/results.json');
  Directory get imagesDir => Directory('${appDir.path}/files/images');
  Directory get audioDir => Directory('${appDir.path}/files/audio');
  Directory get backupsDir => Directory('${appDir.path}/files/backups');
}

class StorageService {
  static const currentSchemaVersion = 1;

  Future<StoragePaths> initPaths() async {
    final dir = await getApplicationDocumentsDirectory();
    final paths = StoragePaths(dir);
    await paths.imagesDir.create(recursive: true);
    await paths.audioDir.create(recursive: true);
    await paths.backupsDir.create(recursive: true);
    return paths;
  }

  Future<Map<String, dynamic>> _readJson(File file) async {
    if (!await file.exists()) {
      return {"schemaVersion": currentSchemaVersion};
    }
    final content = await file.readAsString();
    try {
      final data = jsonDecode(content);
      if (data is Map<String, dynamic>) {
        return data;
      }
      return {"schemaVersion": currentSchemaVersion};
    } catch (_) {
      // Corrupted JSON: return minimal object; caller can decide recovery.
      return {"schemaVersion": currentSchemaVersion};
    }
  }

  Future<void> _atomicWrite(File file, Map<String, dynamic> data) async {
    final tmp = File('${file.path}.tmp');
    await tmp.writeAsString(jsonEncode(data));
    await tmp.rename(file.path);
  }

  Future<Map<String, dynamic>> readVocab(StoragePaths p) => _readJson(p.vocabFile);
  Future<Map<String, dynamic>> readProfiles(StoragePaths p) => _readJson(p.profilesFile);
  Future<Map<String, dynamic>> readResults(StoragePaths p) => _readJson(p.resultsFile);

  Future<void> writeVocab(StoragePaths p, Map<String, dynamic> data) async {
    data["schemaVersion"] = currentSchemaVersion;
    await _atomicWrite(p.vocabFile, data);
  }

  Future<void> writeProfiles(StoragePaths p, Map<String, dynamic> data) async {
    data["schemaVersion"] = currentSchemaVersion;
    await _atomicWrite(p.profilesFile, data);
  }

  Future<void> writeResults(StoragePaths p, Map<String, dynamic> data) async {
    data["schemaVersion"] = currentSchemaVersion;
    await _atomicWrite(p.resultsFile, data);
  }
}
