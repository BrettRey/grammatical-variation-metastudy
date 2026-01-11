# STATUS.md - Grammatical Variation Meta-Study

**Last updated:** 2026-01-10
**Project phase:** Analysis + manuscript drafting

## Current State

Project initialized. Analysis plan drafted. Data prep rendered and prepped dataset generated. Domain-specific two-stage models fit and summarized. A custom Stan joint selection model has been implemented, rerun with more iterations, and checked via PPCs and diagnostics. brms two-stage comparison tables are in place. Manuscript drafting has started in `main.tex` with figures, citations, and a variationist-friendly scaffold.

## Origin

This project emerged from Laurel MacKenzie's colloquium at U of T (Jan 9, 2026). The topic - whether syntactic/grammatical variation is less socially conditioned than phonological variation - connects to Brett's broader work on boundary phenomena and HPC theory.

## Data

- **Source:** MacKenzie & Robinson (2025) open database
- **N:** 427 variable-variety combinations
- **Coverage:** LVC + Journal of Sociolinguistics, first issue through end of 2023
- **Outcome coding:** not analyzed / analyzed-null / analyzed-found (for production, perception, metalinguistic)

## Methodological Approach

Gelman-style Bayesian reanalysis:

1. **Joint selection model** - separate P(tested) from P(found | tested) while keeping untested rows
2. **Cross-classified multilevel** - paper, author, language, journal, year
3. **Binary stages** - tested vs not tested; found vs not found (conditional on testing)
4. **Domain-specific** - partial pooling across production/perception/metalinguistic

## Next Steps

- [x] Exploratory data analysis
- [x] Identify clustering structure (how many papers, authors, languages?)
- [x] Prototype selection model in brms (two-stage, domain-specific)
- [x] Prototype outcome model (domain-specific)
- [x] Revisit overall joint model with a structure that keeps untested rows (custom Stan)
- [x] Check custom Stan diagnostics (improved after extended run)
- [x] Add PPCs and brms two-stage comparison table
- [ ] Add abstract to `main.tex`
- [ ] Resolve minor LaTeX overfull boxes (repo URL + coding sentence)
- [ ] Decide whether to cite Dennett/Rapoport rules and add entry to `refs.bib`

## Session Log

### 2026-01-10 (Claude)
- Project created
- Cloned upstream repo
- Drafted CLAUDE.md and STATUS.md
- Outlined analysis structure
- Rendered `analysis/01_data_prep.qmd` and generated `analysis/gramm_var_prepped.csv`
- Fit joint models (regularizing + centered priors); centered model refit with higher adapt_delta
- Added interpretation/visualization notebook and OR summary table
- Fit domain-specific two-stage models and generated OR table
- Implemented and fit custom Stan joint selection model

### 2026-01-10 (Claude/Gemini)
- Added prose revisions: caveat on "found" heterogeneity, shrinkage interpretation, surfaced "both" sensitivity earlier, disciplined rhetoric
- Created extended Stan model with journal × variation-type interaction and 2-knot year spline
- Fit extended model; interaction and spline effects have wide intervals, supporting primary model assumptions
- Updated main.tex robustness section with extended model results
- Documented decisions in FORKING_PATHS.md
- Drafted Methods/Results/Discussion scaffold in `main.tex` with citations and figures
- Added variationist-oriented explanations (PPCs, ORs, CrIs) and a Rapoport-rules framing note
- Added figure captions and GitHub repository link in manuscript

### 2026-01-10 (Claude — Pedagogical Revision Session)
- Applied house style: contractions, curly apostrophes, spaced en-dashes, removed authorial "we"
- Added AI acknowledgement (ChatGPT 5.2, Claude Opus 4.5)
- Major pedagogical overhaul:
  - Drafted abstract following Rapoport's rules structure
  - Added "Why a selection model?" section (survivor bias motivation)
  - Added bridge to Rbrul/Goldvarb for variationists
  - Added "Reading the output" primer (ORs, CrIs, PPCs, partial pooling, no p-values)
  - Bulleted selection results with plain-English interpretations
  - Expanded figure captions with interpretation guidance
- Added footnote documenting NA-to-null recoding in data prep
- Implemented 9 reviewer fixes:
  - Abstract: "in the published record", posterior-predicted rates
  - Counterfactual explicit, CrI definition with posterior mass
  - Reference levels stated (JSlx, both); nil→null
  - refutes→undercuts with positive-selection caveat
  - Paraphrased M&R quote; covariance matrix σ→σ²
  - Author responsibility in acknowledgements
  - LVC paradox explicit in limitations; power note added
