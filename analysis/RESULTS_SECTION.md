# Results

## Model Fit and Predictive Checks
Targeted posterior predictive checks indicate that the custom Stan joint model reproduces observed testing and finding rates, both overall and stratified by journal and variation type (Figure 1–2). The observed rates fall well within the posterior predictive distributions, suggesting the model captures the main selection structure without overfitting. Probability-scale predictions show systematic differences in the **tested** stage by journal and variation type, while **found | tested** remains uniformly high with overlapping uncertainty (Figure 3).

## Selection (Tested)
Testing is not uniform across the literature. In the custom Stan joint model, LVC exhibits lower testing rates than JSlx (OR ≈ 0.37; 95% CrI 0.17–0.83), and realization variables are more likely to be tested than order variables (realization vs both OR ≈ 2.33; 95% CrI 1.12–4.89). Testing also increases with year (OR ≈ 1.65; 95% CrI 1.04–2.67). The order-versus-both contrast remains uncertain. These patterns are visible on the probability scale as non-overlapping or partially overlapping intervals in the tested panel of Figure 3.

## Outcome (Found | Tested)
Conditional on being tested, evidence for social significance is high across all groups and shows no strong systematic differences by journal or variation type. All covariate effects in the outcome stage have wide intervals spanning 1 (Table 1), and predicted probabilities of finding significance overlap across groups (Figure 3). This suggests that the primary asymmetry in the literature lies in **which variables get tested**, not in **which tested variables are found to be socially significant**.

## Robustness and Comparison
A brms two-stage baseline (selection then outcome) yields the same qualitative pattern: selection effects for journal, realization, and year are stable, whereas outcome effects remain weak (Table 2). A sensitivity check that counts “both” variables in both realization and order categories reproduces the same testing-rate asymmetry (lower testing for order), matching the paper’s reporting convention.

**Figure callouts**
- Figure 1: Overall PPCs for tested and found rates (custom Stan).
- Figure 2: Stratified PPCs by journal and variation type (custom Stan).
- Figure 3: Population-level predicted probabilities by journal and variation type (custom Stan).
- Table 1: Custom Stan ORs (`analysis/custom_stan_or_table.md`).
- Table 2: Stan vs brms OR comparison (`analysis/model_comparison_or_table.md`).
