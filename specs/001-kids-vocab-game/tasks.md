# Phase 2: Implementation Tasks

**Feature**: 001-kids-vocab-game
**Branch**: 001-kids-vocab-game

## Priority Tasks (Phase 2)

1. Scaffold `mobile/` Flutter app with `lib/`, `test/`, and `assets/` and document SDK in `environment`.
2. Implement storage service: JSON file storage, schemaVersion support, atomic writes, image/audio file handling, and migration helpers.
3. Implement core models and unit tests (`VocabularyItem`, `Profile`, `GameResult`).
4. Implement Collection screens (list, add/edit/delete with image picker) and widget tests.
5. Implement Play Mode UI and game loop; integrate `speech_to_text` for on-device ASR with typed fallback and fuzzy matching logic; add scoring and persistence.
6. Integrate `flutter_tts` for Listen button (offline TTS) and optional bundled audio playback.
7. Add parental area: export/import local backup, reset data, difficulty and online-augmentation opt-in behind parental confirmation.
8. Prepare and add a small bundled asset set (20 images + TTS samples) for QA and design.
9. Add accessibility (`Semantics`) and UX checklist verifications (from `checklists/ux.md`) to widget tests where possible.
10. Add CI workflow: GitHub Actions to run `flutter analyze` and `flutter test` on PRs; include build matrix and caching.
11. Add integration tests for key flows and migration tests for storage schema changes.

## Notes

- For any native code requirement or network feature, document justification and get constitution exception approval.
- Track research tasks from `research.md` and complete them before finalizing ASR and state management choices.
