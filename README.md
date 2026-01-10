# Grammatical Variation Meta-Study: A Bayesian Reanalysis

A multilevel Bayesian reanalysis of MacKenzie & Robinson (2025), which catalogued grammatical variables from *Language Variation and Change* and *Journal of Sociolinguistics* through 2023.

## Why Reanalyze?

The original analysis uses proportions and contingency table tests. This reanalysis applies a Gelman-style multilevel approach:

1. **Two-stage selection model** - separates P(variable tested) from P(significance found | tested)
2. **Cross-classified multilevel structure** - varying intercepts for paper, author, language, journal
3. **Multinomial outcome** - preserves the three-level structure (not analyzed / null / found)
4. **Domain-specific partial pooling** - separate estimates for production / perception / metalinguistic

## Data

This analysis uses the open database from:

> MacKenzie, Laurel, and Mary Robinson. 2025. "Spelling out grammatical variation." In *English Sociosyntax: Theory, Evidence, Approaches*, ed. Daniel Duncan and Mary Robinson, 59-95. Berlin: De Gruyter Mouton.

**To get the data:**

```bash
git clone https://github.com/laurelmackenzie/grammatical-variation-metastudy.git upstream
```

The data is also available as a [Google Sheet](https://docs.google.com/spreadsheets/d/1VzFpmDeR5bj1UBG5qSeEpZxatuUKQS8EJiTOrf8r-1Y/edit?usp=sharing).

## Requirements

- R (>= 4.0)
- Quarto
- R packages: tidyverse, brms, cmdstanr, tidybayes, here

## Project Structure

```
├── analysis/           # Quarto analysis documents
├── stan/               # Custom Stan models (if needed)
├── output/             # Model outputs, figures
├── LICENSE             # MIT
└── README.md
```

## License

The analysis code in this repository is released under the MIT License.

The underlying data is from MacKenzie & Robinson (2025) and should be cited accordingly.

## Citation

If you use this reanalysis, please cite both this repository and the original paper:

```bibtex
@incollection{mackenzie2025spelling,
  author    = {MacKenzie, Laurel and Robinson, Mary},
  title     = {Spelling out grammatical variation},
  booktitle = {English Sociosyntax: Theory, Evidence, Approaches},
  editor    = {Duncan, Daniel and Robinson, Mary},
  pages     = {59--95},
  year      = {2025},
  publisher = {De Gruyter Mouton},
  address   = {Berlin}
}
```
