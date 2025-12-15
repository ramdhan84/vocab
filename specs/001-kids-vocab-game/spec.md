# Feature Specification: Kids Vocab Game

**Feature Branch**: `001-kids-vocab-game`  
**Created**: 2025-12-15  
**Status**: Draft  
**Input**: User description: "Create a kid-friendly offline Flutter mobile app to learn English vocabulary. Must use Flutter only, no backend or external services. App includes a vocab collection where users can add, edit, delete words; every word must have a related image. Users create a profile and see their score. Gameplay: user is given a random word plus image then must say the word; correct = points, incorrect = minus points. Provide a listen button to play the word. Include fun backgrounds and cute sounds for playability."

## User Scenarios & Testing *(mandatory)*

<!--
  IMPORTANT: User stories should be PRIORITIZED as user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value.
  
  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone slice of functionality that can be:
  - Developed independently
  - Tested independently
  - Deployed independently
  - Demonstrated to users independently
-->

### User Story 1 - Manage Vocabulary Collection (Priority: P1)

As a child or parent, I can add, edit, and delete vocabulary items so I can build a custom set of words to practice.

**Why this priority**: The vocab collection is the core content model; without it there is nothing to practice.

**Independent Test**: Create a new vocabulary item with a word and image, edit its caption, and delete it; the collection should reflect each change and persist after app restart.

**Acceptance Scenarios**:

1. **Given** the app is installed with an empty collection, **When** the user adds a word with an image, **Then** the word appears in the collection and persists across restarts.
2. **Given** a word exists, **When** the user edits the word's text or replaces the image, **Then** the updated information is shown and persisted.
3. **Given** a word exists, **When** the user deletes it, **Then** it is removed from collection and storage.

---

### User Story 2 - Play Mode (Priority: P1)

As a child, I can start a game session where the app shows a random word and image and I must speak the word; correct answers give points and incorrect answers subtract points. I can press a "listen" button to hear the word.

**Why this priority**: This is the primary interactive learning experience and is the main reason users will open the app.

**Independent Test**: Start a play session with a small set of known words; simulate correct and incorrect responses and verify scoring, audio playback, and persistence of results.

**Acceptance Scenarios**:

1. **Given** at least one word exists, **When** the user starts Play Mode, **Then** the app shows a random word + image and allows the user to attempt the answer.
2. **Given** the user presses "listen", **When** the system plays the word audio, **Then** the audio is audible and matches the shown word.
3. **Given** the user answers correctly, **When** the system evaluates the response, **Then** the user's score increases according to the scoring rules and is shown on screen.
4. **Given** the user answers incorrectly, **When** the system evaluates the response, **Then** the score decreases according to the scoring rules and the correct answer is optionally revealed.

---

### User Story 3 - Profiles & Scores (Priority: P2)

As a player, I can create a profile and view my score history so multiple children on the same device can track their progress.

**Why this priority**: Multiple child profiles ensure personalized experience and independent progress tracking.

**Independent Test**: Create two profiles, play a session with each, and verify that scores are associated with the correct profile and persist across restarts.

**Acceptance Scenarios**:

1. **Given** no profile exists, **When** the user creates a profile with a display name (and optional avatar), **Then** the profile is saved and selectable on app startup.
2. **Given** multiple profiles exist, **When** the user switches profile, **Then** subsequent play sessions record scores under the active profile.

---

[Add more user stories as needed, each with an assigned priority]

### Edge Cases

 - What happens when an image is missing or cannot be decoded? (Fallback image and safe deletion flows required)
 - How does the system behave if storage is corrupted or full? (Safe fail + local backup/export recommended)
 - How does the system behave with no microphone permission or absent/unsupported local speech recognition?

## Constraints (mandatory)

- **Platform**: MUST be implemented in Flutter and Dart. Document the Flutter SDK and Dart versions used.
- **Offline**: MUST work fully offline; network access is disallowed for core functionality.
- **Storage**: All persistent data MUST be stored locally using files in the app's private storage. No external databases or cloud storage.
- **Privacy**: No personal data collection by default; any sharing is explicit, opt-in, and operates on local data only.

## Requirements *(mandatory)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right functional requirements.
-->

### Functional Requirements

