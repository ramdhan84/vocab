// Network smoke scanner for offline-first constitution enforcement.
// Fails when common outbound network usage patterns are detected.
import 'dart:io';

void main() {
  final repoRoot = Directory.current.path;
  final suspiciousPatterns = <RegExp>[
    RegExp(r"package:http"),
    RegExp(r"package:dio"),
    RegExp(r"firebase"),
    RegExp(r"WebSocket"),
    RegExp(r"HttpClient"),
    RegExp(r"dart:\\s*io"),
    RegExp(r"socket"),
  ];
  final allowedExceptions = <RegExp>[
    // Add explicit exceptions here if ever approved (documented opt-in only)
  ];

  final srcDirs = [
    Directory('mobile/lib'),
    Directory('mobile/test'),
    Directory('scripts'),
  ];

  var violations = <String>[];

  for (final dir in srcDirs) {
    if (!dir.existsSync()) continue;
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        final content = entity.readAsStringSync();
        for (final pattern in suspiciousPatterns) {
          if (pattern.hasMatch(content)) {
            final isExcepted = allowedExceptions.any((ex) => ex.hasMatch(content));
            if (!isExcepted) {
              violations.add('Detected pattern ${pattern.pattern} in ${entity.path}');
            }
          }
        }
      }
    }
  }

  if (violations.isNotEmpty) {
    stderr.writeln('Network smoke test FAILED');
    for (final v in violations) {
      stderr.writeln('- $v');
    }
    exit(1);
  } else {
    stdout.writeln('Network smoke test passed: no suspicious patterns found.');
  }
}
