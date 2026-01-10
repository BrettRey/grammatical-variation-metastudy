# Joint Model Odds Ratios (Fixed Effects)

Source: `analysis/fit_joint_regularizing.rds` and `analysis/fit_joint_centered.rds`  
Scale: odds ratios (median [95% credible interval])

| Term | Regularizing | Centered |
| --- | --- | --- |
| foundcond_Intercept | 18.27 [4.68, 72.20] | 23.41 [6.47, 84.47] |
| foundcond_journalLVC | 1.05 [0.49, 2.34] | 1.03 [0.46, 2.27] |
| foundcond_variation_type_recodeorder | 0.98 [0.38, 2.50] | 0.97 [0.37, 2.47] |
| foundcond_variation_type_recoderealization | 0.88 [0.37, 2.03] | 0.88 [0.37, 2.11] |
| foundcond_year_z | 1.19 [0.69, 2.06] | 1.18 [0.68, 2.05] |
| tested_Intercept | 80.22 [21.60, 321.00] | 48.05 [13.73, 177.42] |
| tested_journalLVC | 1.01 [0.41, 2.45] | 1.02 [0.43, 2.46] |
| tested_variation_type_recodeorder | 1.00 [0.38, 2.69] | 1.00 [0.39, 2.61] |
| tested_variation_type_recoderealization | 0.98 [0.39, 2.44] | 0.99 [0.39, 2.42] |
| tested_year_z | 1.00 [0.48, 2.08] | 1.00 [0.52, 1.93] |

Notes:
- Intercepts reflect baseline odds at the reference levels; interpret with caution.
- Fixed‑effect ORs are near 1.0 across priors, indicating minimal differences in slopes.
