---
name: test-executor
description: Choose, run, and interpret project tests and coverage. Use after code changes, before commits or releases, when the user asks to test, check coverage, diagnose failing tests, or verify Go, TypeScript, Bun, Node, Rust, Python, or project-specific test commands.
---

# Test Executor

Use this skill to verify changes with the smallest meaningful test set first, then expand when shared behavior is touched.

## Command Selection

Prefer project-defined commands over defaults. Read relevant files before choosing:

- `package.json`, `bun.lock`, `deno.json`, `vite.config.*`, `vitest.config.*`
- `go.mod`, `Makefile`, `Taskfile.yml`
- `Cargo.toml`
- `pyproject.toml`, `uv.lock`
- `README.md`, `AGENTS.md`, CI workflows

Common defaults when the project has no better command:

| Project | Command |
|---------|---------|
| Go | `go test ./...` |
| Go coverage | `go test ./... -coverprofile=coverage.out -covermode=atomic` then `go tool cover -func=coverage.out` |
| Bun | `bun test` or documented script |
| Vitest/Jest | project `test` script |
| Rust | `cargo test` |
| Python | `uv run pytest` when the project uses uv |

Coverage target defaults to 80% only when the project has no explicit threshold.

## Execution Rules

- Run focused tests for narrow changes.
- Run full test suites for shared behavior, releases, or cross-cutting changes.
- Run benchmarks only when explicitly requested.
- If a command fails due to missing dependencies or sandbox/network restrictions, report the blocker and request escalation only when needed to complete the user's task.
- Do not hide failing tests behind a success summary.

## Failure Analysis

When tests fail:

1. Separate compile/type errors from assertion failures and environment failures.
2. Identify the root cause, not just the first error line.
3. Check whether the test expectation or implementation is wrong.
4. Suggest or add a regression test when fixing a bug.

## Report Shape

Include:

- Command run.
- Pass/fail result.
- Coverage when collected.
- Failing tests and root cause.
- What was not run and residual risk.
