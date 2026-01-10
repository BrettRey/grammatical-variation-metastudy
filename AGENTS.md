# Repository Guidelines

## Project Structure & Module Organization
- `analysis/` holds Quarto notebooks for the reanalysis (e.g., `00_analysis_plan.qmd`, `01_data_prep.qmd`).
- `upstream/` is a snapshot of the original dataset and analysis (`LVC_JSlx_gramm_var_database.csv`, `.Rmd`); treat as read-only.
- `stan/` is reserved for Stan model files as they are introduced.
- `output/` is for generated tables, figures, and rendered artifacts.
- Root docs: `CLAUDE.md` (project brief) and `STATUS.md` (progress log).

## Build, Test, and Development Commands
No centralized build system is defined; render Quarto notebooks directly.
- Render data prep: `quarto render analysis/01_data_prep.qmd`
- Render the plan: `quarto render analysis/00_analysis_plan.qmd`
These commands require R with `tidyverse` and `here` installed.

## Coding Style & Naming Conventions
- R code follows tidyverse conventions; prefer pipes and `snake_case`.
- Use 2-space indentation in R/Quarto chunks.
- Name new analysis notebooks with numeric prefixes (`02_eda.qmd`, `03_selection_model.qmd`) to preserve ordering.

## Testing Guidelines
- No automated test suite is present.
- Validate by rendering QMDs and checking summary tables (counts, missing values) plus generated files in `output/`.

## Commit & Pull Request Guidelines
- This workspace has no `.git` history, so no established commit message conventions are visible.
- If you add commits, keep subjects short and imperative (e.g., “Add data prep recodes”).
- PRs should describe data changes, analysis outputs, and any required package versions; include rendered artifacts when relevant.

## Data & Provenance Notes
- Keep upstream data immutable; if you need modifications, write to `analysis/` or `output/` and document transformations in the notebook.
- Update `STATUS.md` when you complete a milestone or change the analysis plan.
