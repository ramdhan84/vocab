# Phase 0 Research: Kids Vocab Game

**Feature**: 001-kids-vocab-game
**Date**: 2025-12-15

## Decisions (Resolved NEEDS_CLARIFICATION)

- **Speech recognition**: Decision: Use on-device/native speech-to-text (ASR) where available with fuzzy matching and a typed-input fallback.
  - Rationale: Provides the best UX for speaking practice while preserving offline-first and privacy goals. Platform ASR (via `speech_to_text` or equivalent) avoids sending audio to third parties. Typed fallback ensures the game is still playable without ASR.
  - Alternatives considered: typed-only (simpler but loses spoken practice); cloud ASR (better accuracy but violates offline constraint and privacy unless opt-in).

- **Image source**: Decision: Mixed approach — ship a curated, child-appropriate bundled asset set for defaults and allow explicit user uploads (camera/gallery) stored locally.
  - Rationale: Bundled assets ensure consistent, safe visuals; user uploads allow personalization. User-supplied images are stored locally and require explicit selection.
  - Alternatives considered: bundled-only (simpler, safer), user-only (more flexible but increases moderation burden).

- **Audio generation**: Decision: Use device Text-to-Speech (TTS) on demand (offline). Optionally include a small bundled set of pre-recorded audio for key words with higher quality; fallback to TTS for others.
  - Rationale: TTS minimizes app size and supports many words; optional bundled audio improves quality for a core set.
  - Alternatives considered: fully bundled audio (high quality, larger app size), cloud TTS (not offline unless cached and opt-in).

## Storage & Schema

- Use JSON file(s) under app private storage (via `path_provider`) for persistent entities: vocabulary collection, profiles, game results, app settings.
- Store images and audio as files in app-specific directories; the JSON records reference the local URIs.
- Version the schema (include `schemaVersion` in the root object) and plan migration routines when reading older schemas.
- Consider lightweight write patterns (write-to-temp + atomic rename) to avoid corruption.

## Packages & Integration

- Evaluate packages:
  - `speech_to_text`: for on-device ASR (verify offline capability per platform and accuracy).
  - `flutter_tts`: for device TTS playback (verify behavior offline and voice quality).
  - `image_picker` / `camera`: capture or choose images; `image` for resizing/compression.
  - `path_provider` and `permission_handler` for file storage and permissions.
  - `shared_preferences` or flat JSON files for small settings.
  - State management: prefer `Riverpod` or `Provider` for testability — decide in Phase 1.

## Kid UX & Accessibility

- Design constraints: large touch targets, simple language, short flows, fun backgrounds, and non-punitive scoring.
- Include an accessibility checklist and semantics verification for key screens; screen reader labels must be present for all interactive elements.
- Sound design: short, friendly audio cues; global mute and parental volume controls.

## Testing & CI

- Unit tests for storage, model logic, scoring, and migrations.
- Widget tests for Collection, Play Mode, and Profile screens.
- Small integration tests for end-to-end flows (add item → play → score persistence).
- CI: Add GitHub Actions to run `flutter analyze` and `flutter test` on PRs.

## Open Questions / Next Research Tasks

- Confirm minimum supported Android/iOS versions and verify package compatibility.
- Evaluate `speech_to_text` accuracy on target devices offline and fallback heuristics for low-confidence ASR results.
- Decide on state management (Riverpod vs Provider vs Bloc) and document reasons.
- Prepare a small sample asset set (images + short audio) for design and QA.

## Output

Decision summary: Proceed with on-device ASR + typed fallback, device TTS, mixed images, JSON file storage, and a small selection of recommended Flutter packages to evaluate and adopt during Phase 1.
