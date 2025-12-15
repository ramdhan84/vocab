<!--
Sync Impact Report
- Version change: none -> 1.0.0
- Modified principles: (added) Flutter-Only → Offline-First → Kid-Safe UX → Privacy & Minimal Data → Testable & Accessible
- Added sections: Development Workflow, Additional Constraints
- Removed sections: none
- Templates requiring updates:
	- .specify/templates/plan-template.md ✅ updated
	- .specify/templates/spec-template.md ✅ updated
	- .specify/templates/tasks-template.md ✅ updated
	- .specify/templates/checklist-template.md ✅ updated
	- .specify/templates/agent-file-template.md ✅ updated
- Follow-up TODOs: none
-->

# Vocab (Kids English) Constitution

## Core Principles

### I. Flutter-Only (NON-NEGOTIABLE)
All production code for the app MUST be written in Flutter and Dart. Native platform code is only allowed when a clear, documented technical justification exists and an explicit exception is approved in writing.

Rationale: Using a single UI framework simplifies maintenance, testing, and onboarding for small teams focused on mobile UX.

### II. Offline-First Storage (NON-NEGOTIABLE)
The application MUST function fully offline. All persistent data MUST be stored locally using files under the app's private storage (e.g., JSON, binary blobs, or platform file APIs). The project MUST NOT rely on any backend service, external database, or cloud storage.

Rationale: Target environment constraints and privacy goals require a fully local experience.

### III. Kid-Safe UX (NON-NEGOTIABLE)
The product experience MUST be child-friendly: large touch targets, minimal text complexity, no external advertising, no tracking, clear parental controls, and flows designed for the target age group. UI decisions that materially affect safety or comprehension MUST be validated with at least one user or educator test (can be lightweight).

Rationale: Safety and usability for children are core to the product's mission.

### IV. Privacy & Minimal Data (NON-NEGOTIABLE)
Collect no personal data by default. Any optional data export or sharing MUST be explicit, opt-in, and only operate on locally stored data. The product MUST NOT emit analytics, telemetry, or network calls that leak usage data.

Rationale: Minimize legal and ethical obligations and maintain user trust for children and guardians.

### V. Testable & Accessible
All features MUST include automated tests appropriate to Flutter (unit and widget tests). Accessibility checks (semantics, screen reader labels) MUST be part of acceptance criteria for UI features.

Rationale: Tests and accessibility ensure product quality and broaden reach for diverse learners.

## Additional Constraints

- No external services: The app MUST NOT depend on any third-party online API or SaaS. Local-only resources and bundled assets are allowed.
- Build reproducibility: Builds MUST be reproducible from source with documented Flutter SDK version and build commands.
- Dependency policy: Prefer first-party Flutter SDK and stable, well-maintained packages. Any third-party package that requires network behavior or external services is disallowed.

## Development Workflow

- PRs MUST include tests for new behavior and pass CI checks that include static analysis (Dart analyzer / linter) and widget tests.
- PRs that change storage formats or on-disk schemas MUST include a migration plan and automated tests that validate data compatibility.
- Accessibility requirements must be validated (semantics tree checks or manual verification) before merging UI changes.

## Governance

- Amendments: Proposals to change the constitution MUST be submitted as a PR that describes the change, rationale, and migration steps. Changes that add or remove NON-NEGOTIABLE principles are MAJOR and require consensus from project maintainers.
- Compliance: All PRs are responsible for documenting how changes adhere to this constitution. CI checks should assert automated parts (tests, analyzer); reviewers validate subjective parts (UX, safety).

**Version**: 1.0.0 | **Ratified**: 2025-12-15 | **Last Amended**: 2025-12-15
