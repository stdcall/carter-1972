# Contributing

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
| `just prose` | Harper prose check of the sources |
| `just check-lean` | Optional Lean checks (see [Mathematical checks](#mathematical-checks)) |
| `just clean` | Remove `build/`; no source files are touched |

Fonts and their licences are included. The first build downloads the pinned
CeTZ package through Typst's ordinary package cache. Building the book
requires neither Sage nor Lean.

## VS Code

Open this directory as the workspace and accept the recommended **Tinymist**,
**EditorConfig** and **PDF Viewer** extensions. Tinymist includes Typstyle;
a second formatting extension is unnecessary.

Run `just build` once after a fresh checkout. Tinymist supplies live preview,
source/preview synchronization, lint on save and formatting. The book is
previewed from `content/main.typ`; with
`tinymist.projectResolution: "lockDatabase"` a chapter opened in the editor
uses it as its main file. The local `tinymist.lock` is created by
`just check` (or `tinymist compile --save-lock`) and is not in Git.

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
- `config/project.json`: entry, output paths and tool versions.
- `config/prose.json`: the pinned Harper version.
- `pyproject.toml`, `uv.lock`, `.python-version`: Python dependencies and runtime.

`just check` writes an advisory page-gap report to
`build/.cache/whitespace-report.json`. Large gaps need visual judgment and do
not fail the build; there are no saved approvals tied to a particular layout.

Typstyle 0.15.1 has [no native configuration-file option](https://typstyle-rs.github.io/typstyle/cli-usage.html).
The command adapter reads the real Tinymist workspace settings and translates
those values to CLI arguments; formatting policy is not duplicated in scripts.

## Source layout

- `content/main.typ`, `content/main-defs.typ`: reading order, typography and
  reference helpers.
- `content/statements.typ`: semantic theorem, lemma, proposition, corollary,
  definition, example and proof blocks; shared numbering and presentation.
- `content/00-…` through `16-…`: preface and one file per numbered chapter;
  `17-supplement.typ` is the Supplement added in 1989.
  Files `90-…`, `91-…`, `92-…` are bibliography and indexes. Diagram sources
  live in `content/diagrams/`; publication details in `content/frontmatter/`.
- `references.bib`: Unicode BibLaTeX, 255 records covering 243 original items.
- `corrections.json`: complete original/corrected readings and justifications.
  `content/corrections.typ`: readable list of all 100 entries, the Tits [22]
  bibliographic update and the comparison with the 1989 reprint. Its exported
  `correction-list()` can also be used as an appendix.
- `data/`: source-page coverage, bibliography/index inventories, and the
  structure-constant data used to typeset the G₂ table.
- `assets/`: seven font files with licences and two vector covers: the 1989
  cover used by the book (source `figures/cover-1989.typ`) and the original
  1972 cover (`figures/cover.svg`).
- `scripts/`: build, bibliography, lint, prose and PDF checks.
- `checks/`: three Lean files with their bindings and runner, the literature
  comparisons and regression tests for the book infrastructure.
- `build/`: the only generated directory, excluded from Git.

`#source(n, "p")` marks where printed page `p` of the original begins. These
anchors serve internal page references (`#source-page-ref("p")`) and the
index locators. `n` is the page's sequence number in the original volume,
printed page + 13 in the main text; `data/source-pages.json` lists the pages
of each file, and the bibliography and correction records use the same
numbering.

## Editing the book

Use semantic labels at the target itself: `#theorem[... ] <th:root-system>`
or `== Root systems <sec:root-systems>`. Refer to them with `@th:root-system`
or `@sec:root-systems[descriptive text]`; in mathematics use `#[@eq:target]`.
Do not create a target label inside a helper: the editor would jump to the
helper instead of the passage. Keep reference styling in the book style.
Numbers come from counters, not from the label name or reference text.

Bibliographic keys use the first author's surname and publication year,
for example `Humphreys1990`; add `a`, `b` for works from the same year.
Preserve existing keys when reordering entries.

Run `just check` before a pull request. It checks the PDF and uses Tinymist
to verify that native references jump to literal labels, including across
chapter files, and that label completion works. The check also registers
`content/main.typ` as the editor entry point; the generated `tinymist.lock`
remains local. Reference changes should preserve the printed numbering.

A custom caption belongs in the reference, for example
`@eq:commutator-case-i[(i)]`. For a subpart after an automatically computed
statement number, use `@def:root-system-v[#ref-suffix[ (v)]]`.

Both indexes are generated from inline marks. Subject entries use `#ix`.
A notation mark supplies its key, symbol and meaning where it is defined:
`#nx("A", [$A$], group: "latin-a")[The rational group algebra of $e(Q)$]`.
Use distinct keys for distinct meanings of the same symbol. Repeated marks
share the same description and combine their current pages. `locator: false`
retains a dash for the basic symbols that the author did not locate.

Notation groups follow the Latin and Greek alphabets; `after: "other-key"`
preserves the author's order of related symbols within a group. Optional
`definition: [@def:target]` identifies an introduction checked by the build.
Keep entries beside the text; the index files only render the collected marks.
The inventories under `data/` document the edition for checks and
are not another source of index entries.

## Edition conventions

Body text is 12 pt Libertinus Serif with 1.1 em paragraph spacing and 0.68 em
leading; the proof-ending square is 11 pt. Links keep the body colour, with
only reference numbers in semibold. Descriptive links stay visually ordinary.
Statement and subsection numbers come from a shared counter and match the
original while the content is unchanged; internal page references use the
new pagination. Labels use typed prefixes such as `eq:`, `th:`, `l:`, `p:`,
`fig:`, `ch:` and `sec:`. Bibliographic numbers restart within author groups.

Index links to definitions begin with their introductory text. Locators without
a semantic definition anchor retain the complete relocated source-page range.
Index destinations include extra room above the line for mathematical glyphs.

For floating figures, the physical inner block carries the label. The build
checks actual link destinations. The `mathclap` helper is intended only for
single-line limits. Mathematical readings and correction bindings must be
reviewed after substantive edits; formatting is not permission to reword them.

## Mathematical checks

Three Lean files check four declarations: exact correspondences between
Carter's formulas and mathlib in §§4.3.1 and 9.3.2, and the nonsquare argument
in §13.7.4. Their precise hypotheses and scope are recorded in
`checks/lean/bindings.json`. No surrounding chapter is claimed as fully
formalized. Run `just check-lean` with `LEAN_MATHLIB` set to a prebuilt
mathlib checkout of the pinned commit; such machine settings may be kept in a
local `.env` file, which `just` reads. Nothing is installed or built. Neither
Sage nor Lean is required for the PDF build or CI. [The check index](checks/README.md)
describes the Lean files and the literature comparisons.

## GitHub

CI runs format/lint checks, regression tests, both builds and PDF navigation
and layout checks, and the prose check. Tool downloads are versioned and
checksum-verified. Successful builds upload both PDFs as workflow artifacts.
Every commit merged into `main` automatically publishes both PDFs in a release
tagged `main-<commit>`, after the required checks pass. Re-running the workflow
updates the same release. Manual `v*` tags also run the checks and publish a
release.
