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

### 2026-01-10 — Manuscript Scaffolding for Variationists
- **Topic:** Communication and pedagogy
- **Decision:** Expand `main.tex` with variationist-friendly explanations of selection vs. outcome, PPCs, ORs, and CrIs, and document dual-prior PPCs.
- **Rationale:** Lower the barrier for readers unfamiliar with Bayesian selection models and clarify what the model contributes beyond descriptive tallies.
- **Alternatives:** Keep a terse statistical write-up; defer pedagogy to appendices.
- **Evidence:** `main.tex` (Methods/Results/Discussion scaffolding; figure captions).
- **Follow-ups:** Add a concise abstract and consider a short boxed glossary if space allows.

### 2026-01-10 — Multi-Agent Coordination Note
- **Topic:** Process coordination
- **Decision:** Record that another model is active in the repository and coordinate edits to avoid conflicts.
- **Rationale:** Parallel work can cause accidental overwrites or inconsistent states if not tracked.
- **Alternatives:** Proceed without coordination notes.
- **Evidence:** `STATUS.md` (Handoff Notes).
- **Follow-ups:** Confirm ownership of any overlapping files before edits.

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

### 2026-01-10 — Custom Stan Joint Selection Model
- **Topic:** Primary selection–outcome model
- **Decision:** Implement a custom Stan joint model with correlated random intercepts for paper/author/language and separate fixed effects for tested and found.
- **Rationale:** brms multivariate models drop untested rows, so a custom Stan likelihood is required to keep the selection model identifiable.
- **Alternatives:** Ordinal 0/1/2 outcome model; two-stage brms models.
- **Evidence:** `stan/selection_model.stan`, `analysis/05_custom_stan.qmd`, `analysis/custom_stan_or_table.md`.
- **Follow-ups:** Inspect divergences and diagnostics; decide whether to extend to random slopes or simplify.

### 2026-01-10 — Custom Stan Diagnostics
- **Topic:** MCMC diagnostics
- **Decision:** Add diagnostics block (R-hat, ESS, divergences, treedepth) to the custom Stan notebook.
- **Rationale:** Make sampler health visible before interpreting estimates.
- **Alternatives:** Inspect via console only without documenting in analysis.
- **Evidence:** `analysis/05_custom_stan.qmd` (Diagnostics section).
- **Follow-ups:** Consider more iterations or reparameterization if R-hat remains > 1.01.

### 2026-01-10 — Rerun Custom Stan (More Iterations)
- **Topic:** Diagnostics improvement
- **Decision:** Increase to 4 chains, 4000 iter (2000 warmup) for the custom Stan joint model.
- **Rationale:** Improve ESS and reduce R-hat > 1.01 after initial diagnostics.
- **Alternatives:** Simplify random effects; reparameterize; lower adapt_delta.
- **Evidence:** `analysis/05_custom_stan.qmd`, `analysis/custom_stan_or_table.md`.
- **Follow-ups:** Re-check diagnostics and update interpretation tables.

### 2026-01-10 — PPCs and Model Comparison
- **Topic:** Validation and cross-model comparison
- **Decision:** Add posterior predictive checks for the custom Stan model and fit brms two-stage models for side-by-side comparison.
- **Rationale:** Validate fit on observed rates and confirm robustness of fixed-effect directions across modeling approaches.
- **Alternatives:** Compare only against prior brms joint model (which dropped untested rows).
- **Evidence:** `analysis/05_custom_stan.qmd`, `analysis/06_model_comparison.qmd`, `analysis/model_comparison_or_table.md`.
- **Follow-ups:** Use comparison table in the results narrative and discussion.

### 2026-01-10 — Gelman-Style Checks and Presentation
- **Topic:** Targeted PPCs + probability-scale interpretation
- **Decision:** Add stratified PPCs (journal, variation type) and probability-scale predicted plots; draft a concise results paragraph tied to these checks.
- **Rationale:** Emphasize model checking and substantive interpretation over further model tweaking.
- **Alternatives:** Keep only global PPCs and OR tables.
- **Evidence:** `analysis/05_custom_stan.qmd`, `analysis/RESULTS_WRITEUP.md`.
- **Follow-ups:** Use these plots and paragraph in the manuscript draft.

