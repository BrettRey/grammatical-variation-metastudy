# Pedagogical Log

Purpose: capture key modeling decisions, rationales, and lessons learned so the reanalysis is teachable and reproducible.

## Entry Format
- **Date:** YYYY-MM-DD
- **Topic:** short label (e.g., “Selection model vs multinomial”)
- **Decision:** what we chose
- **Rationale:** why we chose it
- **Alternatives:** what we considered and rejected
- **Evidence:** references to notebooks/results
- **Follow-ups:** next checks or sensitivities

## Entries

### 2026-01-10 — Log Initialized
- **Topic:** Project pedagogy
- **Decision:** Start a dedicated pedagogical log alongside `STATUS.md`.
- **Rationale:** Keep teaching-oriented notes separate from project status.
- **Alternatives:** Use only `STATUS.md`.
- **Evidence:** N/A
- **Follow-ups:** Add the first methodological decision once data audit begins.

### 2026-01-10 — Documenting Interaction Norms
- **Topic:** Process transparency
- **Decision:** Update the pedagogical log regularly to capture notable researcher–assistant interactions and teachable moments.
- **Rationale:** Make the workflow legible to newcomers and preserve rationale behind choices.
- **Alternatives:** Keep notes ad hoc in notebooks.
- **Evidence:** `AGENTS.md`, `CLAUDE.md` updates noting log usage.
- **Follow-ups:** Add entries when we resolve model-structure choices or data prep tradeoffs.

### 2026-01-10 — Joint Selection Model Chosen
- **Topic:** Model structure
- **Decision:** Use a joint selection–outcome model as the primary approach, with baseline two-stage models for sensitivity checks.
- **Rationale:** Directly models selection into testing and allows correlation between selection and outcome.
- **Alternatives:** Single multinomial model; uncorrelated two-stage models only.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Model Architecture section).
- **Follow-ups:** Decide whether `brms` can express the correlation structure or if custom Stan is required.

### 2026-01-10 — Domain-Specific Selection
- **Topic:** Evidence domains
- **Decision:** Fit separate joint models for production, perception, and metalinguistic behavior, each with its own selection indicator.
- **Rationale:** Allows explicit tests of selection bias toward production studies.
- **Alternatives:** One global selection model with domain-specific outcomes.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Domain-Specific Models section).
- **Follow-ups:** Confirm data sufficiency in each domain after EDA.

### 2026-01-10 — Linear Year Effect
- **Topic:** Time trend
- **Decision:** Model year as a linear (centered/scaled) predictor in the main analysis.
- **Rationale:** Parsimonious default before testing more flexible trends.
- **Alternatives:** Spline-based smooths; decade bins.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Predictors & Recodes).
- **Follow-ups:** Add a sensitivity model with a smooth if linear fit is inadequate.

### 2026-01-10 — Provisional NA → “null” Recoding
- **Topic:** Data coding ambiguity
- **Decision:** Temporarily treat NA in social-significance fields as “null” (analyzed, no effect).
- **Rationale:** The CSV contains no explicit “null” values despite the original Rmd using them; this keeps the intended three-level outcome.
- **Alternatives:** Treat NA as “not analyzed” or as true missingness pending clarification.
- **Evidence:** `analysis/01_data_prep.qmd` (NA recode step).
- **Follow-ups:** Confirm intended coding with Laurel and revise if needed.

### 2026-01-10 — Priors Scaffolding (To Be Filled)
- **Topic:** Prior specification
- **Decision:** Establish a structured checklist for priors before fitting models.
- **Rationale:** Prevent silent defaults and make modeling choices teachable.
- **Alternatives:** Rely on package defaults.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Priors section).
- **Follow-ups:** Fill in after EDA with:
  - Outcome scale choice (log-odds) and interpretation check
  - Fixed-effect prior scale justification (e.g., OR ranges)
  - Random-effect SD priors and correlation LKJ choice
  - Sensitivity runs (wider/narrower priors)

### 2026-01-10 — LOO-CV Scaffolding (To Be Filled)
- **Topic:** Model comparison
- **Decision:** Use PSIS-LOO with diagnostic thresholds and an explicit fallback.
- **Rationale:** Avoid over-trusting unstable LOO estimates.
- **Alternatives:** WAIC; k-fold CV.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Diagnostics section).
- **Follow-ups:** Fill in after first model fits with:
  - Pareto-k thresholds and handling (e.g., `reloo`)
  - Comparisons to run (selection-only vs joint; linear vs smooth year)
  - Reporting template for LOO results and effective sample sizes

