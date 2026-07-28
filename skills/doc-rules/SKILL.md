---
name: doc-rules
description: "Apply documentation rules for structure, length, style, how-to writing, and code comments. Use when Codex creates, updates, or reviews README, AGENTS.md, setup or how-to docs, knowledge entries, release notes, user-facing technical prose, and code comments; after implementation leaves docs stale; or when prose needs tightening."
---

# Documentation Rules

## Inclusion gate

Cutting text after it exists rarely works. Every written line looks defensible on its own, and only the person removing it has to justify the change, so text stays. Put each item through this gate before writing it.

- State in one sentence what the reader would get wrong without this line. If you cannot, do not write it.
- Keep it only if it changes what the reader does next. Drop background, history, and the reasoning you went through.
- Do not restate what the code, types, config files, or `git log` already say.
- Write what the reader needs, not what you learned while working. A document is not a work log.

## Standards

### README.md

- Prefer 150 lines or fewer unless the project genuinely needs more.
- Describe the current state only. Keep timelines and change history elsewhere.
- Use CI badges for changing metrics instead of hardcoding them.
- Include Overview, Tech stack, Setup, Structure, Features, Dev commands, and License when applicable.
- Remove detailed explanations of standard tools and unused platform information.

### AGENTS.md

- Write prescriptive rules that describe the intended state.
- Put development rules in AGENTS.md and usage instructions in README.
- Store only rules that are easy to forget and needed every session.
- Put variable state and chronological reasoning in memory or journals.

### Code comments

- Go public functions and types need comments that begin with the identifier name and explain why.
- TypeScript public APIs may use JSDoc when types do not explain usage.
- Describe current behavior only. Keep only actionable TODO or FIXME comments.

### Knowledge entries

- Coordinate with `knowledge-manager`.
- Keep entries concise and reusable.
- Update the relevant INDEX.md when adding, renaming, or deleting an entry.

## Workflow

Apply structure first, then style. Fix what the document says and where it lives before refining how it sounds.

1. **Identify the target**: Read the relevant code, scripts, existing documentation, and project AGENTS.md.
2. **Structure**: Update the smallest necessary documentation surface. Fix length, stale timelines, hardcoded changing values, section order, duplicated content, placement, and terminology.
3. **Style**: Read the detection patterns and apply matching fixes.

   [Detection patterns](references/patterns.md)

4. **Apply or report**: If asked for review only, list concrete issues. If asked to edit, rewrite directly. Preserve Markdown links, code blocks, commands, frontmatter, and tables unless they are the target.
5. **QA**: Validate code alignment, links, commands, examples, and file paths when practical.

## Decision criteria

- When unsure whether to write text, leave it out. When unsure whether existing text is necessary, remove it. Add it later only when a reader needs it.
- Do not prescribe the target, the reader, or where work happens. This applies to every document type.
- Prefer concrete nouns and verbs. Remove adjectives and adverbs that add no mechanism or fact.
- Preserve the author's intent when changing wording.
- Do not document unsupported behavior.
