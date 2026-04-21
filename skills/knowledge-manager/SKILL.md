---
name: knowledge-manager
description: "Manage the shared Obsidian AI_KNOWLEDGE base. Use when Codex needs to retrieve reusable knowledge before work, record a reusable solution after solving a non-obvious problem, add or update best practices, patterns, troubleshooting notes, workflows, or keep category INDEX.md files aligned without bloating AGENTS.md or memory."
---

# Knowledge Manager

Use this skill to read from or write to the shared cross-agent knowledge base without loading everything into context.

## Source Of Truth

The shared knowledge base lives at:

`/mnt/c/Users/matsushita/obsidian/notes/RESOURCES/AI_KNOWLEDGE/`

Treat any `~/.claude/knowledge/` copy as a mirror or legacy reference unless the user explicitly says otherwise. Prefer the Obsidian path for both retrieval and updates.

## Retrieval

1. Identify the likely category from the task:
   - `best-practices/`: quality, security, testing, process rules.
   - `patterns/`: reusable architecture or implementation patterns.
   - `troubleshooting/`: non-obvious failures and fixes.
   - `workflows/`: release, CI/CD, deployment, and operational procedures.
2. Read only the relevant `INDEX.md` files.
3. Read only the specific entries needed for the task.
4. Cite the local entry path when using knowledge in an answer or implementation rationale.

Do not bulk-load every knowledge file. If no relevant entry exists, proceed from local context and mention that no matching knowledge entry was found when it matters.

## Recording

Record knowledge only when it has durable reuse value. Use this filter:

| Axis | Record When |
|------|-------------|
| Reusability | The same issue or pattern is likely to appear across projects or future sessions. |
| Impact | Forgetting it could cause bugs, wasted time, security risk, or bad architecture. |
| Learning value | The insight was non-obvious, counterintuitive, or required investigation. |

Create or update an entry when at least two axes are medium or high.

Before writing:

1. Read `FRONTMATTER.md`.
2. Read the target category `INDEX.md`.
3. Search for duplicates or near-duplicates in the target category.
4. Present the proposed category, filename, short summary, and why it should be recorded.
5. Get user approval before creating or materially changing a knowledge entry unless the user explicitly asked to write it.

## Entry Style

Keep entries concise, usually under 100 lines. Match the existing style in the target category.

Typical structure:

- Overview: 1-2 sentences.
- Context: when the guidance applies.
- Details: commands, examples, steps, or implementation notes.
- Pitfalls: known failure modes.
- References: related local entries or external primary docs.

Use document mode for file contents: plain `だ・である` style, no conversational suffixes. Avoid history logs and one-off project facts; put those in project memory or journals instead.

## Index Maintenance

When adding, renaming, or deleting an entry:

1. Update the category `INDEX.md` in the same edit set.
2. Keep the table format and category naming consistent.
3. Verify links are relative and point to the new file.
4. Do not use tags containing dots in Obsidian frontmatter.

## Boundaries

- Put project-specific conventions in project `AGENTS.md`, not global knowledge.
- Put variable operational state, current strategy parameters, and pending decisions in memory.
- Put chronological reasoning and experiment logs in Obsidian work journals.
- Keep secrets, credentials, private tokens, and machine-specific paths out of knowledge entries unless the path is an intentional shared location already documented by the user.
