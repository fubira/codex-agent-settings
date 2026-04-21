# Baseline Review Checklist

Use this checklist to find material issues. Do not report every item; report only concrete risks in the reviewed change.

## Correctness

- Check changed branches, boundary values, null/empty inputs, parsing failures, and error paths.
- Look for mismatches between caller expectations and callee behavior.
- Check public API or CLI contract changes for compatibility.

## Regression Risk

- Compare old and new behavior in touched paths.
- Look for removed safeguards, changed defaults, broadened side effects, or skipped validation.
- Check whether generated outputs, migrations, or state transitions remain backward compatible.

## Security and Data Safety

- Check for injection, unsafe shell execution, path traversal, secret exposure, and permission bypass.
- Treat destructive operations, migrations, deletes, overwrites, and external writes as high risk.
- Verify dry-run, confirmation, idempotency, and rollback behavior when relevant.

## Concurrency and Idempotency

- Check retries, duplicate execution, partial failure, race conditions, locking, and atomic writes.
- Confirm scheduled jobs and background tasks can run safely more than once.

## Error Handling and Observability

- Check that failures are surfaced with actionable messages.
- Avoid swallowed errors, misleading logs, and success states after partial failure.
- Verify cleanup paths do not hide the original failure.

## Tests

- Match test depth to risk.
- Look for missing edge-case tests around changed logic.
- Do not require tests for trivial docs or formatting-only changes.
- Prefer testing self-authored logic, not third-party library behavior.

## Maintainability

- Flag only maintainability issues that create real risk: confusing ownership, duplicated business rules, over-broad abstractions, or hidden coupling.
- Avoid style-only comments unless style affects correctness or readability materially.

## Performance

- Check obvious N+1 work, unbounded loops, repeated I/O, large memory loads, and synchronous bottlenecks on hot paths.
- Report performance concerns only when the changed path plausibly matters.
