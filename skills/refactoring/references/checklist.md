# Refactoring Checklist

Use this checklist selectively. Report or act on concrete risks only.

## Behavior Preservation

- Public entry points still accept the same inputs and return the same shape.
- Defaults, optional arguments, environment variables, and config precedence are unchanged.
- Error types/messages remain compatible when callers or tests depend on them.
- Ordering, sorting, grouping, timestamps, locale, and rounding behavior are unchanged.
- Empty, null, missing, duplicate, and boundary inputs follow the old behavior.

## Data and State

- Persistence formats, migrations, cache keys, generated files, and schemas remain compatible.
- Refactored writes stay atomic and idempotent where they were before.
- Cleanup paths do not delete or overwrite unrelated user data.
- Serialization and deserialization preserve field names, types, and omitted/null distinctions.

## Dependency Boundaries

- Callers are updated consistently, including scripts, tests, docs, and dynamic imports.
- New helpers do not introduce cycles or broaden module responsibilities.
- Shared abstractions do not force unrelated domains into one interface.
- Existing extension points, plugin contracts, CLI flags, and API wrappers remain stable.

## Concurrency and I/O

- Parallelization preserves ordering requirements and failure behavior.
- Retries, locks, transactions, and partial-failure cleanup are still correct.
- File paths remain environment-independent and are resolved relative to project roots or config.
- External commands remain quoted/structured and do not add injection risk.

## Tests and Verification

- Characterization tests cover behavior before risky extraction or rewrite.
- Boundary tests cover +/-1, empty input, missing fields, and invalid data when relevant.
- Focused tests cover moved helpers and changed call paths.
- Broader integration tests run when public workflows, persistence, or scheduling changes.
- If verification cannot be run, state the exact residual risk.

## Refactor Smells

- The new abstraction has only one caller and no clear invariant.
- The refactor mixes formatting, movement, behavior changes, and feature work in one patch.
- A helper hides important domain rules behind generic names.
- A move requires many unrelated imports to cross ownership boundaries.
- The change reduces line count but makes failure modes harder to inspect.
