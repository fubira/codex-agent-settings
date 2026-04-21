---
name: refactoring
description: Plan, review, or implement behavior-preserving code refactors. Use when Codex is asked to clean up structure, reduce duplication, split modules, improve naming or boundaries, simplify complex code, migrate patterns without feature changes, or assess whether a proposed refactor is safe.
---

# Refactoring

Use this skill to change code structure while preserving observable behavior. Prefer small, verifiable steps over broad rewrites.

## Workflow

1. Establish the behavior boundary:
   - Identify public APIs, CLI contracts, persisted data, generated outputs, and tests that define current behavior.
   - Read callers before moving or changing shared code.
   - Separate pure refactors from feature changes; if both are requested, stage them separately.

2. Find the refactor shape:
   - Look for duplication, mixed responsibilities, hidden coupling, long functions, unclear data flow, and inconsistent abstractions.
   - Prefer existing project patterns and local helpers over new abstractions.
   - Avoid abstraction unless it removes real complexity or protects a repeated invariant.

3. Plan a safe sequence:
   - Keep each edit narrow enough to verify.
   - Move code before changing logic when possible.
   - Preserve names and wrappers temporarily when callers are numerous or external.
   - Update tests alongside the step that changes structure.

4. Implement with behavior guards:
   - Run focused tests before and after high-risk edits when feasible.
   - Use mechanical changes for moves/renames, then semantic cleanup.
   - Watch for subtle behavior drift in defaults, ordering, null handling, errors, logging, and side effects.

5. Verify and report:
   - Run the smallest meaningful lint/test set, expanding only when shared behavior is touched.
   - Summarize what changed structurally, why it is behavior-preserving, and what was verified.

## Decision Rules

- If the request says "review", use a review stance: findings first, with concrete behavior or maintainability risk.
- If the request asks to "refactor" without a plan, make the change directly after reading enough context.
- If the refactor is broad or risky, state a short plan before editing.
- If tests are weak or absent, add characterization tests around current behavior before changing structure.
- If a proposed refactor changes semantics, call that out and either split it into a feature change or ask for confirmation.

## Resources

- Read `references/checklist.md` for refactor hazards and verification targets when the change touches shared code, public behavior, data transformations, concurrency, persistence, or ML/statistical meaning.
