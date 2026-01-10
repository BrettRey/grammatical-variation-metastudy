# EDA Summary (Snapshot)

Date: 2026-01-10  
Source: `analysis/gramm_var_prepped.csv` (NA treated as “null” in social-significance fields)

## Key Counts
- Total rows: 427 (note: differs from the 426 mentioned in project notes).
- Overall testing: 303 tested (71.0%); 270 found among tested (89.1%).
- Domain coverage:
  - Production: 274 tested / 242 found
  - Perception: 12 tested / 11 found (all realization variables)
  - Metalinguistic: 69 tested / 66 found

## Variation Types & Selection
- Variation type mix: realization 355, order 41, both 31.
- Testing rates by type:
  - Realization: 76.6%
  - Order: 31.7%
  - Both: 58.1%
- Found rates among tested:
  - Realization: 88.6%
  - Order: 92.3%
  - Both: 94.4%

## Structure Notes
- Order variables are almost entirely from **LVC** (41 LVC vs 0 JSlx), creating a journal/type confound.
- Selection (whether a variable is tested) shows larger variation than outcomes once tested.
- Perception and metalinguistic domains are sparse for order/both variables, limiting domain‑specific comparisons.

## Implications for Modeling
- The joint selection–outcome model is justified; most signal appears in the selection stage.
- Sparse domains may require simplification (e.g., realization‑only models for perception).
- Journal effects must be interpreted cautiously due to confounding with order variables.

