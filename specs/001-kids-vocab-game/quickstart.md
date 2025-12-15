# Quickstart: Kids Vocab Game (Developer)

**Feature**: 001-kids-vocab-game
**Date**: 2025-12-15

## Prerequisites

- Install Flutter SDK (stable). Recommended: Flutter 3.13+.
- Install platform tools: Android SDK / Android Studio and Xcode (macOS) as needed.
- Ensure `flutter doctor` is clean.

## Setup

1. Clone the repo and switch to the feature branch:

```bash
git clone https://github.com/ramdhan84/vocab.git
cd vocab
git fetch origin
git checkout 001-kids-vocab-game
```

2. Open the Flutter project under `mobile/` (if scaffolded) or run:

```bash
flutter pub get
flutter run -d <device>
```

3. Run tests locally:

```bash
flutter analyze
flutter test
```

## Notes

- App is offline-first. If you enable any online augmentation (for testing), do so behind explicit parental opt-in and be aware of privacy requirements.
- For local development of ASR and TTS, test on real devices where possible (emulators may have limited ASR/TTS support).
