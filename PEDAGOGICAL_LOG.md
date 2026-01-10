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
- **Decision:** Tighten priors to Normal(0,1.0) intercepts, Normal(0,0.5) slopes, Exponential(3) SDs.
- **Rationale:** Prior predictive curves remained diffuse; further tightening improves stability.
- **Alternatives:** Keep original priors; tighten only intercepts.
- **Evidence:** `analysis/02_eda.qmd`, `analysis/FORKING_PATHS.md`.
- **Follow-ups:** Re-run prior predictive checks and confirm plausibility.

### 2026-01-10 — Dual-Prior PPC (Regularizing + Centered)
- **Topic:** Sensitivity workflow
- **Decision:** Run PPCs under both regularizing and data-centered intercept priors, and summarize implied rates.
- **Rationale:** Aligns with Gelman-style robustness checks while keeping primary priors regularizing (not fully agnostic).
- **Alternatives:** Use only regularizing priors.
- **Evidence:** `analysis/02_eda.qmd` (prior sensitivity section, quantile summary).
- **Follow-ups:** Compare posterior results under both priors once fitting begins.

### 2026-01-10 — First Joint Model Fits (Diagnostics)
- **Topic:** Model fitting
- **Decision:** Fit joint selection–outcome model under regularizing and centered priors (2 chains, 2k iters).
- **Rationale:** Establish baseline fits for comparison.
- **Alternatives:** Fit only one prior; increase iterations upfront.
- **Evidence:** `analysis/fit_joint_regularizing.rds`, `analysis/fit_joint_centered.rds` (not tracked).
- **Follow-ups:** Address diagnostics (divergence + R-hat/ESS) by increasing iterations and/or `adapt_delta`.

### 2026-01-10 — Centered Model Refit (Improved ESS)
- **Topic:** Diagnostics tuning
- **Decision:** Refit centered-prior model with `adapt_delta = 0.99` (4 chains, 4k iters).
- **Rationale:** Improve ESS for group-level SDs while retaining the centered sensitivity check.
- **Alternatives:** Increase iterations further; simplify random effects.
- **Evidence:** `analysis/fit_joint_centered.rds` (updated).
- **Follow-ups:** Compare posterior summaries across priors and proceed to reporting.

### 2026-01-10 — Interpretation & Visualization Notebook
- **Topic:** Results communication
- **Decision:** Add a dedicated interpretation/visualization notebook and an OR summary table.
- **Rationale:** Separate model interpretation from EDA and preserve a clean results narrative.
- **Alternatives:** Keep all visuals in `analysis/02_eda.qmd`.
- **Evidence:** `analysis/03_model_interpretation.qmd`, `analysis/joint_model_or_table.md`.
- **Follow-ups:** Add posterior predictive checks and domain-specific plots if needed.

### 2026-01-10 — Forking Paths Log Added
- **Topic:** Decision transparency
- **Decision:** Add a dedicated forking-paths log to track analytic choices and alternatives.
- **Rationale:** Separate process notes from decision accounting; reduce hidden flexibility.
- **Alternatives:** Use only `PEDAGOGICAL_LOG.md`.
- **Evidence:** `analysis/FORKING_PATHS.md`, `AGENTS.md`, `CLAUDE.md`.
- **Follow-ups:** Update the log whenever a decision changes status.

### 2026-01-10 — Marginal Predictions Plot
- **Topic:** Interpretation scaffolding
- **Decision:** Add a second plot that averages predictions over the observed covariate distribution and includes random effects.
- **Rationale:** Contrast fixed-covariate predictions with a marginal view that reflects observed heterogeneity.
- **Alternatives:** Show only fixed-covariate predictions or only group-level marginal means.
- **Evidence:** `analysis/03_model_interpretation.qmd` (marginal predicted probabilities section).
- **Follow-ups:** Compare marginal plot to fixed-covariate plot for sensitivity.

### 2026-01-10 — Results Scaffold + Interpretation Paragraph
- **Topic:** Results write-up preparation
- **Decision:** Create a results write-up scaffold with section headings and bullet takeaways; store the fixed-vs-marginal interpretation paragraph in the scaffold.
- **Rationale:** Keep a reusable narrative and keep the results structure separate from analysis notebooks.
- **Alternatives:** Store the paragraph only in `analysis/03_model_interpretation.qmd`.
- **Evidence:** `analysis/RESULTS_WRITEUP.md`.
- **Follow-ups:** Expand bullets into prose when drafting the manuscript.

### 2026-01-10 — Domain-Specific Models (Two-Stage)
- **Topic:** Domain-specific selection modeling
- **Decision:** Fit two-stage models per domain (tested on full data; found conditional on tested subset) rather than a multivariate joint model.
- **Rationale:** brms drops rows with missing responses in multivariate fits; for perception this collapses variation_type to a single level and fails model matrix construction. Two-stage fits preserve selection modeling for sparse domains.
- **Alternatives:** Custom Stan joint selection model; ordinal 3-level outcome model.
- **Evidence:** `analysis/04_domain_models.qmd`, `analysis/domain_model_or_table.md`.
- **Follow-ups:** Revisit the overall “joint” model, which may have used complete cases only.

### 2026-01-10 — Multivariate brms Missingness Check
- **Topic:** Joint selection–outcome modeling
- **Decision:** Flag the current multivariate brms joint model as provisional; it drops untested rows (complete-case), which undermines the tested submodel.
- **Rationale:** Inspecting `fit_joint_regularizing.rds` shows only tested rows remain (tested == 1 everywhere), so the selection model is not identified.
- **Alternatives:** Custom Stan joint selection model; ordinal 3-level outcome; explicit two-stage models.
- **Evidence:** `analysis/fit_joint_regularizing.rds`, `analysis/00_analysis_plan.qmd` (implementation note).
- **Follow-ups:** Refit the primary model with a structure that preserves untested rows.

### 2026-01-10 — Collaboration Roles Clarified
- **Topic:** Repo documentation
- **Decision:** Make the collaboration roles explicit in `README.md`, `AGENTS.md`, and `CLAUDE.md`.
- **Rationale:** Ensure the repository clearly indicates that Brett guides the work and the AI agent implements most code under that guidance.
- **Alternatives:** Mention roles only in internal notes.
- **Evidence:** `README.md`, `AGENTS.md`, `CLAUDE.md`.
- **Follow-ups:** Keep role statements in sync across docs.
