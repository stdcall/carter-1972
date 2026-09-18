# Carter · Simple Groups of Lie Type (1972)

Complete digital setting in Typst: all sixteen chapters, the preface,
bibliography, notation index and subject index. Mathematics and tables are
native Typst; diagrams are CeTZ 0.5.2.

## Build

Use Typst 0.15.1, Typstyle 0.15.1, Tinymist 0.15.8 and Python 3.14 (managed by uv).
The exact tool versions are recorded in `config/project.json`. On macOS the
three Typst tools are available through Homebrew. Install Python dependencies
from `uv.lock`:

```sh
uv sync --locked
just check
```

With dependencies already installed, use `just build`. Without `just`, the main
commands are also available as `uv run --locked python scripts/project.py COMMAND`.

| Command | Result |
|---|---|
| `just build` | Validated `build/carter-1972.pdf`; no-op for unchanged inputs |
| `just corrections` | `build/carter-1972.corrections.pdf` |
| `just check` | Format, lint, links, layout, tests and both PDFs |
| `just fmt` | Typstyle formatting, using the editor's configuration |
| `just lint` | Read-only formatter and integrity checks |
| `just test` | Regression tests without rebuilding the whole book |
| `just publish` | Explicitly update the owner's library copy, with a backup |
| `just clean` | Remove `build/`; no source files or library files are touched |

Fonts and their licences are included. The first build downloads the pinned
CeTZ package through Typst's ordinary package cache. Building the accepted
book requires no scans, OCR, local language models, Sage or Lean.

## VS Code

Open this directory as the workspace and accept the recommended **Tinymist**,
**EditorConfig** and **PDF Viewer** extensions. Tinymist includes Typstyle;
a second formatting extension is unnecessary.

Run `just build` once after a fresh checkout. `content/main.typ` is
configured as the entry through `tinymist.typstExtraArgs`. Tinymist supplies
live preview, source/preview synchronization, lint on save and formatting.
Use its preview button in `content/main.typ` for interactive editing.

**Run Build Task** (`Cmd+Shift+B`) runs **Carter: PDF**. It uses Tinymist's
native `type: typst`, `command: export` task, then checks the exported PDF and
normalizes bookmark destinations to preserve the reader's zoom. PDF tags are
explicitly enabled in the export task. A failed or missing export cannot
replace the checked PDF. The plugin's save-time exports stay in `build/.cache`.

The task configuration follows the [Tinymist export documentation](https://myriad-dreamin.github.io/tinymist/feature/export.html).
Entry selection follows the [extension's multi-file guidance](https://github.com/Myriad-Dreamin/tinymist/blob/v0.15.8/editors/vscode/README.md).
The final PDF preserves accessibility tags, embedded fonts and navigation.
No additional object-stream packing is applied.

## Configuration

- `.vscode/settings.json`: Typstyle policy (80 columns, two-space indentation,
  prose wrapping), Tinymist, editor and font settings.
- `.editorconfig`: matching whitespace and encoding conventions.
- `config/lint.json`: book-specific integrity rules and documented exceptions.
- `config/page-layout.json`: page-gap review thresholds.
- `config/page-layout-exceptions.json`: accepted layout exceptions bound to content.
- `config/project.json`: entry, output paths and tool versions.
- `pyproject.toml`, `uv.lock`, `.python-version`: Python dependencies and runtime.

Typstyle 0.15.1 has [no native configuration-file option](https://typstyle-rs.github.io/typstyle/cli-usage.html).
The command adapter reads the real Tinymist workspace settings and translates
those values to CLI arguments; formatting policy is not duplicated in scripts.

## Source layout

- `content/main.typ`, `content/main-defs.typ`: reading order, typography and
  reference helpers.
- `content/00-…` through `16-…`: preface and one file per numbered chapter.
  Files `90-…`, `91-…`, `92-…` are bibliography and indexes. Diagram sources
  live in `content/diagrams/`; publication details in `content/frontmatter/`.
- `references.bib`: Unicode BibLaTeX, 255 records covering 243 original items.
- `corrections.json`: complete original/corrected readings and justifications.
  `content/corrections.typ`: readable list of all 97 entries, plus the Tits [22]
  bibliographic update. Its exported `correction-list()` can be reused in an
  appendix. The book does not yet include that appendix.
- `data/`: source-page coverage, bibliography/index inventories, and the
  structure-constant data used to typeset the G₂ table. These are retained source data.
- `assets/`: seven font files with licences and the vector cover; no scans.
- `scripts/`: active build, bibliography, lint, PDF and publication checks.
- `checks/`: three selected Lean files, their bindings and regression tests for the
  book infrastructure. Historical run logs are not kept in the repository.
- `build/`: the only generated directory, excluded from Git.

The original DjVu remains beside the PDF in the library. A scan backup and a
compact pre-cleanup recovery archive are outside this repository in
`../.archive/carter-1972/`. `source.json` records source identity and the
local library destination. Historical paths in editorial records refer to that
recovery archive. Literature comparisons are in `checks/literature.json`.

## Edition conventions

Body text is 12 pt Libertinus Serif with 1.1 em paragraph spacing and 0.68 em
leading; the proof-ending square is 11 pt. Links keep the body colour, with
only reference numbers in semibold. Descriptive links stay visually ordinary.
Original statement numbers are retained; internal page references use the
new pagination. Labels use typed prefixes such as `eq:`, `th:`, `l:`, `p:`,
`fig:`, `ch:` and `sec:`. Bibliographic numbers restart within author groups.

Index links to definitions begin with their introductory text. Locators without
a semantic definition anchor retain the complete relocated source-page range.
Index destinations include extra room above the line for mathematical glyphs.

For floating figures, the physical inner block carries the label. The build
checks actual link destinations. The `mathclap` helper is intended only for
single-line limits. Mathematical readings and correction bindings must be
reviewed after substantive edits; formatting is not permission to reword them.

## Mathematical checks retained in the repository

Three Lean files check four declarations: exact correspondences between
Carter's formulas and mathlib in §§4.3.1 and 9.3.2, and the nonsquare argument
in §13.7.4. Their precise hypotheses and scope are recorded in
`checks/lean/bindings.json`. No surrounding chapter is claimed as fully
formalized. Run `just check-lean` with the existing shared `book-ocr` runner
and pinned mathlib checkout; no installation occurs.

Elementary auxiliary proofs were removed after an audit. Book-specific Sage
scenarios were also removed after acceptance; reusable code belongs in the
parent digitization tools, not in this repository. [The check index](checks/README.md)
explains what remains. Neither Sage nor Lean is required for PDF CI.

## GitHub

CI runs format/lint checks, regression tests, both builds and PDF navigation
and layout checks. Tool downloads are versioned and checksum-verified.
Successful builds upload both PDFs as workflow artifacts. A `v*` tag runs the
same checks and publishes the PDFs in a GitHub release.

This is a personal-library transcription of Carter's book, not a new licence
for the original text. Original publication details are retained in the book;
font licences are included with the fonts.