- Implemented simulated reviewer critiques (Zimmer, Gelman, Khalidi, Godfrey-Smith):
  - Abstract: "social invisibility" puzzle lede
  - Intro: Dative alternation example (humans not just variables)
  - Interpretation: Predictive implications over "CrI excludes 1"
  - Discussion: Capacity vs. Research Filter distinction; Causal pathways note
- Refined opening sentence: "Sociolinguistic theory has long debated" (avoids implying high testing frequency).
- Injected controlled humour (planes analogy, OR quip, honour-roll framing) to adjust tone.
- Applied rhetorical figures for argumentative clarity:
  - Inclusio/Ring Composition: "chosen to look for" (Method/Discussion bracket)
  - Symploce: "Selection asks... Outcome asks..." definition
  - Isocolon: Abstract thesis on "asymmetry in record reflecting design"
  - Symploce: "Selection asks... Outcome asks..." definition
  - Isocolon: Abstract thesis on "asymmetry in record reflecting design"
  - Hypophora: "Could the data distinguish... No." (Power limitation)
- Applied strict house style:
  - Canadian/Oxford spelling (behaviour, modelling, centre, catalogue)
  - Canadian/Oxford spelling (behaviour, modelling, centre, catalogue)
  - Semantic markup: `\olang{}` for object language examples
  - Removed throat-clearers ("it's worth asking")
- Applied plain style prose:
  - Converted bulleted lists to narrative paragraphs (Results)
  - Replaced "must"/"Note that"/"Furthermore" with simpler alternatives.
  - Removed "Thus" connectors.
  - Removed improper "we" pronouns for single-author voice.
  - Removed redundant "partial pooling" explanation from Results.
  - Added Tables: Descriptive (N=427) and Selection Estimates (ORs).
  - Explicitly noted JSlx's structural lack of order variables.
  - Standardised year gloss to "per SD" and cleaned up table interpretation.
  - Refined abstract for precision ("less available", "reported success rates").
  - Softened Methods tone ("simulate" vs "fake") and corrected spelling (regularising).
- **2026-01-10 — Post-Session Refinements:**
  - Combined PPC figures into a single page (Figure 1: `height=0.25\textheight`) with consolidated captions to solve layout overflow and reduce clutter.
  - Rewrote `learnings.tex` to mine the `PEDAGOGICAL_LOG.md` for broader insights (Model as Argument, Simulation as Critique) while strictly adhering to house style and voice constraints ("I" not "we").
- Formatted lining numbers with commas (4,000).

### 2026-01-10 (Claude/Gemini — Final Polish)
- Fixed figure layout: separate Figures 1–3 (PPC overall, PPC stratified, Probabilities)
- Added Table 3 (model comparison) with siunitx decimal alignment
- Accessibility: simplified "brms two-stage baseline" and prior specifications
- Anchored all quantitative claims with figure/table/appendix references
- Updated probability ranges to match model (92–95%)
- Removed p-value contamination (replaced χ²/p with descriptive "9-point gap")
- Removed "the present analysis" academic language → direct "I" voice
- Framework-neutral phrasing for Minimalist constructs (Spell-Out/Narrow Syntax removed)
- Logged p-value lesson in PEDAGOGICAL_LOG.md

## Connections to Other Work

- **Boundary phenomena** (reciprocals paper, HPC book): The question of whether grammatical variation is "different" from phonological variation is a boundary question
- **Labels to Stabilisers:** Meta-level question about how we carve up the linguistic space
- **MacKenzie follow-up:** Get Laurel's email, discuss potential collaboration or feedback exchange

## Handoff Notes

- **Manuscript:** `main.tex` contains Methods/Results/Discussion scaffolding with figures and citations.
- **Figures:** `figures/ppc-overall.png`, `figures/ppc-stratified.png`, `figures/probabilities.png`.
- **Primary model:** custom Stan joint selection model in `stan/selection_model.stan` with write-up in `analysis/05_custom_stan.qmd`.
- **Comparisons:** brms two-stage baseline in `analysis/06_model_comparison.qmd`; tables in `analysis/model_comparison_or_table.md`.
- **Logs:** pedagogical notes in `PEDAGOGICAL_LOG.md`; analytic decisions in `analysis/FORKING_PATHS.md`.
- **Untracked file:** `2026-mackenzie-robinson.pdf` exists locally but is not committed.
- **Coordination:** another model is currently working in this folder; avoid overlapping edits and sync before major changes.
