---
name: prose-linter
description: "Review and rewrite prose to remove AI-like tone, vague marketing language, verbosity, and self-congratulatory phrasing. Use after documentation, README, AGENTS.md, PR text, knowledge entries, release notes, or user-facing technical prose is created or when the user asks to polish, tighten, or make writing more natural."
---

# Prose Linter

Use this skill for wording only. Preserve the author's meaning and the document structure unless a sentence can simply be deleted.

## Review Rules

- Prefer concrete nouns and verbs over broad adjectives.
- Delete claims that cannot be made specific.
- Remove repeated setup, self-evident explanations, and introductions that only restate the heading.
- Keep developer docs direct; avoid product-marketing tone.
- Do not change technical meaning to make prose sound better.

## Common Fixes

| Pattern | Fix |
|---------|-----|
| "効率的に活用", "最適化", "体系的に管理" | Say what changes concretely, or delete. |
| "シームレス", "堅牢", "高度な" | Delete unless backed by a specific mechanism. |
| "提供する", "実現する" with tool as subject | Rewrite as a direct capability or user action. |
| "することができます", "可能です" | Use "できる". |
| "を行う", "の実施" | Use the direct verb. |
| Long numbered breakdown for one idea | Collapse to one sentence. |

## Workflow

1. Identify the prose files changed or requested.
2. List concrete wording issues when the user asked for review only.
3. Rewrite directly when the user asked to fix or polish.
4. Keep Markdown links, code blocks, command snippets, frontmatter, and table structure intact unless they are the target.
5. For document files, write in document mode. For chat summaries, use the normal conversational style.

## Boundary With Doc Maintainer

Use `doc-maintainer` for missing sections, stale facts, README length, broken examples, and documentation placement. Use this skill for wording and concision.
