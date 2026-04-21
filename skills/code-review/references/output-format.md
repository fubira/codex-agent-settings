# Review Output Format

Lead with findings. Keep summaries secondary.

## With Findings

Use this shape:

```md
**Findings**
- High: [file](path:line) - Concrete issue and failure mode. Explain the impact and the condition that triggers it.
- Medium: [file](path:line) - Concrete issue and failure mode.

**Open Questions**
- Question or assumption that affects review confidence.

**Notes**
- Tests not run, limited scope, or residual risk.
```

## No Findings

Use this shape:

```md
重大な指摘はありません。

確認範囲: reviewed files or diff scope.
残るリスク: tests not run, integration behavior not exercised, or none.
```

## Severity

- Critical: likely data loss, security compromise, production outage, or irreversible corruption.
- High: clear bug or regression in important user-facing, operational, financial, or data paths.
- Medium: plausible bug, edge-case failure, missing validation, or test gap with meaningful risk.
- Low: minor issue with limited impact. Use sparingly.

## Rules

- Do not bury findings after a long summary.
- Do not include praise or generic commentary.
- Do not report purely hypothetical issues without a concrete trigger.
- Prefer one precise finding over several vague concerns.
