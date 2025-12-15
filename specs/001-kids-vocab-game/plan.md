# Implementation Plan: Kids Vocab Game

**Branch**: `001-kids-vocab-game` | **Date**: 2025-12-15 | **Spec**: `specs/001-kids-vocab-game/spec.md`
**Input**: Feature specification from `specs/001-kids-vocab-game/spec.md`

## Summary

Build a child-friendly, offline-first Flutter mobile app that lets users create and manage vocabulary items (word + image), create profiles, and play a voice-driven game where speaking or typing answers updates per-profile scores. Technical approach uses on-device ASR where available with typed fallback, device TTS for audio, and local JSON files + asset storage for persistence.

## Technical Context

**Language/Version**: Flutter (Dart) — recommend stable Flutter 3.13+ and matching Dart SDK. Document exact SDK in `environment` during scaffold.
**Primary Dependencies**: `speech_to_text` (ASR), `flutter_tts` (TTS), `image_picker`/`camera` (image capture), `path_provider`, `permission_handler`, `riverpod` (state management - candidate), `flutter_test` (testing).
**Storage**: Local files in app private storage: `vocab.json`, `profiles.json`, and `results.json` plus `files/images/` and `files/audio/` for assets. Use atomic write patterns and include `schemaVersion` in roots.
**Testing**: Unit tests for models, storage, and scoring; widget tests for Collection, Play, and Profile screens; small integration tests for end-to-end flows. CI runs `flutter analyze` and `flutter test` on PRs.
**Target Platform**: Mobile (Android & iOS). Verify minimum supported OS versions in Phase 1 tooling check and package compatibility.
**Project Type**: Single mobile Flutter app with a `mobile/` folder at repository root.
**Performance Goals**: UI target 60fps for animations; ASR/TTS latency target: respond to user actions within 300ms for UI changes and <2s for ASR evaluation (platform-dependent).
**Constraints**: Offline-only core functionality; no network dependencies without explicit parental opt-in; small app size (prefer modest asset bundle to limit install size); ensure safety for child users.
**Scale/Scope**: Small-to-medium: single-device usage per family; intended for devices typically used by children (phones/tablets).

## Constitution Check

All constitution gates are addressed and pass for Phase 0 based on the decisions in `research.md`:

- **Flutter-Only**: Implementation will be Flutter/Dart only. Native platform code is NOT planned; any required native hooks (if discovered) will require explicit justification and approval.
- **Offline-First**: All core data (vocab, profiles, results), assets, ASR/TTS fallbacks are designed for local operation. Network features are only allowed behind parental opt-in and explicitly documented.
- **Kid-Safe UX**: UX decisions (large touch targets, minimal text, accessible semantics, parental area) are documented in `research.md` and `checklists/ux.md`; acceptance tests will include accessibility checks.
- **Test Coverage**: Unit, widget, and integration tests are required; CI will enforce `flutter analyze` and `flutter test` on PRs. Storage schema migration tests are required for on-disk format changes.

Status: PASS — no gate violations at this phase.

## Project Structure

### Documentation (this feature)

```text
specs/001-kids-vocab-game/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
└── checklists/
```

### Source Code (repository layout)

```text
mobile/                      # Flutter app root
├── lib/
│   ├── models/              # `vocab_item.dart`, `profile.dart`, `game_result.dart`
│   ├── services/            # storage, asr, tts, image handling
│   ├── screens/             # collection, play, profile, parental
│   ├── widgets/             # reusable UI components
│   └── app.dart
├── test/                    # unit, widget, integration tests
└── assets/                  # bundled images/audio for default vocab
```

**Structure Decision**: Single Flutter mobile app in `mobile/` is the simplest and clearest layout to satisfy the Flutter-Only constitution and to keep app build and tests focused.

## Complexity Tracking

No constitution violations were introduced. If a future need for native code or network services arises, justify in this section and include mitigation and parental opt-in flows.
