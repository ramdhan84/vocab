# Data Model: Kids Vocab Game

**Feature**: 001-kids-vocab-game
**Date**: 2025-12-15

## Entities

### VocabularyItem
- Description: Single vocabulary entry with word text and related image/audio assets.
- Fields:
  - `id` (string, UUID) — unique identifier
  - `wordText` (string) — the vocabulary word (required, non-empty)
  - `imagePath` (string, local URI) — required, points to stored image file
  - `audioPath` (string, local URI, optional) — optional pre-recorded audio file
  - `createdAt` (string, ISO-8601 timestamp)
  - `updatedAt` (string, ISO-8601 timestamp)
  - `metadata` (object) — e.g., `difficulty`, `tags`
- Validation rules: `wordText` must be trimmed; image file must exist and be decodable.
- State transitions: Created → Edited → Deleted

### Profile
- Description: Player profile
- Fields:
  - `id` (string, UUID)
  - `displayName` (string, required)
  - `avatarPath` (string, local URI, optional)
  - `highScore` (integer)
  - `history` (array of `GameResult` ids)
  - `createdAt`, `updatedAt`
- Validation: `displayName` length and allowed characters; avatar image constraints
- State transitions: Created → Active → Deleted

### GameResult
- Description: Single play session result (one game session summary)
- Fields:
  - `id` (string, UUID)
  - `profileId` (string, UUID)
  - `scoreDelta` (integer)
  - `correctCount` (integer)
  - `incorrectCount` (integer)
  - `wordsEncountered` (array of `VocabularyItem` ids)
  - `timestamp` (ISO-8601)

### AppSettings
- Description: Local user and parental settings
- Fields:
  - `soundOn` (bool)
  - `musicVolume` (0-100)
  - `sfxVolume` (0-100)
  - `difficulty` (enum: easy/medium/hard)
  - `allowOnlineAugmentation` (bool, default false — parental opt-in)
  - `schemaVersion` (integer)

## Storage Layout
- A top-level JSON file `vocab.json` stores VocabularyItem objects (array) and `schemaVersion`.
- `profiles.json` stores Profile objects and `schemaVersion`.
- `results.json` stores GameResult objects (or a compact per-profile history file).
- Images and audio files are saved under `files/images/<id>.<ext>` and `files/audio/<id>.<ext>`.

## Migration Guidance
- Always include `schemaVersion` in storage root.
- On load, detect older versions and apply migration steps in code; include unit tests for each migration.
- Preserve unknown fields when migrating forward where reasonable.

## Example JSON (VocabularyItem)
{
  "schemaVersion": 1,
  "vocab": [
    {
      "id": "uuid-123",
      "wordText": "apple",
      "imagePath": "files/images/uuid-123.jpg",
      "audioPath": null,
      "createdAt": "2025-12-15T12:00:00Z",
      "updatedAt": "2025-12-15T12:00:00Z",
      "metadata": { "difficulty": "easy" }
    }
  ]
}
