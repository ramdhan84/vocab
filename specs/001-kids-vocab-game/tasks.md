---

description: "Task list for feature implementation"

---

# Tasks: Kids Vocab Game

**Input**: `specs/001-kids-vocab-game/` design docs

## Phase 1: Setup (Project Initialization)

- [ ] T001 Create Flutter app scaffold in `mobile/` and document Flutter SDK in `mobile/pubspec.yaml` (`environment` field)
- [ ] T002 [P] Add baseline project files: `mobile/README.md`, `.gitignore`, and `mobile/.metadata` (if needed)
- [ ] T003 Configure static analysis and linting: add `analysis_options.yaml` and `mobile/` `analyzer` settings
- [ ] T004 [P] Add formatting and pre-commit hooks (`.github/` or `.husky/`) and a `flutter format` check in CI

---

## Phase 2: Foundational (Blocking Prerequisites)

- [ ] T005 Setup `mobile/pubspec.yaml` dependencies: `speech_to_text`, `flutter_tts`, `image_picker`, `path_provider`, `permission_handler`, `riverpod` (candidate) and lock versions in `pubspec.lock`
- [ ] T006 [P] Implement storage service skeleton in `mobile/lib/services/storage_service.dart` (JSON files, atomic writes, `schemaVersion`) and tests in `mobile/test/services/storage_service_test.dart`
- [ ] T007 [P] Create core models in `mobile/lib/models/`: `vocabulary_item.dart`, `profile.dart`, `game_result.dart` with unit tests in `mobile/test/models/`
- [ ] T008 [P] Add `mobile/assets/` and add a placeholder `mobile/assets/README.md` plus sample asset manifest `mobile/assets/manifest.json`
- [ ] T009 [P] Create `mobile/lib/services/image_service.dart` for image import/resizing and `mobile/test/services/image_service_test.dart`
- [ ] T010 [P] Create `mobile/lib/services/tts_service.dart` (TTS wrapper) and `mobile/test/services/tts_service_test.dart`
- [ ] T011 [P] Create initial CI workflow `.github/workflows/flutter.yml` to run `flutter analyze` and `flutter test` (include a network-off smoke job — see T035). Acceptance: CI passes on branch `001-kids-vocab-game`.
- [ ] T012 Accessibility baseline: Add `mobile/test/accessibility/accessibility_test.dart` and enforce touch target and semantics checks
- [ ] T034 [P] Dependency offline audit: verify each third-party package for network behavior, document findings in `specs/001-kids-vocab-game/docs/dependency-audit.md`, and list any packages requiring opt-in exceptions.
- [ ] T035 [P] Runtime network-blocking smoke test and CI assertion: add scanner script `scripts/network_smoke_test.dart` and CI job `.github/workflows/flutter.yml` that runs it and fails on suspicious network patterns.
- [ ] T036 [P] Storage-corruption & low-disk tests: add tests that simulate corrupted JSON and low-disk conditions and assert safe failure modes and backups (`mobile/test/migrations/` and `mobile/test/storage/`).
- [ ] T037 [P] ASR test harness & corpus: define an ASR test corpus and harness (`specs/001-kids-vocab-game/tests/asr/`), implement automated verification tests that validate SC-002 per platform.

**Checkpoint**: Foundational work complete — user stories may begin after T011 and T006..T007 are in place

---

## Phase 3: User Story 1 - Manage Vocabulary Collection (Priority: P1)

**Goal**: Allow adding, editing, deleting vocabulary items (word + image) and persist changes locally.

**Independent Test**: Create, edit, and delete vocabulary items and verify persistence across app restarts.

- [ ] T013 [P] [US1] Add `mobile/lib/screens/collection_screen.dart` and `mobile/lib/widgets/vocab_list.dart` (list UI)
- [ ] T014 [P] [US1] Implement `mobile/lib/widgets/vocab_editor.dart` (add/edit UI with `image_picker`) and widget tests in `mobile/test/widget/vocab_editor_test.dart`
- [ ] T015 [US1] Implement `mobile/lib/services/vocab_repository.dart` for CRUD operations and unit tests in `mobile/test/services/vocab_repository_test.dart`
- [ ] T016 [US1] [P] Add image asset management: store images to `mobile/files/images/<id>.<ext>` and validate decoding in `mobile/test/services/image_integration_test.dart`
- [ ] T017 [US1] [US1] Add integration test `mobile/test/integration/manage_collection_test.dart` to verify persistence across restarts

