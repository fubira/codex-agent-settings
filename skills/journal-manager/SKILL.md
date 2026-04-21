---
name: journal-manager
description: "Create, organize, and promote Obsidian work journals. Use when Codex should record experiments, analyses, incident responses, comparisons, decisions, or work logs under WORK/{ORG}_{PROJECT}/journal, or when the user asks to review, consolidate, archive, or extract durable knowledge from journals."
---

# Journal Manager

Use this skill to record chronological thinking and decisions in Obsidian without mixing them into AGENTS.md, memory, or reusable knowledge.

## Location

Write journals under:

`/mnt/c/Users/matsushita/obsidian/notes/WORK/{ORG}_{PROJECT}/journal/YYYY-MM-DD_HHmm_topic.md`

Use JST for timestamps. Keep `topic` short and filesystem-safe.

## What To Record

- Experiments and analyses with conditions, results, findings, and next actions.
- Decisions with context, options, judgment, trade-offs, and follow-up.
- Incident responses with situation, root cause, actions, prevention, and lessons.
- Work logs only when they include meaningful decisions or remaining context.

Do not record code diffs, trivial task logs, or durable technical facts better suited to `knowledge-manager`.

## Creation Workflow

1. Determine the project folder under `WORK/`.
2. Pick one topic per file.
3. Preserve numeric tables exactly; do not hand-copy long numeric logs when automatic extraction is available.
4. Write in document mode.
5. If the journal reveals reusable knowledge, propose promoting it through `knowledge-manager`.

## Organization Workflow

For `/journal-review`, `/journal-cleanup`, or similar requests:

1. Review active journal files without editing first.
2. Classify each file:
   - Archive: conclusion reflected elsewhere, superseded, or completed.
   - Consolidate: several files cover the same theme.
   - Defer: future work with concrete resume conditions.
   - Keep: current, sole source, or important incident record.
3. Present a table and wait for approval.
4. After approval, move originals to `archives/`; do not delete them.
5. When consolidating, copy source references and preserve important tables.

## Boundaries

- Journals are chronological reasoning.
- Knowledge entries are reusable guidance.
- Memory is current operational state.
- AGENTS.md is for rules needed every session.
