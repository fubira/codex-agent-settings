---
name: doc-maintainer
description: "Maintain concise, accurate project documentation. Use when Codex creates or updates README, AGENTS.md, docs, code comments, knowledge entries, setup instructions, CLI references, or when implementation changes require documentation to stay aligned with current behavior."
---

# Doc Maintainer

Use this skill to keep documentation current, short, and useful to developers.

## Workflow

1. Read the relevant code, scripts, and existing docs before editing documentation.
2. Identify what changed and what readers need to know now.
3. Update the smallest necessary doc surface.
4. Remove stale timeline language, obsolete decisions, hardcoded dynamic metrics, and duplicated explanations.
5. Validate commands, links, examples, and file paths when practical.
6. Run `prose-linter` after larger prose edits when the wording may be verbose or AI-like.

## Standards

### README

- Prefer 150 lines or fewer unless the project genuinely needs more.
- Describe current state only; changelogs belong elsewhere.
- Use CI badges for dynamic status rather than hardcoding changing numbers.
- Typical sections: Overview, Tech stack, Setup, Structure, Features, Dev commands, License.
- Skip long explanations of standard tools unless project-specific behavior matters.

### AGENTS.md

- Store rules that are easy to forget and needed every session.
- Do not duplicate implementation details that code reveals.
- Put variable state, current strategy parameters, and pending decisions in memory or journals.
- Keep tool-specific command references precise.

### Code Comments

- Explain why or non-obvious behavior, not what the code plainly says.
- Go public exported identifiers need comments when project conventions require them.
- TypeScript public APIs may use JSDoc when types alone do not explain usage.
- Comments describe current behavior only; history belongs in Git.

### Knowledge Entries

- Coordinate with `knowledge-manager`.
- Keep entries concise and reusable.
- Update the relevant `INDEX.md` with the entry.

## Boundaries

- Structure, accuracy, and completeness belong here.
- Tone, verbosity, and AI-like phrasing belong to `prose-linter`.
- Do not invent documentation for unsupported features.
