# Repository Guidelines

## Project Structure & Module Organization
- `analysis/` holds Quarto notebooks for the reanalysis (e.g., `00_analysis_plan.qmd`, `01_data_prep.qmd`).
- `upstream/` is a git submodule pointing to the original dataset/analysis; treat as read-only.
- `stan/` is reserved for Stan model files as they are introduced.
- `output/` is for generated tables, figures, and rendered artifacts.
- Root docs: `CLAUDE.md` (project brief), `STATUS.md` (progress log), `PEDAGOGICAL_LOG.md` (teaching notes).
- Decision tracking: `analysis/FORKING_PATHS.md` logs analytic forks and choices.

## Build, Test, and Development Commands
No centralized build system is defined; render Quarto notebooks directly.
- Render data prep: `quarto render analysis/01_data_prep.qmd`
- Render the plan: `quarto render analysis/00_analysis_plan.qmd`
These commands require R with `dplyr`, `readr`, `stringr`, `tibble`, `tidyr`, and `here` installed.

## Environment & Privileged Actions
- If a task requires system-wide installs or `sudo`, pause and ask the user to run the command or confirm the method.
If cloning fresh, initialize submodules: `git submodule update --init --recursive`.

## Collaboration & Roles
- Brett Reynolds provides research direction, approves methodological choices, and guides priorities.
- The AI coding agent implements most code changes and drafts analysis artifacts under Brett’s guidance.
- Keep this role split visible in repo docs and logs when appropriate.
- Before editing `main.tex`, review `.house-style/style-guide.md` and follow the house-style rules.

## Coding Style & Naming Conventions
- R code follows tidyverse conventions; prefer pipes and `snake_case`.
- Use 2-space indentation in R/Quarto chunks.
- Name new analysis notebooks with numeric prefixes (`02_eda.qmd`, `03_selection_model.qmd`) to preserve ordering.

## Testing Guidelines
- No automated test suite is present.
- Validate by rendering QMDs and checking summary tables (counts, missing values) plus generated files in `output/`.

## Commit & Pull Request Guidelines
- Project history is new, so no established commit message conventions are visible.
- If you add commits, keep subjects short and imperative (e.g., “Add data prep recodes”).
- PRs should describe data changes, analysis outputs, and any required package versions; include rendered artifacts when relevant.

## Data & Provenance Notes
- Keep upstream data immutable; if you need modifications, write to `analysis/` or `output/` and document transformations in the notebook.
- To sync upstream data: `git -C upstream pull --ff-only`, then commit the updated submodule pointer.
- Update `STATUS.md` when you complete a milestone or change the analysis plan.
- Update `PEDAGOGICAL_LOG.md` for notable decisions, tradeoffs, and instructive interactions.
