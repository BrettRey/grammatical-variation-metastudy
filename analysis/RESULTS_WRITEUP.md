# Results Write-Up Scaffold

## Results Overview
- Baseline probabilities for both testing and finding variation are high, with little evidence of strong covariate effects.
- Most uncertainty concentrates in sparse categories (especially variation type = order).
- Fixed-covariate and marginal predictions tell the same qualitative story.

## Model Fit & Calibration
- Joint selection/outcome model fit without major pathologies after tightening priors.
- Posterior predictive checks show plausible distributions but limited separation by covariates.
- Random effects capture heterogeneity without overturning the fixed-effects story.

## Fixed Effects (Odds Ratios)
- Slopes for year, journal, and variation type cluster near OR ≈ 1 with 95% intervals spanning 1.
- No consistent evidence of time trends in testing or finding variation.
- Journal differences (LVC vs JSlx) are small relative to uncertainty.

## Predicted Probabilities
- Population-level predictions are very high for both tested and foundcond across all categories.
- Marginal predictions (observed covariates + random effects) widen intervals slightly but preserve overlap.
- Order-type predictions remain the least precise, reflecting sparse data.

## Sensitivity to Priors
- Regularizing vs centered priors produce similar fixed-effect estimates and predictive patterns.
- Intercepts shift modestly, but covariate effects remain weak under both priors.

## Draft Narrative Paragraph (Model Interpretation)
- Paragraph draft: The fixed‑covariate predictions at mean year and zero random effects show uniformly high testing and finding probabilities, with substantial overlap across journal and variation type. When we marginalize over the observed covariates and include random effects, the intervals widen to reflect heterogeneity, but the overall pattern is unchanged. This indicates that the “high baseline + weak covariate signals” story is not an artifact of conditioning on year_z = 0 or suppressing group‑level variation; the data simply do not support strong systematic differences by journal or variation type.

## Limitations & Caveats
- Order-type data are sparse and concentrated in one journal, limiting interpretability.
- Selection effects dominate the observable variation; outcome effects are secondary.
- Domain-specific selection models remain exploratory and are not yet fit.

## Next Analyses (If Needed)
- Fit domain-specific selection models (production, perception, metalinguistic) for robustness.
- Consider alternative temporal structures if year effects are hypothesized (e.g., splines).
- Explore sensitivity to collapsing or re‑coding variation type categories.
