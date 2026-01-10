# Forking Paths / Decisions Log

Purpose: track analytic decisions, alternatives, and their impact to reduce hidden flexibility.

## Template
- **Decision:**  
- **Status:** open / provisional / decided  
- **Options:**  
- **Chosen:**  
- **Rationale:**  
- **Impact:**  
- **Evidence/Link:**  
- **Date:** YYYY-MM-DD  

## Decisions

### NA coding for social-significance fields
- **Status:** provisional  
- **Options:** NA → `null` (analyzed, no effect); NA → `not analyzed`; NA → missing/unknown  
- **Chosen:** NA → `null` (for now)  
- **Rationale:** CSV lacks explicit `null` values despite Rmd logic; this preserves the intended three-level outcome.  
- **Impact:** Affects selection/outcome rates and model separation risk.  
- **Evidence/Link:** `analysis/01_data_prep.qmd`, `analysis/EDA_SUMMARY.md`  
- **Date:** 2026-01-10  

### Model structure: selection vs outcome
- **Status:** decided  
- **Options:** two-stage (uncorrelated); single multinomial; joint selection–outcome  
- **Chosen:** joint selection–outcome  
- **Rationale:** Explicitly models selection bias and allows shared structure.  
- **Impact:** Requires multivariate modeling; may need custom Stan if correlations are needed.  
- **Evidence/Link:** `analysis/00_analysis_plan.qmd`  
- **Date:** 2026-01-10  

### Domain-specific selection
- **Status:** decided  
- **Options:** domain-specific selection per production/perception/metalinguistic; global selection + domain outcomes  
- **Chosen:** domain-specific selection  
- **Rationale:** Directly evaluates bias toward production evidence.  
- **Impact:** More models; sparse domains may require simplification.  
- **Evidence/Link:** `analysis/00_analysis_plan.qmd`, `analysis/02_eda.qmd`  
- **Date:** 2026-01-10  

### Year effect
- **Status:** decided  
- **Options:** linear; smooth spline; decade bins  
- **Chosen:** linear  
- **Rationale:** Parsimonious baseline before testing more flexible trends.  
- **Impact:** Simpler interpretation; revisit if misfit emerges.  
- **Evidence/Link:** `analysis/00_analysis_plan.qmd`  
- **Date:** 2026-01-10  

### Priors (scale + structure)
- **Status:** decided  
- **Options:** Normal(0,1.5) vs tighter; Exponential(1) vs Exponential(2); data-centered intercepts  
- **Chosen:**  
  - **Primary (regularizing):** Normal(0,1.0) intercepts, Normal(0,0.5) slopes, Exponential(3) SDs  
  - **Sensitivity (centered):** Intercepts centered at logit(empirical tested / found rates), SD 0.7; slopes Normal(0,0.5); SDs Exponential(3)  
- **Rationale:** Prior predictive plots still too diffuse; further tightening to reduce extreme implied rates.  
- **Impact:** More regularization; transparency about dependence on baseline rates.  
- **Evidence/Link:** `analysis/02_eda.qmd`  
- **Date:** 2026-01-10  

### Author effects
- **Status:** open  
- **Options:** paper-only RE; first-author RE; multi-membership author RE  
- **Chosen:** paper + author IDs (current placeholder)  
- **Rationale:** Keep structure while deciding how to handle multi-authorship.  
- **Impact:** Possible conflation of authors; may need re-encoding.  
- **Evidence/Link:** `analysis/01_data_prep.qmd`, `analysis/02_eda.qmd`  
- **Date:** 2026-01-10  

### Journal confounding with variation type
- **Status:** open  
- **Options:** keep journal as fixed effect; drop journal; sensitivity model without order variables  
- **Chosen:** keep journal for now  
- **Rationale:** Important substantive question, but confounding is documented.  
- **Impact:** Interpret journal effects cautiously; consider sensitivity runs.  
- **Evidence/Link:** `analysis/EDA_SUMMARY.md`  
- **Date:** 2026-01-10  