- **FR-001**: The app MUST allow adding new vocabulary items with a word and an image.
- **FR-002**: The app MUST allow editing and deleting existing vocabulary items.
- **FR-003**: The app MUST validate that a vocabulary item includes an image and present clear UI when missing.
- **FR-004**: The app MUST allow creating, editing, and selecting player profiles and persist scores per profile.
- **FR-005**: The app MUST provide Play Mode: random selection of words, audio playback on-demand, capture of user answers (voice or typed), and scoring updates.

- **FR-006**: The app MUST persist vocabulary content and user progress to local files (exportable/importable JSON) and support safe migrations with automated tests.
- **FR-007**: The app MUST expose accessibility metadata (semantics) for major UI components and meet basic contrast/touch target sizes for children.
- **FR-008**: Users MUST be able to add, edit, and delete vocabulary items; each item MUST include a text word and an associated image.
- **FR-009**: The app MUST allow creating and selecting profiles; scores MUST be tracked per profile and persist locally.
- **FR-010**: The app MUST provide a Play Mode that selects random words, plays audio for the word on-demand, accepts spoken answers (or typed alternatives), and updates score accordingly.
- **FR-011**: The app MUST include a "listen" control to play the word audio and a visual feedback for correct/incorrect answers.
- **FR-012**: Sounds and backgrounds used in Play Mode MUST be local bundled assets; user-supplied assets are allowed but optional.
- **FR-013**: The app MUST NOT require network access; any attempt to reach network endpoints MUST be blocked or disabled in the UI.
- **FR-014**: The app MUST surface a safe parental area to reset data, export/import local backups, and adjust difficulty/sound settings.

**FR-015**: The app MUST evaluate a spoken response to determine correctness using on-device/native speech-to-text (ASR) with fuzzy matching and a typed-input fallback. If the device does not provide a suitable ASR or the user denies microphone permission, Play Mode MUST offer a typed-answer option and clearly indicate that voice evaluation is unavailable.

**FR-016**: Images for vocabulary items will be provided using a mixed approach: the app ships with a curated, child-appropriate bundled asset set and also allows user-supplied images via camera or gallery. Bundled assets are the default; user images are stored locally and require explicit selection.

**FR-017**: Audio for the word will be provided using device Text-to-Speech (TTS) on demand (offline). The app MAY optionally include bundled, pre-recorded high-quality audio for a small core set of words and use TTS as fallback for other words.

### Online Augmentation (policy)

Although the app is Offline-First, the product MAY offer optional online augmentation features (for example, online ASR, cloud audio, or image search) only under the following strict rules:

- Must be explicitly opt-in by a parent/guardian (disabled by default).  
- Must be clearly labeled and documented in the UI and privacy notes.  
- Must not be required for core functionality (vocab collection, Play Mode, profiles must work offline).  
- Must not share personal data; any uploads must be explicit and limited to non-identifying content.  
- Adding an online augmentation requires an accompanying privacy assessment and product owner sign-off.

*Example of marking unclear requirements:*

- **FR-006**: System MUST authenticate users via [NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?]
- **FR-007**: System MUST retain user data for [NEEDS CLARIFICATION: retention period not specified]

### Key Entities *(include if feature involves data)*

- **VocabularyItem**: Represents a single word and its assets. Attributes: `id`, `wordText`, `imagePath` (local URI), optional `audioPath` (local URI), `createdAt`, `metadata` (difficulty, tags).
- **Profile**: Represents a player. Attributes: `id`, `displayName`, optional `avatarPath`, `highScore`, `history` (list of GameResult references).
- **GameResult**: Represents a play session result. Attributes: `profileId`, `scoreDelta`, `timestamp`, `correctCount`, `incorrectCount`, `wordsEncountered`.
- **AppSettings**: Device and parental settings (sound on/off, difficulty, auto-listen, accessibility toggles).

## Success Criteria *(mandatory)*

<!--
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic and measurable.
-->

### Measurable Outcomes

- **SC-001**: Users can add a new vocabulary item (word + image) and see it appear in the collection within 2 minutes (measured by manual UI test).
- **SC-002**: Play Mode evaluates answers and updates score correctly in 95% of automated verification tests (seeded set of spoken or typed answers).
- **SC-003**: App supports full offline operation: all primary flows (manage collection, play, profile selection) function without network access.
- **SC-004**: Scores and progress persist across app restarts and device reboots for the active profile.
- **SC-005**: Accessibility: Primary screens expose semantics and are navigable with screen reader (manual verification checklist).
