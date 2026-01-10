# Methods

## Data Source and Unit of Analysis
We reanalyze the open database compiled by MacKenzie & Robinson (2025), covering **Language Variation and Change (LVC)** and **Journal of Sociolinguistics (JSlx)** from their first year through **2023**. The unit of analysis is **variable × variety**: if a paper studies multiple variables or the same variable across multiple varieties, each counts separately.

## Inclusion and Exclusion Criteria
We follow the authors’ coding rules: variables are included if they represent grammatical meanings/functions with more than one realization. Exclusions include phonetic/phonological variables, lexical choice/discourse‑pragmatic variables, discourse/conversation‑structure variables, and code‑switching. The ambiguous variables **(ING)** and **(TD)** are excluded (treated as mixed phonological/morphological). Only articles reporting new results are included; reviews and commentary sections are excluded.

## Variable Typing and Social Significance Coding
Variables are classified as **realization** or **order**, with **omission** treated as a subtype of realization. A variable is coded as **both** if it involves both realization and order (e.g., dative alternation). Social significance is coded as a three‑level outcome: **not investigated**, **investigated but not found**, **found**; if investigated, we record domain(s): **production**, **perception**, **metalinguistic behaviors**. In our main models, we treat **tested** as “investigated” and **found** as “found among tested.”

We include a sensitivity check where “both” is counted in both realization and order categories to match the paper’s reporting convention; this does not change the qualitative selection pattern.

## Modeling Strategy
We model selection (tested) and outcomes (found | tested) jointly using a custom Stan model that avoids complete‑case dropping when outcomes are missing for untested rows. The model specification is:
- **Selection stage:** logit P(tested) = intercept + predictors + random intercepts
- **Outcome stage:** logit P(found | tested) = intercept + predictors + random intercepts
- **Predictors (both stages):** journal, variation type, year (z‑scored)
- **Random intercepts:** paper, author, language, with correlated random effects across stages

We also fit **brms two‑stage models** (selection then outcome) as a baseline comparison.

## Priors and Estimation
Priors follow a regularizing scheme on the logit scale: Normal(0, 1.0) for intercepts, Normal(0, 0.5) for slopes, Exponential(3) for random‑effect SDs, and LKJ(2) for correlations. The custom Stan model is sampled with 4 chains, 4000 iterations (2000 warmup), adapt_delta 0.99, max_treedepth 12. Diagnostics and posterior predictive checks are reported in `analysis/05_custom_stan.qmd`.
