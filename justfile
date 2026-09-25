# Machine settings such as LEAN_MATHLIB may be kept in a local .env file.
set dotenv-load

python := "uv run --locked python"

default: build

# Validated PDF, with cached no-op when source files have not changed.
build:
    {{python}} scripts/project.py build

# Full CI checks: format, lint, PDF links/layout, tests, corrections PDF.
check:
    {{python}} scripts/project.py check

lint:
    {{python}} scripts/project.py lint

# Prose check: Harper over the sources, minus what it reads as markup.
prose *files:
    {{python}} scripts/prose.py {{ files }}

fmt:
    {{python}} scripts/project.py fmt

test:
    {{python}} scripts/project.py test

corrections:
    {{python}} scripts/project.py corrections

clean:
    {{python}} scripts/project.py clean

# Optional Lean checks of checks/lean/bindings.json, run in a prebuilt mathlib
# checkout of the pinned commit given by LEAN_MATHLIB; nothing is installed.
check-lean:
    {{python}} checks/lean/check_proofs.py
