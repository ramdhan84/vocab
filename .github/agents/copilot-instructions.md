# vocab Development Guidelines

Auto-generated from all feature plans. Last updated: 2025-12-15

## Active Technologies

- **Flutter** — Primary UI framework (Dart). Plans MUST document the Flutter SDK and Dart versions used.
- **Dart** — Language runtime used by Flutter.

## Project Structure

```text
src/
tests/
```

## Commands

- `flutter test` — run unit and widget tests
- `flutter analyze` — run static analysis (Dart analyzer / linter)
- `flutter build <platform>` — build artifacts (document CI build steps in plan)

## Code Style

Flutter (Dart) — recommend stable Flutter 3.13+ and matching Dart SDK. Document exact SDK in `environment` during scaffold.: Follow standard conventions

## Recent Changes

- 001-kids-vocab-game: Added Flutter (Dart) — recommend stable Flutter 3.13+ and matching Dart SDK. Document exact SDK in `environment` during scaffold. + `speech_to_text` (ASR), `flutter_tts` (TTS), `image_picker`/`camera` (image capture), `path_provider`, `permission_handler`, `riverpod` (state management - candidate), `flutter_test` (testing).

<!-- MANUAL ADDITIONS START -->
<!-- MANUAL ADDITIONS END -->
