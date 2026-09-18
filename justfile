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

fmt:
    {{python}} scripts/project.py fmt

test:
    {{python}} scripts/project.py test

corrections:
    {{python}} scripts/project.py corrections

# Explicitly update the library copy; ordinary builds do not publish.
publish:
    {{python}} scripts/project.py publish

clean:
    {{python}} scripts/project.py clean

# Optional bounded proofs; generic runner lives in the shared OCR project.
check-lean:
    #!/usr/bin/env bash
    set -euo pipefail
    book_ocr_dir="${BOOK_OCR:-../../book-ocr}"
    mkdir -p build/.cache
    lean_result=$(mktemp -d build/.cache/lean-XXXXXX)
    rmdir "$lean_result"
    {{python}} "$book_ocr_dir/scripts/check_lean_proofs.py" --project . --manifest checks/lean/bindings.json --output "$lean_result"