### 2026-01-10 — Reading the Original Chapter
- **Topic:** Source-method alignment
- **Decision:** Read the MacKenzie & Robinson chapter to extract coding rules and confirm dataset alignment.
- **Rationale:** Ensure our modeling reflects the authors’ inclusion/exclusion rules and variable definitions.
- **Evidence:** `analysis/2026-mackenzie-robinson.pdf` (methods and coding sections).
- **Notes:** Counts match the paper exactly (386 realization+both, 72 order+both; 290 tested realization, 31 tested order), confirming our recode.
- **Follow-ups:** Consider sensitivity where “both” is included in both categories to mirror the paper’s reporting.

### 2026-01-10 — Sensitivity: “Both” Category
- **Topic:** Coding robustness
- **Decision:** Add a sensitivity check that counts “both” variables in both realization and order categories.
- **Rationale:** Aligns with the paper’s reporting convention and verifies that the testing-rate asymmetry persists.
- **Alternatives:** Keep “both” as its own category only.
- **Evidence:** `analysis/02_eda.qmd` (both-sensitivity section).
- **Follow-ups:** Reference this check in the results narrative.

### 2026-01-10 — Draft Results/Methods/Discussion Sections
- **Topic:** Manuscript scaffolding
- **Decision:** Draft prose sections for Results, Methods, and Discussion based on the custom Stan model and comparison checks.
- **Rationale:** Translate the validated modeling results into publication-ready narrative.
- **Evidence:** `analysis/RESULTS_SECTION.md`, `analysis/METHODS_SECTION.md`, `analysis/DISCUSSION_SECTION.md`.
- **Follow-ups:** Integrate into the main manuscript file when ready.

### 2026-01-10 — LaTeX Integration
- **Topic:** Manuscript drafting
- **Decision:** Move Results/Methods/Discussion prose into `main.tex` in house style.
- **Rationale:** Align the narrative with the LaTeX manuscript and style guide conventions.
- **Evidence:** `main.tex`.
- **Follow-ups:** Add figure/table environments and citations when ready.

### 2026-01-10 — Prose Revisions from Methodological Feedback
- **Topic:** Results framing and interpretation caveats
- **Decision:** Add four prose revisions: (1) caveat that "found" = "reported as found" in §1.1, (2) explicit shrinkage interpretation for wide intervals in §3.2, (3) surface "both" sensitivity check earlier rather than in Robustness, (4) discipline rhetoric to focus on "the literature" rather than "human sociolinguistic capacity."
- **Rationale:** Tightens the paper's claims and prevents overinterpretation. Addresses the fragile joints identified in methodological feedback.
- **Alternatives:** Keep original framing; add only some caveats.
- **Evidence:** `main.tex` (§1.1, §3.2, §3.4, §4.1).
- **Follow-ups:** Review updated prose for consistency across markdown drafts.

### 2026-01-10 — Journal × Variation-Type Interaction (Robustness)
- **Topic:** Institutional selection differences
- **Decision:** Add a journal × variation-type interaction to the selection stage as a robustness check.
- **Rationale:** Tests whether JSlx shows a larger selection gap between realization and order than LVC (institutional-incentive hypothesis).
- **Alternatives:** No interaction; interaction in both stages.
- **Evidence:** `stan/selection_model_extended.stan`, `analysis/07_extended_model.qmd`, `analysis/extended_model_or_table.md`.
- **Results:** Interaction terms have wide intervals spanning 1 (order:LVC OR ≈ 0.54, CrI 0.23–1.29; realization:LVC OR ≈ 0.66, CrI 0.30–1.47). Data do not clearly support differential selection by journal.
- **Follow-ups:** Report in §3.4 (Robustness); do not over-interpret as null.

### 2026-01-10 — Year Spline (Robustness)
- **Topic:** Non-linear temporal trends
- **Decision:** Add a 2-knot piecewise-linear year effect in the selection stage as a robustness check.
- **Rationale:** Editorial norms and the rise of third-wave meaning work aren't obviously linear; tests whether the linear year assumption holds.
- **Alternatives:** Smooth spline; decade bins; no robustness check.
- **Evidence:** `analysis/07_extended_model.qmd`, `analysis/extended_model_or_table.md`.
- **Results:** Spline coefficients point in the same direction (ORs 1.19, 1.72, 1.32; all intervals spanning 1), consistent with linearity rather than distinct period effects.
- **Follow-ups:** Report in §3.4 (Robustness); primary model's linear assumption is supported.