**Checkpoint**: Collection screen and CRUD operations complete and testable independently

---

## Phase 4: User Story 2 - Play Mode (Priority: P1)

**Goal**: Show random word + image, accept spoken or typed answers, score updates, and Listen button plays word audio.

**Independent Test**: Start play session with known words; simulate correct and incorrect responses and verify scoring and audio playback.

- [ ] T018 [US2] Add `mobile/lib/screens/play_screen.dart` and `mobile/lib/services/game_service.dart` (game loop)
- [ ] T019 [P] [US2] Implement `mobile/lib/services/asr_service.dart` integrating `speech_to_text` with typed-input fallback and unit tests in `mobile/test/services/asr_service_test.dart`
- [ ] T020 [P] [US2] Implement `mobile/lib/services/tts_service.dart` usage in Play Mode and add Listen control UI and tests `mobile/test/widget/play_screen_test.dart`
- [ ] T021 [US2] Implement scoring logic in `mobile/lib/services/score_service.dart` and tests in `mobile/test/services/score_service_test.dart`
- [ ] T022 [US2] Add integration test `mobile/test/integration/play_mode_test.dart` to simulate answer flows (mock ASR)

**Checkpoint**: Play Mode is testable and works without network access

---

## Phase 5: User Story 3 - Profiles & Scores (Priority: P2)

**Goal**: Support multiple player profiles and per-profile score history.

**Independent Test**: Create multiple profiles, play sessions under each, and verify score association and persistence.

- [ ] T023 [US3] Implement `mobile/lib/screens/profile_screen.dart` and UI to create/select profiles
- [ ] T024 [US3] Implement `mobile/lib/services/profile_service.dart` for profile CRUD and history persistence with tests `mobile/test/services/profile_service_test.dart`
- [ ] T025 [US3] Add integration test `mobile/test/integration/profiles_scores_test.dart` to verify per-profile score history

---

## Phase 6: Parental Area & Cross-Cutting Concerns

- [ ] T026 [P] Add `mobile/lib/screens/parental_screen.dart` with data export/import to `mobile/files/backups/` and reset functionality
- [ ] T027 [P] Implement parental opt-in UI for online augmentation (UI only; feature disabled by default) and store flag in `mobile/lib/models/app_settings.dart`
- [ ] T028 [P] Add storage migration tests `mobile/test/migrations/migration_test.dart` and example migration utilities in `mobile/lib/migrations/`
- [ ] T029 [P] Perform accessibility and UX checklist fixes from `specs/001-kids-vocab-game/checklists/ux.md` and add semantic tests
- [ ] T030 [P] Add sample bundled asset set `mobile/assets/sample/` (20 images + sample TTS audio) and update `mobile/assets/manifest.json`

---

## Final Phase: Polish & Documentation

- [ ] T031 [P] Add quickstart and developer docs: update `specs/001-kids-vocab-game/quickstart.md` and add `mobile/README.md`
- [ ] T032 [P] Add CI caching and matrix improvements to `.github/workflows/flutter.yml`
- [ ] T033 [P] Final cross-platform validation and device testing checklist in `specs/001-kids-vocab-game/checklists/`

---

## Dependencies & Execution Order

- **Phase 1 (Setup)**: T001..T004 — no prerequisites, can start immediately
- **Phase 2 (Foundational)**: T005..T012 — BLOCKS all user stories until complete
- **User Stories (Phases 3..5)**: Can start after foundational tasks are complete. US1 and US2 are P1 and should be prioritized (US1 → US2 recommended), US3 is P2
- **Parallel opportunities**: Tasks marked `[P]` can run in parallel (different files and no direct dependency). Multiple developers can implement different stories in parallel after foundations are complete.

## Implementation Strategy (MVP First)

1. Complete Phase 1: Setup (T001..T004)
2. Complete Phase 2: Foundational (T005..T012)
3. Implement User Story 1 (T013..T017) and validate independently
4. Implement User Story 2 (T018..T022) and validate independently
5. Implement User Story 3 (T023..T025) and finish parental & migration tasks (T026..T030)
6. Polish docs, CI, and cross-cutting concerns (T031..T033)

---

**Files changed**: `specs/001-kids-vocab-game/tasks.md`
