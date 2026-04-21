---
name: release
description: General release and deployment workflow for software projects. Use when the user asks to release, deploy, cut a release, bump version, commit release changes, push, tag, or verify CI/CD. The default flow is discover project commands, run lint/test checks, commit, push, create the final release tag, then let CI deploy automatically.
---

# Release

## Default Model

Treat "release" and "deploy" as the same standard workflow unless the project says otherwise:

1. Discover the project's release rules and quality commands.
2. Run lint, typecheck, tests, and any project-required checks.
3. Update version metadata if needed.
4. Commit the intended release changes.
5. Push the branch.
6. Create and push the release tag last.
7. Verify CI/CD started and report deployment status.

The release tag is the final trigger. Assume CI runs from the pushed tag and performs deployment automatically.

## Discover Project Rules

Before acting, read local guidance and scripts:

```bash
git status --short
git branch --show-current
find .. -name AGENTS.md -print
sed -n '1,220p' AGENTS.md 2>/dev/null || true
sed -n '1,220p' .agents/AGENTS.md 2>/dev/null || true
sed -n '1,140p' package.json 2>/dev/null || true
sed -n '1,180p' README.md 2>/dev/null || true
```

Also inspect language-specific manifests when present, such as `go.mod`, `Cargo.toml`, `pyproject.toml`, `deno.json`, `bunfig.toml`, `.github/workflows/*`, or release documentation under `docs/`.

If project instructions conflict with this skill, follow the project instructions and mention the difference.

## Quality Gates

Prefer project-defined commands over assumptions:

- JavaScript/TypeScript: use `package.json` scripts such as `lint`, `typecheck`, `test`, `build`.
- Go: use `go test ./...` and configured lint commands if documented.
- Python: use project scripts or `uv run pytest` / equivalent when documented.
- Rust: use `cargo test` and `cargo clippy` when configured.

Run the smallest complete set that the project treats as release-blocking. If a command is unavailable, do not invent a replacement silently; report what was missing and use the nearest documented alternative.

## Versioning

If the user specifies a version, use it. Otherwise infer the next version only when the project has a clear convention.

Common metadata files:

- `package.json`
- `pyproject.toml`
- `Cargo.toml`
- `go.mod` plus release notes or tags
- app-specific version files

Make the release tag match the version exactly according to project convention, usually `vX.Y.Z`. Do not push a tag that disagrees with version metadata.

## Commit And Push

Use Conventional Commits unless the project specifies another style. Default release commit:

```bash
git add <release files>
git commit -m "chore: release vX.Y.Z"
git push origin <branch>
git tag vX.Y.Z
git push origin vX.Y.Z
```

Push the branch before the tag. Create and push the tag last so CI sees the committed release state.

If there are unrelated user changes, do not include them without approval. If the release includes existing staged changes, inspect them before committing.

## Verification

After pushing the tag, verify CI/CD if tools are available:

```bash
gh run list --limit 10
gh run watch
```

If the repository does not use GitHub Actions, inspect the documented CI provider or report that local CI verification is unavailable.

Do not manually deploy or restart production services unless the project release docs or the user explicitly asks. The default expectation is tag-triggered CI deploy.

## Safety Rules

- Do not skip lint/tests unless the user explicitly overrides.
- Do not use destructive git commands.
- Do not rewrite published tags unless the user explicitly requests and understands the impact.
- Do not mix unrelated refactors or feature work into a release commit.
- Report exact commands run and whether each passed, failed, or was skipped.
