ASR Test Harness and Corpus

Purpose: Define the seeded audio corpus and verification harness used to validate on-device ASR correctness per SC-002.

Contents:

- `corpus/` - directory of recorded spoken samples, organized by device family and word
- `README.md` - this file describing corpus provenance, license, and how to run tests
- `run_asr_tests.sh` - script (or platform-specific runner) that plays samples to the ASR and records outputs for evaluation

Acceptance: The harness must be runnable on CI devices or on-device test rigs and produce a report that indicates per-device accuracy and confidence thresholds. Tests are to be automated where possible; where device-dependent behavior cannot be automated, include reproducible instructions for manual verification.
