# Custom Stan vs brms Two-Stage OR Comparison

|response  |term                             |stan_estimate       |brms_estimate       |
|:---------|:--------------------------------|:-------------------|:-------------------|
|foundcond |Intercept                        |10.76 [3.31, 35.24] |17.86 [4.80, 67.86] |
|foundcond |journalLVC                       |1.34 [0.63, 2.83]   |1.06 [0.46, 2.27]   |
|foundcond |variation_type_recodeorder       |1.04 [0.42, 2.55]   |0.97 [0.39, 2.45]   |
|foundcond |variation_type_recoderealization |1.36 [0.60, 3.06]   |0.88 [0.37, 2.09]   |
|foundcond |year_z                           |1.27 [0.73, 2.22]   |1.20 [0.69, 2.05]   |
|tested    |Intercept                        |5.48 [2.07, 14.75]  |7.71 [2.50, 25.36]  |
|tested    |journalLVC                       |0.37 [0.17, 0.83]   |0.30 [0.14, 0.68]   |
|tested    |variation_type_recodeorder       |0.50 [0.21, 1.17]   |0.46 [0.19, 1.11]   |
|tested    |variation_type_recoderealization |2.33 [1.12, 4.89]   |1.87 [0.84, 4.05]   |
|tested    |year_z                           |1.65 [1.04, 2.67]   |1.63 [1.03, 2.59]   |
