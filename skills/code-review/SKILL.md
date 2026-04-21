---
name: code-review
description: Review code changes with a reusable baseline checklist and optional project-specific overlays. Use when the user asks for a code review, PR review, diff review, staged change review, regression review, or wants findings prioritized before summaries.
---

# Code Review

Use this skill to review changes as a reviewer, not as an implementer. Prioritize bugs, regressions, security risks, data loss, and missing tests over style comments.

## Workflow

1. Inspect the working tree:
   - Run `git status --short`.
   - Review the relevant diff with `git diff`, `git diff --cached`, or the PR diff if the user asks for a PR review.
   - Do not modify files unless the user explicitly asks for fixes.

2. Load project overlays when present:
   - Read `.agents/review.md` if it exists.
   - Read `.agents/AGENTS.md` when the review touches project-specific workflows, data, deployment, ML, or operational behavior.
   - Treat overlays as additional review constraints, not replacements for the baseline checklist.

3. Apply the baseline checklist:
   - Read `references/checklist.md`.
   - For severity and output shape, read `references/output-format.md`.

4. Verify selectively:
   - Prefer targeted inspection and small commands over broad, expensive test runs.
   - If tests are important but not run, state that clearly as residual risk.

## Review Priorities

- Findings first, ordered by severity.
- Include file and line references for each finding when possible.
- Explain the concrete failure mode and why it matters.
- Avoid speculative issues. If something is a question or assumption, label it separately.
- If no serious issues are found, say so and mention remaining test gaps or residual risk.

## Project Overlay Convention

Projects can add a lightweight overlay at `.agents/review.md`:

```md
# Review Notes

## Always Check

- Project-specific invariant
- Deployment or data safety risk

## Verification

- Area: command to run
```

Use the overlay only when it exists. Do not require every project to have one.