### 2026-01-10 — Interpreting Wide Intervals in Sparse Categories
- **Topic:** Pedagogical framing of uncertainty
- **Decision:** Explicitly state that wide credible intervals reflect data limitations, not absence of effect; partial pooling shrinks estimates toward the population mean.
- **Rationale:** Readers often misread wide intervals as "no effect" rather than "data cannot resolve this." This is especially important for order variables and perception/metalinguistic domains.
- **Alternatives:** Leave interpretation implicit.
- **Evidence:** `main.tex` §3.2 (Outcome).
- **Follow-ups:** Consider a boxed pedagogical note if space allows.

### 2026-01-10 — Round 2 Revisions: Mechanical Fixes
- **Topic:** Manuscript clarity and precision
- **Decision:** Apply 7 mechanical fixes: (1) classification consistency (realization/order/both as three levels), (2) journal years clarification, (3) year OR unit gloss (~decade), (4) first-author specification, (5) "selection into testing" language, (6) interaction coefficient interpretation, (7) mixed-effects analogy.
- **Rationale:** Prevent predictable misreadings and tighten definitions.
- **Evidence:** `main.tex` (§1.1, §2.2, §3.4).
- **Follow-ups:** None; these are drop-in fixes.

### 2026-01-10 — GIP Implications Subsection
- **Topic:** Theoretical payoff
- **Decision:** Add "Implications for the Grammatical Invisibility Principle" subsection to Discussion.
- **Rationale:** Connect findings to the GIP debate. Conditional on testing, both realization and order variables succeed at comparable rates (88–94%), refuting one version of the GIP (that order variables *cannot* carry social meaning).
- **Evidence:** `main.tex` §4.2.
- **Follow-ups:** Consider citing GIP literature if space allows.

### 2026-01-10 — Expanded M&R Engagement
- **Topic:** Rapoport's rules structure
- **Decision:** Expand "Relation to prior descriptive work" with explicit points of agreement, focused revision, and clarification that novelty is formalization rather than conceptual revision.
- **Rationale:** Prevents "we did the same thing but Bayesian" reaction; acknowledges M&R's own discussion of selection while clarifying what the model adds.
- **Evidence:** `main.tex` §4.3.
- **Follow-ups:** None.

### 2026-01-10 — Model Specification Appendix
- **Topic:** Methods-oriented documentation
- **Decision:** Add appendix with full generative model (likelihood, link functions, random effect structure, correlation specification, priors).
- **Rationale:** For a methods-oriented paper, readers need the full specification to evaluate the contribution.
- **Evidence:** `main.tex` Appendix A.
- **Follow-ups:** Consider adding Stan code as supplementary material.

### 2026-01-10 — Pedagogical Overhaul
- **Topic:** Accessibility for variationists
- **Decision:** Major restructuring: added "Why a selection model?" section, "Reading the output" primer, bulleted results with plain-English interpretations, expanded figure captions.
- **Rationale:** Most variationists aren't familiar with Bayesian selection models; Gelman-style accessibility requires bridging to familiar concepts (Rbrul, mixed-effects logistic regression) and explicit interpretation guidance.
- **Alternatives:** Keep terse statistical write-up; defer pedagogy to appendices.
- **Evidence:** `main.tex` Methods/Results sections.
- **Follow-ups:** Year SD still uses "roughly a decade" — should compute actual SD from data.

### 2026-01-10 — Reviewer Fixes (9 items)
- **Topic:** Precision and reviewer-proofing
- **Decision:** Implemented: abstract precision ("in the published record"), counterfactual explicit, CrI definition, nil→null, reference levels, refutes→undercuts, quote paraphrase, covariance σ², author responsibility.
- **Rationale:** Pre-empt predictable reviewer objections; align claims with what selection design licenses.
- **Evidence:** `main.tex` throughout.
- **Follow-ups:** None.

### 2026-01-10 — House Style Applied
- **Topic:** Style consistency
- **Decision:** Applied contractions, curly apostrophes, spaced en-dashes, removed authorial "we" (single-author paper), $z$-scored formatting.
- **Rationale:** House style adherence per `.house-style/style-guide.md`.
- **Evidence:** `main.tex`.
- **Follow-ups:** Style checker still flags math-mode underscores (false positives).


