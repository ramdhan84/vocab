# UX Design Addendum: Kids Vocab Game

Date: 2025-12-15  
Feature: 001-kids-vocab-game

## Visual Design (Play Mode)
- Backgrounds: soft, high-contrast pastel themes; subtle animated elements (e.g., floating shapes) capped at 30fps to reduce motion sickness.
- Composition: large central image (min 60% width), word label below with high contrast (WCAG AA), and primary controls (Speak, Listen, Next) as large buttons (min 56dp touch targets).
- Animations: non-punitive feedback animations (green glow for correct, gentle wobble for retry); reduced-motion mode disables animations.

## Sound Design
- Sound types: short positive chimes for correct; soft neutral tones for incorrect; optional background loop kept under -20 LUFS.
- Volume ranges: defaults at 70% music, 80% SFX; parental controls range 0–100 with global mute.
- Playback rules: feedback sounds play once per evaluation; respect global mute and reduced motion; no auto-play speech without user action.

## Onboarding & Guidance
- First-run: select/create profile, brief tutorial with 3 steps (add a word, play, listen button).
- In-game guidance: tooltip-style hints for low-confidence ASR suggesting typed fallback; clear mic-permission prompts with kid-friendly language.

## Parental Area UX
- Access gate: long-press on settings icon + simple math gate (e.g., 3 + 4 = ?).
- Features: data export/import (JSON + assets), reset data, difficulty (easy/medium/hard), enable optional online augmentation (off by default), reduced-motion toggle.

## Accessibility
- Semantics: all interactive controls have labels; images have descriptive alt text; focus order is logical.
- Contrast: minimum WCAG AA for text over backgrounds.
- Touch targets: min 56dp, spacing 8–12dp.
- Screen reader: announce word, image caption, and controls; avoid repetitive announcements.

## Performance Budgets
- Frame rate: target 60fps on modern devices; animations capped at 30fps when reduced-motion enabled.
- ASR/TTS latency: UI response within 300ms, ASR evaluation <2s typical.

## Device Form Factors
- Layout adjusts for phones/tablets: grid list on tablets; single-column on phones.
- Minimum targets: phone 360dp width; tablet 600dp+ width.

## Fallback Behaviors
- No mic permission or ASR: typed answer flow with clear messaging; disable Speak button gracefully.
- Missing/invalid image: show fallback illustration and prompt to reselect or delete.
- TTS unavailable or audio file corrupted: display message and allow manual listen retry.

## Asset Licensing & Moderation
- Bundled assets: project-owned or CC BY assets with attribution in `assets/ATTRIBUTION.md`.
- User uploads: guidance to avoid identifiable photos; moderation tips in parental area.
