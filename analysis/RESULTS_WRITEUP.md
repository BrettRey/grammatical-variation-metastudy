# Results Write-Up Scaffold

## Results Overview
- The custom Stan joint selection model shows clear structure in **testing** (journal, variation type, and year), but **found | tested** effects remain weak and uncertain.
- LVC studies are less likely to test variables than JSlx, and realization variables are more likely to be tested than order variables.
- Uncertainty concentrates in sparse categories (especially variation type = order and perception domain).

## Model Fit & Calibration
- Custom Stan joint model with correlated random intercepts fits without divergences; most R-hat values are ~1.01 or lower after the extended run.
- Posterior predictive checks on tested and found rates align with observed rates.
- Random effects capture heterogeneity without reversing the fixed-effects pattern in testing.

## Fixed Effects (Odds Ratios)
- **Tested stage:** journal LVC < 1 (lower testing), realization > 1 (higher testing), and year_z > 1 (increasing testing over time); order vs both remains uncertain.
- **Found stage:** all covariate effects have wide intervals spanning 1; no strong evidence for systematic differences once tested.

## Predicted Probabilities / Rates
- Model-implied tested and found rates are high and align with observed rates in PPCs.
- The tested-vs-found asymmetry persists: selection effects are more pronounced than outcome effects.

## Sensitivity to Priors
- Regularizing priors are retained in the Stan model; earlier brms-centered priors showed similar qualitative directions for fixed effects.

## Model Comparison (Stan vs brms Two-Stage)
- Fixed-effect directions are consistent across the custom Stan joint model and the brms two-stage fits.
- Testing effects (journal, realization, year) are especially stable across approaches; outcome effects remain weak in both.
- Intercept magnitudes differ modestly, but substantive conclusions are unchanged.

## Draft Narrative Paragraph (Model Interpretation)
- Paragraph draft: The custom Stan joint selection model shows that *whether* a variable is tested depends on journal, variation type, and time: LVC papers are less likely to test variables, realization variables are more likely to be tested, and testing increases over time. Once variables are tested, however, the evidence for social-significance findings does not strongly depend on these covariates; all outcome effects have wide intervals spanning no effect. Posterior predictive checks on tested and found rates align with the observed rates, suggesting the model captures the main selection structure without inventing systematic outcome differences.

## Concise Results Paragraph (Gelman-Style)
- Paragraph draft: Targeted posterior predictive checks show the custom Stan model reproduces observed testing and finding rates overall and by journal and variation type. On the probability scale, predicted testing differs by journal and variation type (LVC lower; realization higher), and increases over time, while found|tested remains broadly similar across groups with wide uncertainty. The brms two-stage baseline yields the same qualitative pattern, indicating the selection effects are robust to modeling approach while outcome effects remain weak and data-limited.

## Limitations & Caveats
- Order-type data are sparse and concentrated in one journal, limiting interpretability.
- Selection effects dominate the observable variation; outcome effects are secondary.
- Domain-specific models are two-stage (selection then outcome) because joint models drop untested rows; perception remains very sparse.

## Next Analyses (If Needed)
- Compare custom Stan joint estimates to brms two-stage fits (side-by-side table).
- Consider alternative temporal structures if year effects are hypothesized (e.g., splines).
- Explore sensitivity to collapsing or re‑coding variation type categories.
