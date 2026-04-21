---
name: context-compactor
description: "Audit and compact context-affecting Codex documents. Use only when explicitly asked to reduce context, compact AGENTS.md, review memory size, audit skill token cost, run /compact-context, or propose safe removals from instructions, skills, and knowledge references."
---

# Context Compactor

Manual-use skill for reducing context size while preserving behavior-critical instructions.

## Workflow

1. Measure:
   - Run `scripts/context-audit.sh [project-dir]` from this skill directory.
   - Identify the largest contributors among AGENTS.md, Codex skills, memory-like files, and referenced knowledge.

2. Analyze:
   - Redundancy: same rule repeated in AGENTS.md, skills, memory, or knowledge.
   - Obsolescence: completed tasks, superseded decisions, old strategy details.
   - Verbosity: explanations that can be shorter without losing instructions.
   - Misplacement: durable rules in memory, timelines in AGENTS.md, reusable knowledge trapped in journals.

3. Propose before editing:

   ```md
   | File | Current | Est. After | Reduction | Change |
   |------|---------|------------|-----------|--------|
   | ... | ... | ... | ... | ... |
   ```

   Explain what will be removed, what will be preserved, and why.

4. Execute only after user approval:
   - Edit approved files only.
   - Preserve meaning and user preferences.
   - Show before/after line counts.
   - Suggest a commit when appropriate.

## Must Preserve

- Personality, language, and output style rules.
- Security, approval, and destructive-operation safeguards.
- Active project conventions and CLI contracts.
- Information that exists nowhere else.

## Safe To Compact

- Duplicate rules kept in a better source of truth.
- Completed or obsolete memory entries.
- Verbose explanations of standard practices.
- Generated boilerplate and repeated examples.

## Boundaries

- Do not delete without showing the removal.
- When unsure, keep the content and mark it as a question.
- Do not auto-activate; context growth is normal.
