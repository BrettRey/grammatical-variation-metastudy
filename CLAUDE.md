# CLAUDE.md - Grammatical Variation Meta-Study Replication

## Role: Editor/Analyst

This is a replication/reanalysis project. Deep analytical work is appropriate here.

## Project Overview

**Source:** MacKenzie, Laurel, and Mary Robinson. 2025. "Spelling out grammatical variation." In *English Sociosyntax: Theory, Evidence, Approaches*, ed. Daniel Duncan and Mary Robinson, 59-95. Berlin: De Gruyter Mouton.

**Repository:** https://github.com/laurelmackenzie/grammatical-variation-metastudy

**Data:** 426 grammatical variables from LVC + Journal of Sociolinguistics through 2023

**Goal:** Gelman-style Bayesian reanalysis with proper multilevel structure and selection modeling

## The Reframe

The original analysis uses simple proportions and contingency table tests. Our reanalysis:

### 1. Two-Stage Selection Model

- **Stage A:** P(variable gets social-significance test | variable in database)
- **Stage B:** P(social significance found | tested)

This avoids treating the literature as random sample of "all grammatical variables."

### 2. Cross-Classified Multilevel Structure

Varying intercepts (possibly slopes) for:
- Paper ID
- Author(s)
- Language/variety (possibly language family)
- Journal
- Year

Question: How much of "social significance found" is journal-specific reporting culture vs language-specific ecology vs variable-type differences?

### 3. Multinomial Outcome

Keep the three-level structure: not analyzed / analyzed-null / analyzed-found

Original collapses this to binary. We preserve information.

### 4. Domain-Specific Partial Pooling

Separate estimates for production / perception / metalinguistic behavior domains.

Question: Is the "social meaning" evidence base structurally skewed toward production studies?

## Technical Stack

- R + Stan (brms or cmdstanr)
- Quarto for reproducible analysis
- Git for version control

## Key Files

```
grammatical-variation-metastudy/
├── upstream/                    # Original repo (read-only)
│   ├── LVC_JSlx_gramm_var_database.csv
│   └── LVC_JSlx_gramm_var_database.Rmd
├── analysis/                    # Our reanalysis
│   ├── 01_data_prep.qmd
│   ├── 02_eda.qmd
│   ├── 03_selection_model.qmd
│   ├── 04_outcome_model.qmd
│   └── 05_synthesis.qmd
├── stan/                        # Stan model files
├── CLAUDE.md
└── STATUS.md
```

## Collaboration

**Laurel MacKenzie:** Contact for questions about coding decisions. Email: laurel.mackenzie@nyu.edu

## House Style

Follow portfolio house style for any LaTeX output. R code should be tidyverse-style.