### 2026-01-10 — Simulated Reviewer Critiques (Zimmer, Gelman, Khalidi, Godfrey-Smith)
- **Topic:** Conceptual framing and epistemic humility
- **Decision:** Major revisions to Abstract, Intro, Interpretation, and Discussion.
  - **Abstract:** Opened with the "invisibility myth" puzzle (Zimmer).
  - **Intro:** Added dative alternation example to ground "selection" in human terms (Zimmer).
  - **Interpretation:** Shifted from "CrI excludes 1" to "predictive implications" (Gelman).
  - **Discussion:** Explicitly distinguished "capacity" from "research filter" (Khalidi/Godfrey-Smith). Added causal pathways (salience, register) as the real target for future work.
- **Rationale:** The initial draft was too focused on the "methodological refinement" and missed the core story about the construction of scientific knowledge. The high "found" rate is now framed as evidence of a filter, not just capacity.
- **Evidence:** `main.tex` abstract and §4.2.

### 2026-01-10 — Tone Adjustment (Per Reviewer Suggestion)
- **Topic:** Rhetorical texture
- **Decision:** Injected controlled humour to lighten the methodological critique.
  - "Survivor bias": planes/fleet analogy.
  - "Reading the output": "readers wish for predicted probabilities".
  - "PPCs": "if it looks fake, don't trust it".
  - "GIP": "triumph or clue", "honour roll not graduating class".
- **Rationale:** Methodological papers risk dryness; dry wit signals self-awareness about the "bookkeeping" nature of the problem without mocking the field.
- **Evidence:** `main.tex` scattered edits.

### 2026-01-10 — Rhetorical Sharpening
- **Topic:** Argumentative structure and memorability
- **Decision:** Applied classical rhetorical figures to tighten key takeaways.
  - **Inclusio:** "chosen to look for" brackets the Method-Discussion arc.
  - **Symploce:** Defined stages using parallel "X asks... Y asks..." structure.
  - **Isocolon:** Balanced abstract thesis ("Testing rates differ... success rates are high").
  - **Hypophora:** Addressed power limitation directly ("Could the data distinguish... No.").
- **Rationale:** Classical figures provide rhythm and authority without adding jargon; they make the complex selection/outcome distinction easier to parse and remember.
- **Evidence:** `main.tex` rhetorical edits.

### 2026-01-10 — House Style Standardisation
- **Topic:** Visual and orthographic consistency
- **Decision:** Enforced Canadian/Oxford spelling and semantic markup.
  - **Spelling:** `behaviors` → `behaviours`, `modeling` → `modelling`, `center` → `centre`, `catalog` → `catalogue`.
  - **Markup:** `\emph{}` → `\olang{}` for object language examples.
  - **Flow:** Removed "it's worth asking" (throat-clearer).
- **Rationale:** Aligns with author's institutional context (U of T) and `style-guide.md` preference for precision.
- **Evidence:** `main.tex` spelling/markup updates.

### 2026-01-10 — Plain Style Enforcement
- **Topic:** Clarity and flow
- **Decision:** Removing academic crutches.
  - **Lists to Prose:** Converted "Selection (tested)" results list to narrative paragraph ("First... Second...").
  - **Syntax:** "must first choose" → "first choose", "Note that" → Ø, "Furthermore" → "Also".
- **Rationale:** House style prohibits "hackneyed academic connectives" and encourages narrative flow for argument sequences.
- **Evidence:** `main.tex` prose refinements.

### 2026-01-10 — Final Polish
- **Topic:** Micro-typorgraphy and cohesion
- **Decision:** Fine-tuning.
  - **Connectors:** Removed "Thus" to avoid heavy transition.
  - **Formatting:** Added commas to large lining numbers (4,000).
  - **Voice:** Removed improper "we" pronouns ("we typicaly look" → "researchers typically look", "so we provide" → "so I provide").
  - **Redundancy:** Removed repetitive partial pooling explanation from Results (already in Methods).
  - **Tables:** Added Table 1 (Descriptive) and Table 2 (Estimates) to anchor abstract claims in visible data.
  - **Precision:** Explicitly noted JSlx's structural lack of order variables to preempt "extrapolation" critiques.
  - **Tone:** Adjusted Methods analogy to "simulate" (vs "fake") and tightened abstract scope.
- **Evidence:** `main.tex`.