### 2026-01-10 — Gelman-Style Checklist Added
- **Topic:** Workflow discipline
- **Decision:** Add a checklist emphasizing prior/posterior predictive checks, incremental complexity, and sensitivity analyses.
- **Rationale:** Keep the analysis aligned with a “model-checking first” workflow.
- **Alternatives:** Informal checks only.
- **Evidence:** `analysis/00_analysis_plan.qmd` (Gelman-Style Workflow Checklist; Sensitivity Analyses).
- **Follow-ups:** Update the checklist when we add the first fitted model.

### 2026-01-10 — Local Quarto + Minimal R Package Set
- **Topic:** Tooling pragmatics
- **Decision:** Install Quarto locally (user-space) and rely on core tidyverse packages (`dplyr`, `readr`, `stringr`, `tibble`, `tidyr`) instead of the `tidyverse` meta-package.
- **Rationale:** Avoided sudo-required installers and a failed `tidyverse` build due to graphics dependencies (`ragg`, `textshaping`).
- **Alternatives:** System-wide Quarto install; full `tidyverse` meta-package.
- **Evidence:** `analysis/01_data_prep.qmd` package imports; successful Quarto render.
- **Follow-ups:** Revisit full tidyverse install only if needed for plotting/advanced workflows.

### 2026-01-10 — Privileged Actions Check-In
- **Topic:** Process hygiene
- **Decision:** Add explicit guidance to ask before `sudo`/system-wide installs.
- **Rationale:** User can provide sudo; we should pause when escalation is needed.
- **Alternatives:** Proceed with local installs only.
- **Evidence:** `AGENTS.md` and `CLAUDE.md` privileged-action notes.
- **Follow-ups:** Use this rule for any future tooling or system changes.

### 2026-01-10 — System Quarto Installed
- **Topic:** Tooling alignment
- **Decision:** Switch from local Quarto to a system-wide install via Homebrew.
- **Rationale:** Avoid path confusion and align with standard CLI usage.
- **Alternatives:** Keep user-space Quarto in `~/.local/quarto`.
- **Evidence:** `quarto --version` returns 1.8.26 after reinstall.
- **Follow-ups:** Ensure future renders use the system binary.

### 2026-01-10 — Joint Model Scaffold Added
- **Topic:** Modeling implementation
- **Decision:** Add a joint selection–outcome model scaffold with prior predictive checks.
- **Rationale:** Provide a runnable template that matches the analysis plan and supports early model checking.
- **Alternatives:** Wait to scaffold until EDA is complete.
- **Evidence:** `analysis/02_eda.qmd` (joint model scaffold sections).
- **Follow-ups:** Install `brms` and run prior predictive checks once ready.

### 2026-01-10 — brms Installed
- **Topic:** Modeling toolchain
- **Decision:** Install `brms` (and dependencies, including `rstan`) via CRAN.
- **Rationale:** Enables joint-model prototyping directly from the scaffold notebook.
- **Alternatives:** Use `cmdstanr` only with custom Stan.
- **Evidence:** `Rscript -e "library(brms)"` succeeded.
- **Follow-ups:** Run prior predictive checks in `analysis/02_eda.qmd`.

### 2026-01-10 — Prior Predictive Check (Joint Model)
- **Topic:** Model checking
- **Decision:** Run prior predictive checks separately for `tested` and `foundcond` in the multivariate model.
- **Rationale:** `pp_check()` on multivariate models requires an explicit response; checking both preserves the two-stage interpretation.
- **Alternatives:** Skip prior predictive checks; check only one response.
- **Evidence:** `analysis/02_eda.qmd` rendered with `pp_check(..., resp = "tested")` and `pp_check(..., resp = "foundcond")`.
- **Follow-ups:** Review plots and adjust priors if implied rates look implausible.

### 2026-01-10 — Priors Tightened After PPC
- **Topic:** Prior regularization
- **Decision:** Tighten priors to Normal(0,1.2) intercepts, Normal(0,0.7) slopes, Exponential(2) SDs.
- **Rationale:** Prior predictive curves were too diffuse and allowed extreme rates; tighter priors improve stability.
- **Alternatives:** Keep original priors; tighten only intercepts.
- **Evidence:** `analysis/02_eda.qmd`, `analysis/FORKING_PATHS.md`.
- **Follow-ups:** Re-run prior predictive checks and confirm plausibility.

### 2026-01-10 — Forking Paths Log Added
- **Topic:** Decision transparency
- **Decision:** Add a dedicated forking-paths log to track analytic choices and alternatives.
- **Rationale:** Separate process notes from decision accounting; reduce hidden flexibility.
- **Alternatives:** Use only `PEDAGOGICAL_LOG.md`.
- **Evidence:** `analysis/FORKING_PATHS.md`, `AGENTS.md`, `CLAUDE.md`.
- **Follow-ups:** Update the log whenever a decision changes status.
