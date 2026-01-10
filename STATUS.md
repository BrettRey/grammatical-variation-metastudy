# STATUS.md - Grammatical Variation Meta-Study

**Last updated:** 2026-01-10
**Project phase:** Setup

## Current State

Project initialized. Upstream repo cloned. Analysis plan drafted. Data prep rendered and prepped dataset generated. Domain-specific two-stage models fit and summarized. A custom Stan joint selection model has been implemented and fit; diagnostics pending.

## Origin

This project emerged from Laurel MacKenzie's colloquium at U of T (Jan 9, 2026). The topic - whether syntactic/grammatical variation is less socially conditioned than phonological variation - connects to Brett's broader work on boundary phenomena and HPC theory.

## Data

- **Source:** MacKenzie & Robinson (2025) open database
- **N:** 426 variable-variety combinations
- **Coverage:** LVC + Journal of Sociolinguistics, first issue through end of 2023
- **Outcome coding:** not analyzed / analyzed-null / analyzed-found (for production, perception, metalinguistic)

## Methodological Approach

Gelman-style Bayesian reanalysis:

1. **Two-stage selection model** - separate P(tested) from P(found | tested)
2. **Cross-classified multilevel** - paper, author, language, journal, year
3. **Multinomial outcome** - preserve 3-level structure, don't binarize
4. **Domain-specific** - partial pooling across production/perception/metalinguistic

## Next Steps

- [ ] Exploratory data analysis
- [ ] Identify clustering structure (how many papers, authors, languages?)
- [x] Prototype selection model in brms (two-stage, domain-specific)
- [x] Prototype outcome model (domain-specific)
- [x] Revisit overall joint model with a structure that keeps untested rows (custom Stan)
- [ ] Check custom Stan diagnostics and refine if needed

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

## Connections to Other Work

- **Boundary phenomena** (reciprocals paper, HPC book): The question of whether grammatical variation is "different" from phonological variation is a boundary question
- **Labels to Stabilisers:** Meta-level question about how we carve up the linguistic space
- **MacKenzie follow-up:** Get Laurel's email, discuss potential collaboration or feedback exchange
