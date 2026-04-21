---
name: git-commit-assistant
description: Prepare safe Git commits. Use when Codex is asked to commit, stage files, write a commit message, inspect .gitignore, push commit-ready changes, or decide which changed files should be included while avoiding secrets, local settings, generated artifacts, and unrelated user changes.
---

# Git Commit Assistant

Use this skill to create careful commits without accidentally staging sensitive or unrelated files.

## Workflow

1. Inspect repository state:
   - Run `git status --short` and `git branch --show-current`.
   - Read `.gitignore` when untracked files or local configuration are involved.
   - Inspect staged and unstaged diffs before committing.

2. Classify files:
   - Never commit secrets: `*.key`, `*.pem`, `*credentials*`, `*secret*`, `*password*`, `.env*`, auth tokens, API keys.
   - Never commit local tool state: `.claude.json`, `.mcp.json*`, `settings.json`, `settings.local.json`, IDE state, sessions, logs, caches, SQLite runtime state.
   - Avoid generated artifacts unless the project explicitly tracks them: `node_modules/`, `dist/`, `build/`, `coverage/`, `vendor/`, `*.log`, `*.cache`.
   - Usually safe: source, tests, docs, shared config, workflows, `AGENTS.md`, tracked Codex skills, and Obsidian knowledge entries intentionally edited for the task.
   - Ask before including large files, executables, new directories with unclear purpose, or unrelated user changes.

3. Scan for sensitive content before commit:
   - Look for credential-like strings, password assignments, private keys, tokens, and URLs with embedded credentials.
   - If a secret appears in the diff, stop and report the exact file and risk. Do not commit it.

4. Stage narrowly:
   - Stage only files that belong to the requested change.
   - If unrelated changes exist, leave them unstaged and mention them.
   - Do not revert user changes.

5. Write a Conventional Commit:
   - Subject format: `<type>(<scope>): <subject>`.
   - Keep the subject concise and imperative.
   - Body explains what changed and why; avoid file-by-file lists.
   - Use no emoji.

6. Commit and verify:
   - Use non-interactive `git commit`.
   - Run `git status --short` after commit.
   - Push only when the user requested it or approves it.

## Error Handling

| Situation | Action |
|-----------|--------|
| Nothing to commit | Say so and show remaining status if any. |
| Merge conflict | Stop and list conflicted files. |
| Detached HEAD | Ask before creating a branch. |
| Pre-commit hook failure | Report the failing command and fix only task-related issues. |
| Unclear file ownership | Ask before staging. |
